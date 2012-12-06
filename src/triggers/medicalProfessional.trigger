trigger medicalProfessional on Medical_Professional__c ( before insert, before update) {
    for (Medical_Professional__c mp : Trigger.new) {
        mp.Name = mp.Last_Name__c + ', '+ mp.First_Name__c + ' ' + mp.Middle_Name__c;
    }

}