global class MonitorPatientLeads implements Schedulable {
	public static void schedule() {
		System.schedule('Patient Lead Monitor', '0 12 * * * ?', new MonitorPatientLeads());
	}
	global void execute(SchedulableContext ctx) {
		PatientLeadUtil.execute();
	} 
}