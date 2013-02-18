trigger medicalProfessional on Medical_Professional__c ( before insert, before update, after insert, after update) {
  if ((trigger.isBefore && trigger.isInsert) || (trigger.isBefore && trigger.isUpdate))
  {
		for (Medical_Professional__c mp : Trigger.new) {
		    mp.Name = mp.Last_Name__c;
		    if (mp.First_Name__c != null) {
		    	mp.Name += ', '+ mp.First_Name__c;
		    }
		    if (mp.Middle_Name__c != null) {
		    	mp.Name += ' ' + mp.Middle_Name__c;
		    }
		}
  }
	if (trigger.isAfter && trigger.isUpdate) {
		for (Medical_Professional__c newMP : trigger.newMap.values())
		{
		  if ((newMP.Email__c != null) && (trigger.oldMap.get(newMP.Id).Email__c == null))
		  {
		    ProviderUtil.createProviderPortalUser(newMP.Id);
		  }
		} 
  }
  if (trigger.isAfter && trigger.isInsert)
  {
    for (Medical_Professional__c newMP : trigger.newMap.values())
    {
      if (newMP.Email__c != null) 
      {
        ProviderUtil.createProviderPortalUser(newMP.Id);
      }
    }  	
  }
}