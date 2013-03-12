public class PickListDefines {
	public static CareTeamMemberRoles CareTeamMemberRoles = new CareTeamMemberRoles();
	public class CareTeamMemberRoles { 
		public String Doctor = 'Doctor';
		public String MedicalInformationOfficer = 'Medical Information Officer';
		public String MedicalProfessional = 'Medical Professional';
		public String OnsiteCoordinator = 'Onsite Coordinator';
		public String Patient = 'Patient';
		public String PCC = 'PCC';
		public String TravelConcierge = 'Travel Concierge';
		public String InsuranceAgent = 'Insurance Agent';
	}
	public static Set<String> PCC_CareTeamRoles = new Set<String> {
		CareTeamMemberRoles.PCC,
		CareTeamMemberRoles.OnsiteCoordinator,
		CareTeamMemberRoles.InsuranceAgent
	};
	public static ApprovalState ApprovalState = new ApprovalState();
	public class ApprovalState {
		public String NotRequired = 'Not Required';
		public String AwaitingApproval = 'Awaiting Approval';
		public String Approved = 'Approved';
		public String Denied = 'Denied';
	}
	public static PaymentType PaymentType = new PaymentType();
	public class PaymentType {
		public String Cash = 'Paying Cash';
		public String Insurance = 'Insurance';
	}
	public static EngagementType EngagementType = new EngagementType();
	public class EngagementType {
		public String Treatment = 'Treatment';
		public String Consult = 'Consult';
	}
	public static ActiveStatus ActiveStatus = new ActiveStatus();
	public class ActiveStatus {
		public String Active = 'Active';
		public String OnHold = 'On Hold';
		public String NotResponding = 'Not Responding';
		public String UnconvertedNotInterested = 'Unconverted - not interested';
		public String UnconvertedBadInformation = 'Unconverted - bad information';
		public String UnconvertedRejected = 'Unconverted - rejected';
	}
	public static QuoteStatus QuoteStatus = new QuoteStatus();
	public class QuoteStatus {
        public String Preparing = 'Preparing Quote';
        public String Complete = 'Quote Complete';
        public String AwaitingSignature = 'Awaiting Signature';
        public String Signed = 'Quote Signed';
        public String Revision = 'Revising Quote';
        public String Rejected = 'Quote Rejected';
        public String Expired = 'Quote Expired';
	}
	public static Phase Phase = new Phase();
	public class Phase {
		public String Inquiry = 'Inquiry';
		public String Interaction = 'Interaction';
		public String Travel = 'Travel';
		public String PostOp = 'Post-Op';
	}
	public static Stage Stage = new Stage();
	public class Stage {
        public String Initial = 'New'; //Use "Initial" because "New" is a reserved word
        public String Responding = 'Responding';
        public String Lost = 'Lost';
        public String TreatmentInfoProvided = 'Providing Treatment Information';
        public String MedicalInformation = 'Medical Information';
        public String TreatmentApproval = 'Treatment Approval';
        public String Quoting = 'Quoting';
        public String Itinerary = 'Itinerary';
        public String AtProvider = 'At Provider';
        public String TripReschedule = 'Trip Reschedule';
        public String TripCanceled = 'Trip Canceled';
        public String InMarketRehab = 'In-market Rehab';
        public String ClosedClaimPending = 'Treatment Closed-Claim Pending';
        public String RelationshipMarketing = 'Relationship Marketing';
	}
	public static SubStage SubStage = new SubStage();
	public class SubStage {
        public String TripPreparation = 'Trip Preparation';
        public String ItineraryCompleted = 'Itinerary Completed';
        public String Admissions = 'Admissions';
        public String TreatmentInProgress = 'Treatment In Progress';
        public String TreatmentAdd = 'Treatment Add';
        public String PatientDisqualified = 'Patient Disqualified';
        public String RehabinProgress = 'Rehab in Progress';
        public String FinancialReconciliation = 'Reconcile and Release';
	}
}