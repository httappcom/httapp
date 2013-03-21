public with sharing class MyTasksController {

	public Boolean includeCompleted { get; public set; }

	public String filter { get; public set; }
	public List<SelectOption> getFilterList() {
		List<String> filters = new List<String>{'Today', 'Today + Overdue', 'Tomorrow', 'Next 7 Days', 
			'Next 7 Days + Overdue', 'This Month', 'All Open'};
		List<SelectOption> retList = new List<SelectOption>();
		for (String f : filters) {
			retList.add(new SelectOption(f,f));
		}
		return retList;
	}
	public class TaskRow {
		public Boolean completed {get; private set;}
		public Date dueDate {get; private set; }
		public String subject {get; private set; }
		public UILookup__c lu {get; private set; }
		public ID taskId {get; private set; }
		public TaskRow( Task task, Map<ID, Treatment__c> treatmentMap ) {
			taskId = task.Id;
			completed = task.status=='Completed';
			dueDate = task.ActivityDate;
			subject = task.Subject;
			lu = new UILookup__c();
			if (task.What.Type == 'Treatment__c') {
				lu.Treatment__c = task.WhatId;
				Treatment__c treatment = treatmentMap.get(lu.Treatment__c);
				lu.Patient__c = treatment.Patient__c;
			}
		}
	}
	public MyTasksController() {
system.debug('MyTasksController constructor');
		filter = 'Today';
		includeCompleted = false;
system.debug('before readTasks');
		readTasks();
	}
	

	public PageReference setFilter() {
		readTasks();
		return null;
	}
	public List<TaskRow> getTasks() {
		return taskRows;
	}
	private TaskRow[] taskRows = null;
	private void readTasks() {
system.debug('readTasks');
		String qry = 'SELECT id, Status, ActivityDate, Subject, OwnerId, WhatId, What.Type FROM Task where OwnerId = \'' +
			UserInfo.getUserId()+'\'';
		if (!includeCompleted) {
			qry += ' AND status != \'Complete\' ';
		}
		if (filter == 'Today') {
			qry += ' AND ActivityDate=TODAY ';
		} else if (filter == 'Today + Overdue') {
			qry += ' AND ActivityDate<=TODAY ';
		} else if (filter == 'Tomorrow') {
			qry += ' AND ActivityDate=TOMORROW ';
		} else if (filter == 'Next 7 Days') {
			qry += ' AND ActivityDate=NEXT_N_DAYS:7 ';
		} else if (filter == 'Next 7 Days + Overdue') {
			qry += ' AND (ActivityDate<=TODAY OR ActivityDate=NEXT_N_DAYS:7) ';
		} else if (filter == 'This Month') {
			qry += ' AND ActivityDate=THIS_MONTH ';
		}
		qry += ' ORDER BY ActivityDate';
system.debug('qry='+qry);
		Task[] tasks = Database.query(qry);
		Set<ID> treatmentIds = new Set<ID>();
		for (Task task : tasks) {
			if (task.What.Type == 'Treatment__c') {
				treatmentIds.add(task.WhatId);
			}
		}
		Map<ID, Treatment__c> treatmentMap = new Map<ID, Treatment__c>([select Patient__c from Treatment__c where id in :treatmentIds]);
		taskRows = new List<TaskRow>();
		for (Task task : tasks) {
			taskRows.add(new TaskRow(task, treatmentMap));
		}
system.debug('TaskRows='+taskRows);
	}	
}