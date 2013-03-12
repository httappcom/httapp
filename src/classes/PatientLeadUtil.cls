public with sharing class PatientLeadUtil {
	public static void execute() {
      Map<String, Schema.SObjectField> fldObjMap = schema.SObjectType.Patient_Lead__c.fields.getMap();
      List<Schema.SObjectField> fldObjMapValues = fldObjMap.values();
      String queryString = 'SELECT ';
      for(Schema.SObjectField s : fldObjMapValues)
      {
         String fieldName = s.getDescribe().getName();     
         queryString += fieldName + ',';
      }
      // Trim last comma
      queryString = queryString.subString(0, queryString.length() - 1);    
      queryString += ' FROM Patient_Lead__c WHERE Deserialized__c = false FOR UPDATE';
      List<Patient_Lead__c> newLeads = Database.query(queryString);
      List<String> patientLeadEmails = new List<String>(); 
      for (Patient_Lead__c patientLead : newLeads) patientLeadEmails.add(patientLead.Email__c);
      Patient__c[] existingPatients = [Select Id, Email__c, External_ID__c from Patient__c Where Email__c in : patientLeadEmails Order By Email__c, LastModifiedDate DESC];
      Logger.info('existingPatients: ' + existingPatients );
      Set<String> existingPatientEmails = new Set<String>();
      Patient__c[] existingPatientsTemp = new List<Patient__c>();
      for (Patient__c p: existingPatients)
      {
      	if (! existingPatientEmails.contains(p.Email__c)) //
      	{
      		existingPatientsTemp.add(p);
          existingPatientEmails.add(p.Email__c);          
      	}
      }
      existingPatients.clear();
      existingPatients.addAll(existingPatientsTemp);
      Logger.info('existingPatients: ' + existingPatients );            
      Logger.info('existingPatientEmails: ' + existingPatientEmails );
      List<Patient__c> patientsToInsert = new List<Patient__c>();
      List<Patient__c> patientsToUpdate = new List<Patient__c>();
      List<Travel__c> travelsToInsert = new List<Travel__c>();
      List<Treatment__c> treatmentsToInsert = new List<Treatment__c>();
      for (Patient_Lead__c patientLead : newLeads)
      {
      	Logger.info('patientLead: ' + newLeads);
      	RequestQuoteController rqc = new RequestQuoteController();      	
      	rqc.deserializeLeadInfo(patientLead);
      	String externalPatientID = PatientUtil.createUniqueID();
      	String externalTravelID = PatientUtil.createUniqueID();
      	Patient__c patientReference = new Patient__c(External_ID__c = externalPatientID);
      	Travel__c travelReference = new Travel__c(External_id__c = externalTravelID);
      	Patient__c patient = rqc.patient;
      	patient.External_ID__c = externalPatientID;
        Treatment__c treatment = rqc.treatment;
        Travel__c travel = new Travel__c(External_id__c = externalTravelID);
        treatment.Patient__r = patientReference;
        treatment.Travel__r = travelReference;           
        if (existingPatientEmails.contains(patient.Email__c))	
        {        
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
        else patientsToInsert.add(patient);
		    treatment.OwnerId = DefaultUsersUtil.getPCCManager().Id;      	
        if (treatment.Payment_Type__c == null) treatment.Payment_Type__c = PickListDefines.PaymentType.Cash;           
        patientLead.Deserialized__c = true;        
        travelsToInsert.add(travel);
        treatmentsToInsert.add(treatment);       
      }
	    try
	    {
        Update patientsToUpdate;
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
}