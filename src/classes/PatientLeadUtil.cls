public without sharing class PatientLeadUtil {
	public static void execute() {
    	Map<String, Schema.SObjectField> fldObjMap = schema.SObjectType.Patient_Lead__c.fields.getMap();
    	List<Schema.SObjectField> fldObjMapValues = fldObjMap.values();
    	String queryString = 'SELECT ';
    	for(Schema.SObjectField s : fldObjMapValues) {
        	String fieldName = s.getDescribe().getName();     
        	queryString += fieldName + ',';
      	}
      	// Trim last comma
      	queryString = queryString.subString(0, queryString.length() - 1);    
      	queryString += ' FROM Patient_Lead__c WHERE Deserialized__c = false FOR UPDATE';
      	List<Patient_Lead__c> newLeads = Database.query(queryString);
      	Set<String> externalIdCandidates = new Set<String>(); 
      	for (Patient_Lead__c patientLead : newLeads) {
        	if (patientLead.Email__c != null) {
        		externalIdCandidates.add(patientLead.Email__c);
        	} else if (patientLead.Phone__c != null) {
        		externalIdCandidates.add(patientLead.Phone__c);
        	}
      	}
      	Patient__c[] existingPatients = new List<Patient__c>();
      	if (externalIdCandidates.size()>0) {
	      	String pQry = 'select id,External_Id__c from Patient__c where ';
    	  	String delim = '';
      		for (String x : externalIdCandidates) {
      			pQry += delim + 'External_Id__c like \''+String.escapeSingleQuotes(x)+'%\'';
	      		delim = ' OR ';
      		}
  system.debug('pQry='+pQry);
	      	existingPatients = Database.query(pQry);
      	}
      	Logger.info('existingPatients: ' + existingPatients );
      	Set<String> existingExternalIds = new Set<String>();
      	for (Patient__c p: existingPatients) {
          	existingExternalIds.add(p.External_Id__c);          
      	}
      	Logger.info('existingExternalIds: ' + existingExternalIds );
      	List<Patient__c> patientsToInsert = new List<Patient__c>();
      	List<Travel__c> travelsToInsert = new List<Travel__c>();
      	List<Treatment__c> treatmentsToInsert = new List<Treatment__c>();
      	for (Patient_Lead__c patientLead : newLeads) {
      		Logger.info('patientLead: ' + newLeads);
      		RequestQuoteController rqc = new RequestQuoteController();      	
      		rqc.deserializeLeadInfo(patientLead);
      		String externalPatientID = null;
      		if (patientLead.Email__c != null) {
	      		if (!existingExternalIds.contains(patientLead.Email__c)) {
system.debug('gh1');
    	  			existingExternalIds.add(externalPatientID = patientLead.Email__c);
	      		} else {
system.debug('gh2');
	      			externalPatientId = findUniqueExtId( patientLead.Email__c, existingExternalIds );
	      		}
      		} else if (patientLead.Phone__c != null) {
      			if (!existingExternalIds.contains(patientLead.Phone__c)) {
system.debug('gh3');
      				existingExternalIds.add(externalPatientID = patientLead.Phone__c);
      			} else {
system.debug('gh4');
	      			externalPatientId = findUniqueExtId( patientLead.Phone__c+'-', existingExternalIds );
      			}
      		} else {
system.debug('gh5');
      			externalPatientId = PatientUtil.createUniqueId();
      		} 
  system.debug('extPatientId='+externalPatientID);
      		String externalTravelID = PatientUtil.createUniqueID();
      		Patient__c patientReference = new Patient__c(External_ID__c = externalPatientID);
      		Travel__c travelReference = new Travel__c(External_id__c = externalTravelID);
      		Patient__c patient = rqc.patient;
      		patient.External_ID__c = externalPatientID;
        	Treatment__c treatment = rqc.treatment;
        	Travel__c travel = new Travel__c(External_id__c = externalTravelID);
        	treatment.Patient__r = patientReference;
        	treatment.Travel__r = travelReference;
/*        	if (existingPatientEmails.contains(patient.Email__c)) {        
        	Logger.info('Found existing patient with email ' + patient.Email__c);	
        	for (Patient__c p : existingPatients)
        	{
        		if (p.Email__c == patient.Email__c)
        		{
        			Map<String, Schema.SObjectField> patientFieldMap = schema.SObjectType.Patient__c.fields.getMap();
              List<Schema.SObjectField> patientFieldValues = patientFieldMap.values();
				      for(Schema.SObjectField s : patientFieldValues)
				      {
				         String fieldName = s.getDescribe().getName();     
				         if (patient.get(fieldName) != null) p.put(fieldName, patient.get(fieldName));
				      }
              patientsToUpdate.add(p);
              Logger.info('Added patient to be updated: '+ p);
        		}
        	}
        }
        else*/
         	patientsToInsert.add(patient);
		    treatment.Assigned_To__c = DefaultUsersUtil.getPCCManager().Id;      	
        	if (treatment.Payment_Type__c == null) treatment.Payment_Type__c = PickListDefines.PaymentType.Cash;           
        	patientLead.Deserialized__c = true;        
        	travelsToInsert.add(travel);
        	treatmentsToInsert.add(treatment);       
      	}
	    try {
//        	Update patientsToUpdate;
        	Insert patientsToInsert;
        	Insert travelsToInsert;
	        Insert treatmentsToInsert;
	        Update newLeads;
	    }
	    catch (DmlException dmlEx)
	    {
	      Logger.info('DML Exception: '+ dmlEx);
	    }      
	}
	
	private static String findUniqueExtId( String prefix, Set<String> existingExternalIds) {
		String extId = null;
		for (Integer i=1;i<50;i++) {
			extId = prefix+i;
system.debug('Trying extId='+extId);
			if (!existingExternalIds.contains(extId)) {
				existingExternalIds.add(extId);
system.debug('found extId='+extId);
				return extId;
			}
		}
		extId = PatientUtil.createUniqueId();
		existingExternalIds.add(extId);
		return extId;
	}
}