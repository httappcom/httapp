trigger medicalProfessional on Medical_Professional__c ( before insert, before update) {
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