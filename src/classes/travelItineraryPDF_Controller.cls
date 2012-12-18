public without sharing class travelItineraryPDF_Controller {

	public Treatment_Quote__c treatmentQuote {get;set;}
	public User TravelConcierge {get;set;}
	public string language {get;set;}

	public travelItineraryPDF_Controller(Apexpages.standardcontroller cont) {
		
		if (cont.getRecord() instanceof Treatment_Quote__c){
			treatmentQuote = getTreatmentQuote (cont.getId());
			TravelConcierge = getTravelConcierge();
			
			if(apexpages.currentPage().getparameters().get('lang')!=null){
				language = apexpages.currentPage().getparameters().get('lang');
			}
			else {
				try {
					// get from user
				}
				catch (exception e){
					
				}
				finally {
					language = 'English';
				}
			}
			 
		}
		else {
			//Apexpages.addMessage(new apexpages.message(Apexpages.severity.error,'Invalid Treatment Quote'));
		}
	}
	
	public Treatment_Quote__c getTreatmentQuote (id treatmentid) { //selective fields
		return	[Select	t.id,
						t.total_price__c,
							t.procedure__r.name,
							t.procedure__r.doctor__r.name,
							t.procedure__r.facility__r.name,
							t.procedure__r.facility__r.city__C,
							t.procedure__r.facility__r.country__c,
							t.procedure__r.facility__r.onsite_Coordinator__r.name,
							t.procedure__r.facility__r.onsite_coordinator__r.phone,
							t.procedure__r.facility__r.onsite_coordinator__r.mobilephone,
							t.procedure__r.facility__r.onsite_coordinator__r.email,
							t.treatment__r.patient__r.name,
							t.treatment__r.patient__r.createdby.name,
							t.treatment__r.patient__r.createdby.phone,
							t.treatment__r.patient__r.createdby.email,
							t.treatment__r.patient__r.phone__c,
							t.treatment__r.procedure_date__c,
							t.treatment__r.travel__r.companion__c,
							t.treatment__r.travel__r.travel_start__c,
							t.treatment__r.travel__r.travel_end__c,
							t.treatment__r.travel__r.Arrival_Airport_Code__c,
							t.treatment__r.travel__r.Departure_Airport_Code__c,
							t.treatment__r.travel__r.Arrival_Airline__c,
							t.treatment__r.travel__r.Departure_Airline__c,
							t.treatment__r.travel__r.Arrival_Flight_No__c,
							t.treatment__r.travel__r.Departure_Flight_No__c,
							t.treatment__r.travel__r.Notes__c,		
							t.treatment__r.travel__r.hotel__r.name,
							t.treatment__r.travel__r.hotel__r.address__c, 
							t.treatment__r.travel__r.hotel__r.phone__c,
							t.treatment__r.travel__r.hotel_checkin__c,
							t.treatment__r.travel__r.hotel_checkout__c
					From Treatment_Quote__c t 
					where id = :treatmentid];
}
	
	public User getTravelConcierge() { //all fields
		return [Select u.Name,
						u.Phone,
						u.MobilePhone,
						u.Email
/*		u.WorkspaceId, 
						u.Username, 
						u.UserType, 
						u.UserRoleId, 
						u.UserPreferencesTaskRemindersCheckboxDefault, 
						u.UserPreferencesReminderSoundOff, 
						u.UserPreferencesOptOutOfTouch, 
						u.UserPreferencesHideCSNGetChatterMobileTask, 
						u.UserPreferencesHideCSNDesktopTask, 
						u.UserPreferencesEventRemindersCheckboxDefault,
						u.UserPreferencesEnableAutoSubForFeeds,
						u.UserPreferencesDisableSharePostEmail,
						u.UserPreferencesDisableProfilePostEmail,
						u.UserPreferencesDisableMessageEmail,
						u.UserPreferencesDisableMentionsPostEmail,
						u.UserPreferencesDisableLikeEmail,
						u.UserPreferencesDisableLaterCommentEmail,
						u.UserPreferencesDisableFollowersEmail,
						u.UserPreferencesDisableFileShareNotificationsForApi,
						u.UserPreferencesDisableChangeCommentEmail,
						u.UserPreferencesDisableBookmarkEmail,
						u.UserPreferencesDisableAllFeedsEmail,
						u.UserPreferencesDisProfPostCommentEmail,
						u.UserPreferencesDisMentionsCommentEmail,
						u.UserPreferencesDisCommentAfterLikeEmail,
						u.UserPreferencesApexPagesDeveloperMode,
						u.UserPreferencesActivityRemindersPopup,
						u.UserPermissionsSupportUser,
						u.UserPermissionsSiteforcePublisherUser,
						u.UserPermissionsSiteforceContributorUser,
						u.UserPermissionsSFContentUser,
						u.UserPermissionsOfflineUser,
						u.UserPermissionsMobileUser,
						u.UserPermissionsMarketingUser,
						u.UserPermissionsKnowledgeUser,
						u.UserPermissionsInteractionUser,
						u.UserPermissionsCallCenterAutoLogin,
						u.Travel_Concierge__c,
						u.Title,
						u.TimeZoneSidKey,
						u.SystemModstamp,
						u.Street,
						u.State,
						u.SmallPhotoUrl,
						u.ReceivesInfoEmails,
						u.ReceivesAdminInfoEmails,
						u.Receive_Staff_Messages__c,
						u.Receive_Portal_Messages__c,
						u.ProfileId,
						u.PostalCode,
						u.PortalRole,
						u.OfflineTrialExpirationDate,
						u.OfflinePdaTrialExpirationDate,
						u.MobilePhone,
						u.ManagerId,
						u.LocaleSidKey,
						u.LastPasswordChangeDate,
						u.LastName,
						u.LastModifiedDate,
						u.LastModifiedById,
						u.LastLoginDate,
						u.LanguageLocaleKey,
						u.IsPortalSelfRegistered,
						u.IsPortalEnabled,
						u.IsActive,
						u.Id,
						u.FullPhotoUrl,
						u.ForecastEnabled,
						u.FirstName,
// u.FederationIdentifier, 
						u.Fax,
						u.Extension,
						u.EmployeeNumber,
						u.EmailEncodingKey,
						u.Division,
						u.DigestFrequency,
						u.Department,
						u.DelegatedApproverId,
						u.DefaultGroupNotificationFrequency,
						u.CreatedDate,
						u.CreatedById,
						u.Country,
						u.ContactId,
						u.CompanyName,
						u.CommunityNickname,
						u.City,
						u.CallCenterId,
						u.Alias,
						u.AccountId, 
						u.AboutMe */ 
					From User u 
					where Travel_Concierge__c = true 
					limit 1];
	}
}