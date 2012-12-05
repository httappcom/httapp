/**
* TreatmentTests.cls
* Description : Testing of the Treatment object and all related functionality
* @author M. Wicherski, MK Partners 2012
*/ 

@istest
private class TreatmentTests {

	static Patient__c patient {get;set;}
	static Treatment__c treatment {get;set;}
	static Treatment__c treatmentCheck {get;set;} //used for verification queries
	static Travel__c travel {get;set;}
	
	/**
	 * Main Test Method
	 */
	static testmethod void TreatmentTests () {
		
		/* Test Data */
		//patient with name 'test patient' and email 'test@test.com'
		patient = newPatient('test patient', 'test@test.com');
        insert patient;
        
        //treatment for patient
		travel = newTravel(patient);
		insert travel;
        treatment = newTreatment(patient);
        treatment.Travel__c = travel.id;
        insert treatment;
		
		//travel for patient for treatment
		
		/* Tests */
		verifySyncPatientEmail (); 
		
		/*Inquiry Phase*/
		setPhaseToInquiry(); // stage to 'New'
		setPhaseInquiryStageResponding();
		setPhaseInquiryStageContactMade();
		setPhaseInquiryStageLost();
		
		/*Interaction Phase*/
		setPhaseToInteraction(); // stage to 'Contact Established'
		setPhaseInteractionStageInterestedBHFL();
		setPhaseInteractionStageMedicalInfo();
		setPhaseInteractionStageTreatmentApproval();
		setPhaseInteractionStageQuoting();
		setPhaseInteractionStagePatientOnHold();
		setPhaseInteractionStageConsult();
		setPhaseInteractionStageTravelConverted();
		setPhaseInteractionStagePatientLost();
		
		/*Travel Phase*/
		setPhaseToTravel();
		setPhaseTravelStageAtProvider();
		setPhaseTravelStagePostTreatment();
		
		/*Post-Op Phase*/
		setPhaseToPostOp();
		setPaymentTypeCash();
		setPhasePostOpStageOngoing();
		setPhasePostOpStageTerminated();
	}





	/* SUB TEST METHODS FOR SPECIFIC FUNCTION */

	/**
	 * Verifies that the patient email is synced to Treatment on insert/update
	 * ASSERT: Patient email = Treatment Patient Email
	 */
	static void verifySyncPatientEmail() {
		//from insert
        treatmentCheck = [select patient_email__c
        					from Treatment__c where Id = :treatment.id];
        System.assertEquals(patient.email__c, treatmentCheck.patient_email__c);
        
        treatment.patient_email__c = null;
        update treatment;
        
        //from update
        treatmentCheck = [select patient_email__c
        					from Treatment__c where Id = :treatment.id];
        System.assertEquals(patient.email__c, treatmentCheck.patient_email__c);
	}
	
	/**
	 * Sets Treatment phase to Inquiry
	 */
	static void setPhaseToInquiry() {
		treatment.Phase__c ='(1) Inquiry';
		treatment.Stage__c = 'New';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Inquiry, stage Contact Made
	 * ASSERT: Workflow updates to Interaction phase, stage Contact Established
	 */	
	static void setPhaseInquiryStageContactMade() {
		treatment.Phase__c ='(1) Inquiry';
		treatment.Stage__c ='Contact Made';
		update treatment;
		
		treatmentCheck = [select id, phase__c, stage__c 
						from Treatment__c where id =:treatment.id];
		
		System.assertEquals('(2) Interaction', treatmentCheck.Phase__c);
		System.assertEquals('Contact Established', treatmentCheck.stage__c);
	}
	
	/**
	 * Sets Treatment phase to Inquiry, stage Responding
	 */		
	static void setPhaseInquiryStageResponding() {
		treatment.Phase__c ='(1) Inquiry';
		treatment.stage__c = 'Responding';
		update treatment;
		
		//substages
		setAllPhaseInquiryStageRespondingSubstages();
	}
	
	/** 
	 * Iterates through all the substages of Inquiry - Responding
	 */
	
	static void setAllPhaseInquiryStageRespondingSubstages () {
		treatment.Phase__c ='(1) Inquiry';
		treatment.stage__c = 'Responding';
		treatment.Sub_Stage__c = 'Response 1';
		update treatment;
		
		treatment.Sub_Stage__c = 'Response 2';
		update treatment;
		
		treatment.Sub_Stage__c = 'Response 3';
		update treatment;
		
		treatment.Sub_Stage__c = 'Response 4';
		update treatment;
	}	
	
	/**
	 * Sets Treatment phase to Inquiry, stage Lost
	 * ASSERT: Validation rule now active for Patient Not Committed Reason
	 */		
	static void setPhaseInquiryStageLost(){
		treatment.Phase__c ='(1) Inquiry';
		treatment.stage__c = 'Lost';
		
		boolean inquiryLostValidationSuccess = false;
		try{
			update treatment;
		}
		catch(Exception e) {
			inquiryLostValidationSuccess = true;
		}
								
		System.assertEquals(true,inquiryLostValidationSuccess);	
		
		treatment.Patient_Not_Committed_Reason__c = 'Test Reason';
		update treatment;			
	}
	
	/**
	 * Sets Treatment phase to Interaction, stage Contact Established
	 */		
	static void setPhaseToInteraction() {
		treatment.Phase__c = '(2) Interaction';
		treatment.Stage__c = 'Contact Established';
		update treatment;
		
		//substage
		treatment.Sub_Stage__c = 'Treatment Information Given';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Interaction, stage Interested but Hold for Later
	 */		
	static void setPhaseInteractionStageInterestedBHFL() {
		treatment.Phase__c = '(2) Interaction';
		treatment.Stage__c = 'Interested but Hold for Later';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Interaction, stage Medical Information
	 */		
	static void setPhaseInteractionStageMedicalInfo(){
		treatment.Phase__c = '(2) Interaction';
		treatment.Stage__c = 'Medical Information';
		update treatment;
		
		//substages
		treatment.Sub_Stage__c = 'Patient Providing Medical Information';
		update treatment;
		
		treatment.sub_stage__c = 'Medical Records Requested';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Interaction, stage Treatment Approval Requested
	 * ASSERT: Stage changed to 'Patient Lost' from substage 'No Treatment'
	 * ASSERT: Substage cleared when stage set to patient lost
	 */		
	static void setPhaseInteractionStageTreatmentApproval(){
		treatment.Phase__c = '(2) Interaction';
		treatment.Stage__c = 'Treatment Approval Requested';
		update treatment;
		
		treatment.sub_stage__c = 'Treatment Approval Requested';
		update treatment;
		
		treatment.sub_stage__c = 'Treatment Approved';
		update treatment;
		
		treatment.sub_stage__c = 'No Treatment';
		update treatment;
		
		treatmentCheck = [select id, phase__c, stage__c, sub_stage__c 
							from treatment__c where id = :treatment.id];
		
		System.assertEquals('Patient Lost',treatmentCheck.stage__c);
		system.assertEquals(null, treatmentCheck.sub_stage__c);
	}
	
	/**
	 * Sets Treatment phase to Interaction, stage Quoting
	 */		
	static void setPhaseInteractionStageQuoting(){
		treatment.Phase__c = '(2) Interaction';
		treatment.Stage__c = 'Quoting';
		update treatment;
		
		
		//substages
		treatment.sub_stage__c = 'Quote in Process';
		update treatment;
		
		treatment.sub_stage__c = 'Quote Signed';
		update treatment;
		
		treatment.sub_stage__c = 'Quote Revision';
		update treatment;
		
		treatment.sub_stage__c = 'Quote Rejected';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Interaction, stage Patient On Hold
	 */		
	static void setPhaseInteractionStagePatientOnHold(){
		treatment.Phase__c = '(2) Interaction';
		treatment.Stage__c = 'Patient On Hold';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Interaction, stage Consult
	 */		
	static void setPhaseInteractionStageConsult(){
		treatment.Phase__c = '(2) Interaction';
		treatment.Stage__c = 'Consult';
		update treatment;
		
		//substages
		treatment.sub_stage__c = 'Consult Requested';
		update treatment;
		
		treatment.sub_stage__c = 'Consult Booked';
		update treatment;
		
		treatment.sub_stage__c = 'Consult Futher Booking';
		update treatment;
		
		treatment.sub_stage__c = 'Consult No Further Booking';
		update treatment;
		
		treatment.sub_stage__c = 'No Show or Cancelled';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Interaction, stage Travel Converted
	 */		
	static void setPhaseInteractionStageTravelConverted(){
		treatment.Phase__c = '(2) Interaction';
		treatment.Stage__c = 'Travel Converted';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Interaction, stage Patient Lost
	 */		
	static void setPhaseInteractionStagePatientLost(){
		treatment.Phase__c = '(2) Interaction';
		treatment.Stage__c = 'Patient Lost';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Travel, clear stage
	 */		
	static void setPhaseToTravel() {
		treatment.phase__c = '(3) Travel';
		treatment.stage__c = 'Travel Itinerary';
		update treatment;
		
		//substages
		
		treatment.sub_stage__c = 'Trip Preparation';
		update treatment;
		
		treatment.sub_Stage__c = 'Treatment Itinerary Provided';
		update treatment;
		
		treatment.sub_stage__c = 'Reschedule Trip';
		update treatment;
		
		treatment.sub_stage__c = 'Trip Cancelled';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Travel, arrival date to today
	 * ASSERT: Treatment remains at Travel phase
	 * ASSERT: Workflow updated stage to At Provider
	 * ASSERT: Workflow updated substage to Treatment In Progress
	 */		
	static void setPhaseTravelStageAtProvider(){
		treatment.phase__c = '(3) Travel';
		travel.arrival_date__c = system.today();
		update treatment;
		update travel;
		
		treatmentCheck = [select id,
							phase__c,
							stage__c,
							sub_stage__c 
							from Treatment__c where id =:treatment.id];
		
		system.assertEquals('(3) Travel',treatmentCheck.phase__c);
		system.assertEquals('At Provider',treatmentCheck.stage__c);
		system.assertEquals('Treatment In Progress',treatmentCheck.Sub_Stage__c);
		
		//substages
		
		treatment.Sub_Stage__c = 'Treatment In Progress';
		update treatment;
		
		treatment.Sub_Stage__c = 'Treatment Add';
		update treatment;
		
		treatment.Sub_Stage__c = 'Patient Disqualified';
		update treatment;
		
	}
	
	/**
	 * Sets Treatment phase to Travel, stage Post-Treatment
	 * ASSERT: Workflow updates phase to Post-Op
	 */		
	static void setPhaseTravelStagePostTreatment(){
		treatment.Phase__c = '(3) Travel';
		treatment.Stage__c = 'Post-Treatment';
		update treatment;
		
		treatmentCheck = [select id,
							phase__c
							from Treatment__c where id =:treatment.id];
		
		system.assertEquals('(4) Post-Op',treatmentCheck.phase__c);
	}
	
	/**
	 * Sets Treatment phase to Post-Op
	 */		
	static void setPhaseToPostOp () {
		treatment.Phase__c = '(4) Post-Op';
		treatment.Sub_Stage__c = null;
		update treatment;
		
		//substages
		
		treatment.Sub_Stage__c = 'Financial Reconciliation';
		update treatment;
		
		treatment.sub_Stage__c = 'Treatment Closed/Claim Pending';
		update treatment;
	}
	
	/**
	 * Sets Treatment payment type to Paying Cash
	 */		
	static void setPaymentTypeCash(){
		treatment.Payment_Type__c = 'Paying Cash';
		update treatment;
	}
	
	/**
	 * Sets Treatment phase to Post-Op, stage Ongoing Relationship
	 * ASSERT: Patient is not marked for Do not contact
	 */		
	static void setPhasePostOpStageOngoing() {
		treatment.phase__c = '(4) Post-Op';
		treatment.stage__c = 'Ongoing Relationship';
		update treatment;
		
		treatmentCheck = [select id, patient__r.do_not_contact__c 
							from Treatment__c where id = :treatment.id];
		
		system.assertEquals(false,treatmentCheck.patient__r.do_not_Contact__c);		
		
		//substages
		
		treatment.Sub_Stage__c = 'Maintain Communication';
		update treatment;
		
	}
	
	/**
	 * Sets Treatment phase to Post-Op, stage Relationship Terminated
	 * ASSERT: Workflow updated Patient to be marked for Do not contact
	 */		
	static void setPhasePostOpStageTerminated () {
		treatment.phase__c = '(4) Post-Op';
		treatment.stage__c = 'Relationship Terminated';
		update treatment;
		
		treatmentCheck = [select id, patient__r.do_not_contact__c 
							from Treatment__c where id = :treatment.id];
		
		system.assertEquals(true,treatmentCheck.patient__r.do_not_Contact__c);	
	}
	
	
	/* DATA CREATION */
	
	/**
	 * Creates a new Patient__c record with name and email paramaters
	 * @param string Name
	 * @param string Email
	 * @return new Patient record with specified attributes of name and email
	 */		
	static Patient__c newPatient(string name, string email) {
		Patient__c testrecord = new Patient__c();
        testrecord.Name = name;
        testrecord.Email__c = email;
        return testrecord;
	}
	
	/**
	 * Creates a new Treatment__c record for passed in Patient__c
	 * @param Patient__c p
	 * @return new Treatment__c record attached to specified Patient__c
	 */		
	static Treatment__c newTreatment(Patient__c p) {
		Treatment__c testrecord = new Treatment__c();
		testrecord.Patient__c = p.id;
		return testrecord;
	}
	
	/**
	 * Creates a new Travel__c record for passed in Patient__c, Treatment__c
	 * @param Patient__c p
	 * @param Treatment__c t
	 * @return new Travel__c record for specified Patient__c, Treatment__c
	 */	
	static Travel__c newTravel(Patient__c p) {
		Travel__c testrecord = new Travel__c();
		testrecord.Arrival_Date__c = system.today().adddays(5);
		testrecord.Departure_Date__c = system.today().adddays(4);
		return testrecord;
	}
}