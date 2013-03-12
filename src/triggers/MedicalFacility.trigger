trigger MedicalFacility on Medical_Facility__c (after Insert, after Update) {
    if ( trigger.isAfter && (trigger.isInsert || Trigger.isUpdate)) {
        MedicalFacilityUtil.afterInsertOrUpdate( Trigger.newMap );
    }
}