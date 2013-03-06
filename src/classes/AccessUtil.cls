public with sharing class AccessUtil {
	public static User[] getMedicalFacilityUsers( ID medicalFacilityId ) {
      	Medical_Facility__c medicalFacility = [select Public_Group__c from Medical_Facility__c 
      			where id = :medicalFacilityId limit 1];
      	return [ Select Id, Name, Email from User where id in 
      			(select UserOrGroupId from GroupMember  
                             Where Group.Name = :medicalFacility.Public_Group__c) ];
	}
	public static User[] getFacilitatorOrgUsers() {
		PRM_Config__c prmConfig = [Select Public_Group__c from PRM_Config__c Limit 1];
      	return [ Select Id, Name, Email from User where id in 
      			(select UserOrGroupId from GroupMember  
                             Where Group.Name = :prmConfig.Public_Group__c) ];
	}

	public static User[] getInsuranceNetworkUsers() {
		Insurance_Network__c insNetwork = [Select Public_Group__c from Insurance_Network__c Limit 1];
      	return [ Select Id, Name, Email from User where id in 
      			(select UserOrGroupId from GroupMember  
                             Where Group.Name = :insNetwork.Public_Group__c) ];
	}
	
}