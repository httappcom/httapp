public with sharing class TaskUtility {
	
	private static String testTaskSpecifier = 
		'Task:\nAssigned To:Onsite_Coordinator__c\nSubject:Onsite Coordinator Subject\nDue Date:3/1/2013\n\n'+
		'Task:\nAssigned To:Insurance_Network_Contact__c\nSubject:Ins Network Subject\nDue Date:3/2/2013\n\n'+
		'Task:\nAssigned To:Travel Concierge\nSubject:Travel Concierge Subject\nDue Date:3/3/2013\n\n'+
		'Task:\nAssigned To:Medical Information Officer\nSubject:Med Info Officer Subject\nDue Date:3/4/2013\n';

	public static List<Task> parseTreatmentTasks( String tasksSpecifier, Treatment__c treatment ) {
		if (tasksSpecifier==null || tasksSpecifier=='') return null;
		List<Task> taskList = new List<Task>();
		Task curTask = null;
		String[] lines = tasksSpecifier.split('\n');
		Integer i=0;
		while (i<lines.size()) {
			String line = lines[i].toLowerCase();
			if (line.length()==0) continue;
			if (line == 'task:') {
				i++;
system.debug('line='+line);
				curTask = new Task();
				curTask.WhatId = treatment.id;
				taskList.add(curTask);
				for (Integer ii=0;ii<3;ii++) {
					line = lines[i+ii];
system.debug('line 2='+line);
					parseTaskSpecifierLine( treatment, curTask, line, i+ii);
				}
				i += 4;
			}
		}
		return taskList;
	}
	
	private static void parseTaskSpecifierLine( Treatment__c treatment, Task task, String line, Integer lineIdx) {
		Integer pos = line.indexOf(':');
		if (pos<0) throw new NueException('Missing task specifier token.');
		String fieldType = line.substring(0,pos);
		if (line.length() <= (pos+1)) throw new NueException('Missing task specifier data.');
		String data = line.substring(pos+1);
		if (fieldType == 'assigned to') {
			if (data == 'medical information officer') {
				User user = DefaultUsersUtil.getMedicalInformationOfficer();
				if (user == null) throw new NueException('No Medical Information Officer defined.');
				task.OwnerId = user.id;
			} else if (data == 'travel concierge') {
				User user = DefaultUsersUtil.getTravelConcierge();
				if (user == null) throw new NueException('No Travel Concierge defined.');
				task.OwnerId = user.id;
			} else {
				task.OwnerId = (ID)treatment.get(data);
			}
			if (task.OwnerId == null) {
				throw new NueException('No "Assigned To" specified for task.');
			}
		} else if (fieldType == 'subject') {
			task.Subject = data;
		} else if (fieldType == 'due date') {
			String[] dateParts = data.split('-');
			task.ActivityDate = Date.newInstance(Integer.valueOf(dateParts[0]), Integer.valueOf(dateParts[1]), Integer.valueOf(dateParts[2]));
		} else {
			throw new NueException('Task parsing error - for line '+lineIdx+': '+line);
		}
	}
	
	public static void testMe() {
		Treatment__c[] treatments = [select id, Onsite_Coordinator__c, Insurance_Network_Contact__c 
			from Treatment__c
				where Insurance_Network_Contact__c<> null and Onsite_Coordinator__c<>null limit 1];
system.debug('treatment='+treatments[0].id);
		List<Task> l = parseTreatmentTasks( testTaskSpecifier, treatments[0] );
		insert l;
	}
}