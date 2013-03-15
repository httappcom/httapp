public with sharing class TaskSpecifierUtility {
	private static Map<String, Task_Specifier__c> taskSpecifierCache = null;
	public static void loadTaskSpecifierCache() {
		if (taskSpecifierCache==null) {
			Task_Specifier__c[] specifiers = [SELECT Due_Date_Time_Field__c, Name, Offset_Value__c, Operation__c, Subject__c, Assigned_To_Field__c, Assigned_to_Fallback__c FROM Task_Specifier__c];
			taskSpecifierCache = new Map<String, Task_Specifier__c>();
			for (Task_Specifier__c specifier : specifiers) {
				taskSpecifierCache.put(specifier.Name, specifier);
			}
		}
	}
	public static Task_Specifier__c getTaskSpecifier( String name ) {
		return taskSpecifierCache.get(name); 
	}

    public static void beforeInsertOrUpdate( List<Task_Specifier__c> taskSpecifiers ) {
    	loadMetaData();
        for (Task_Specifier__c taskSpecifier : taskSpecifiers) {
        	if (!isValidAssignedToField( taskSpecifier.Assigned_To_Field__c)) {
        		throw new NueException('Please enter a valid "Assigned To" field (must be Treatment User-type field or User Boolean-type field).');
        	}
        	if (!isValidDueDateField( taskSpecifier.Due_Date_Time_Field__c)) {
        		throw new NueException('Please enter a valid "Due Date" field, "TODAY" or "NOW" (must be Treatment Date or Datetime-type field or "TODAY/NOW").');
        	}
        }
    }
    public static Set<String> validTreatmentAssignedToFields = null;
    public static Set<String> defaultUserIndicatorFields = null;
    public static Set<String> validDueDateFields = null;
    public static void loadMetaData() {
        if (validTreatmentAssignedToFields == null) {
        	validTreatmentAssignedToFields = new Set<String>();
        	defaultUserIndicatorFields = new Set<String>();
        	validDueDateFields = new Set<String>();
            Map<String,Schema.SObjectField> treatmentFieldMap = Treatment__c.getSObjectType().getDescribe().fields.getMap();
            for (Schema.SObjectField sObjFld : treatmentFieldMap.values()) {
            	 Schema.DescribeFieldResult fldInfo = sObjFld.getDescribe();
            	 if (fldInfo.getSoapType() == Schema.Soaptype.ID && (fldInfo.getReferenceTo()+'') == '(User)') {
            	 	validTreatmentAssignedToFields.add(fldInfo.getName());
            	 } else if (fldInfo.getSoapType() == Schema.Soaptype.DATE || fldInfo.getSoapType() == Schema.Soaptype.DATETIME) {
            	 	validDueDateFields.add(fldInfo.getName());
            	 }
            }
            Map<String,Schema.SObjectField> userFieldMap = User.getSObjectType().getDescribe().fields.getMap();
            Default_User_Indicator_Field__c[] defaultFieldObjs = [select name from Default_User_Indicator_Field__c]; 
            for (Default_User_Indicator_Field__c fldObj : defaultFieldObjs) {
            	String fieldName = fldObj.name;
            	if (userFieldMap.containsKey(fieldName)) {
            	 	defaultUserIndicatorFields.add(fieldName);
            	}
            }
        }
    }
    private static Boolean isTreatmentAssignedToField( String fieldName ) {
        return validTreatmentAssignedToFields.contains(fieldName);
    }
	private static Boolean isDefaultUserAssignedToField( String fieldName ) {
        return defaultUserIndicatorFields.contains(fieldName);
    }
    private static Boolean isValidAssignedToField( String fieldName ) {
        return isTreatmentAssignedToField(fieldName) || isDefaultUserAssignedToField(fieldName);
    }
    private static Boolean isValidDueDateField( String fieldName ) {
    	if (fieldName == 'TODAY' || fieldName == 'NOW') return true;
        return validDueDateFields.contains(fieldName);
    }

	public static List<Task> parseSpecifiers( Treatment__c treatment, String specifiers ) {
		if (specifiers==null || specifiers=='') return null;
		List<String> specifierList = parseList(specifiers);
system.debug('parseSpecifiers list='+specifierList);
		List<Task> taskList = new List<Task>();
		for (String specifier : specifierList) {
			Task task = createTaskFromSpecifier( treatment, specifier );
system.debug('task created from specifier='+task);
			if (task != null) {
				taskList.add(task);
			}
		}
		return taskList;
	}
	
	private static List<String> parseList( String taskSpecifiers ) {
		if (taskSpecifiers==null || taskSpecifiers=='') return null;
		List<String> taskSpecifierList = taskSpecifiers.split(';');
		for (Integer i=0;i<taskSpecifierList.size();i++) {
			taskSpecifierList[i] = taskSpecifierList[i].trim();
		}
		return taskSpecifierList;
	}

	private static Task createTaskFromSpecifier( Treatment__c treatment, String specifierName ) {
		Task_Specifier__c specifier = getTaskSpecifier( specifierName );
		if (specifier == null) {
			throw new NueException('No Task Specifier found for '+specifierName);
		}
		ID userId = null;
		if (isDefaultUserAssignedToField(specifier.Assigned_To_Field__c)) {
			User user = DefaultUsersUtil.getDefaultUser(specifier.Assigned_To_Field__c);
			if (user != null) userId = user.id;
		} else if (isTreatmentAssignedToField(specifier.Assigned_To_Field__c)) {
			userId = (ID)treatment.get(specifier.Assigned_To_Field__c);
		}
		if (userId == null) //Assigned_To_Field__c did not produce a user; try Assigned_To_Fallback__c
		{
	    if (isDefaultUserAssignedToField(specifier.Assigned_to_Fallback__c)) {
	      User user = DefaultUsersUtil.getDefaultUser(specifier.Assigned_to_Fallback__c);
	      if (user != null) userId = user.id;
	    } else if (isTreatmentAssignedToField(specifier.Assigned_to_Fallback__c)) {
	      userId = (ID)treatment.get(specifier.Assigned_to_Fallback__c);     
	    }			
		}
		if (userId == null) 
		throw new NueException('No User found for assigned to field '+specifier.Assigned_To_Field__c);
		Task task = new Task();
		task.ownerId = userId;
system.debug('owner id='+userId);
		Datetime dt = null;
		if (specifier.Due_Date_Time_Field__c == 'NOW') {
			dt = Datetime.now();
		} else if (specifier.Due_Date_Time_Field__c == 'TODAY') {
			dt = Datetime.newInstance(Date.today(), Time.newInstance(0,0,0,0));
		} else {
			Object obj = treatment.get(specifier.Due_Date_Time_Field__c);
			if (obj!=null) {
				if (obj instanceOf Date) {
					dt = Datetime.newInstance((Date)obj, Time.newInstance(0,0,0,0));
				} else if (obj instanceOf Datetime) {
					dt = (Datetime)obj;
				}
				if (specifier.Operation__c != null && specifier.Offset_Value__c != null) {
					if (specifier.Operation__c == 'Add Hours') {
						dt.addHours(specifier.Offset_Value__c.intValue());
					} else if (specifier.Operation__c == 'Add Days') {
						dt.addDays(specifier.Offset_Value__c.intValue() );
					} else if (specifier.Operation__c == 'Subtract Hours') {
						dt.addHours( -specifier.Offset_Value__c.intValue() );
					} else if (specifier.Operation__c == 'Subtract Days') {
						dt.addDays( -specifier.Offset_Value__c.intValue() );
					}
				}
			}
		}
		if (dt != null) {
			task.ActivityDate = dt.date();
		}
		task.WhatId = treatment.id;
		task.Subject = specifier.Subject__c;
		return task;
	}
}