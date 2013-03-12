public with sharing class MedicalFacilityUtil {
	public static void afterInsertOrUpdate( Map<ID,Medical_Facility__c> medFacMap ) {
		Set<ID> medFacIds = medFacMap.keySet();
		Set<String> groupNames = new Set<String>();
		List<Medical_Facility__c> medFacs = [select Id, Public_Group__c from Medical_Facility__c where id in :medFacIds];
		for (Medical_Facility__c medFac : medFacs) {
			if (medFac.Public_Group__c != null) {
				groupNames.add(medFac.Public_Group__c);
			}
		}
system.debug('groupNames='+groupNames);
		List<Group> groups = [select id, Name from Group where Name in :groupNames];
		Map<String, ID> groupNameToIdMap = new Map<String, ID>();
		for (Group grp: groups) {
			groupNameToIdMap.put(grp.Name, grp.Id);
		}
		Medical_Facility__Share[] medFacShares = [SELECT Id,ParentId,RowCause,UserOrGroupId FROM Medical_Facility__Share
			where ParentId in :medFacIds];
system.debug('medFacShares='+medFacShares);
		Map<String, Medical_Facility__Share> medFacShareMap = new Map<String, Medical_Facility__Share>();
		for (Medical_Facility__Share medFacShare : medFacShares) {
system.debug('put in map with key='+medFacShare.ParentId+'+'+medFacShare.UserOrGroupId);
			medFacShareMap.put(medFacShare.ParentId+'+'+medFacShare.UserOrGroupId, medFacShare);
		}
		List<Medical_Facility__Share> insertShares = new List<Medical_Facility__Share>();
		for (Medical_Facility__c medFac : medFacs) {
			if (medFac.Public_Group__c != null) {
				ID grpId = groupNameToIdMap.get(medFac.Public_Group__c);
				String key = medFac.Id+'+'+grpId;
system.debug('looking for share with key='+medFac.Id+'+'+grpId);
				if (!medFacShareMap.containsKey(key)) {
					insertShares.add(new Medical_Facility__Share(
						ParentId = medFac.Id,
						RowCause = Schema.Medical_Facility__Share.RowCause.Care_Team__c,
						AccessLevel = 'edit',
						UserOrGroupId = grpId
					));
				}
			}
		}
system.debug('insertShares='+insertShares);
		if (insertShares.size()>0) {
			insert insertShares;
		} 
	}
}