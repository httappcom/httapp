trigger SurveyHeader on Survey_Header__c (after Insert) {
    if (trigger.isAfter && trigger.isInsert) {
        Set<ID> patientIds = new Set<ID>();
        Set<ID> treatmentIds = new Set<ID>();
        for (Survey_Header__c header : Trigger.new) {
            treatmentIds.add(header.Treatment__c);
            patientIds.add(header.Patient__c);
        }
        Map<ID,Treatment__c> treatmentMap = new Map<ID, Treatment__c>([select Id from Treatment__c where Patient__c in :patientIds]);
        treatmentIds.addAll(treatmentMap.keySet());
        TreatmentUtility.updateSharingForTreatmentRelated( treatmentIds );
    }
}