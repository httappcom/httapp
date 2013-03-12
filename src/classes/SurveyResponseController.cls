public without sharing class SurveyResponseController {
	public ID surveyHeaderId { get; set; }
	public Integer page { get; set; }
	
	private Survey_Header__c surveyHeader;
	private Map<String, Survey_Question__c> surveyResponsesMap = null;
	private Map<String, List<Survey_Question__c>> matrixResponsesMap = null;
	private Map<String,surveyGizmoUtil.questionClass> questionMap = null;
	
	public class VFSurveyPage {
		public String title {get; set; }
		public List<VFSurveyQuestion> questions { get; set; }
		public VFSurveyPage() {
			questions = new List<VFSurveyQuestion>();
		}
	}

	public class VFSurveyQuestion {
		public String type { get; set; }
		public VFSurveyGroup qGroup { get; set; }
		public String title { get; set; }
		public String answer { get; set; }
		public List<VFSurveyQuestion> multitextAnswers {get; set; }
		public VFSurveyQuestion( String title, String answer ) {
			this.title = title;
			this.answer = answer;
		}
		public VFSurveyQuestion() {}
	}
	
	public class VFSurveyGroup {
		public List<VFSurveyQuestion> questions { get; set; }
		public VFSurveyGroup() {
			questions = new List<VFSurveyQuestion>();
		}
	}
	
	public SurveyResponseController() {
		page = 1;
	}
	private List<VFSurveyPage> pages=null;
	
	public PageReference gotoPage() {
system.debug('gotoPage page='+page);
		return null;
	}
	
	public List<VFSurveyPage> getSurveyPages() {
		if (pages == null) {
			loadSurvey();
			loadSurveyPages();
		}
		
		return pages;
	}
	
	private void loadSurveyPages() {
		if (surveyHeader == null) return;
		surveyGizmoUtil.surveyClass surveyStruct = surveyGizmoUtil.getSurveyStructure( surveyHeader.Survey_Id__c );
		questionMap = surveyStruct.getMap();
        JSONParser parser = JSON.createParser(surveyHeader.Survey_Pages_JSON__c);
        parser.nexttoken();
        surveyGizmoUtil.surveyPagesClass surveyPagesStruct = 
        	(surveyGizmoUtil.surveyPagesClass)parser.readValueAs(surveyGizmoUtil.surveyPagesClass.class);
        pages = new List<VFSurveyPage>();
        for (surveyGizmoUtil.SurveyPage page: surveyPagesStruct.data) {
        	List<surveyGizmoUtil.SurveyPageQuestion> actualQuestions = page.getNonDecorativeQuestions();
        	if (actualQuestions.size()>0) {
        		VFSurveyPage vfPage = new VFSurveyPage();
        		vfPage.title = page.title.English;
        		for (surveyGizmoUtil.SurveyPageQuestion q: actualQuestions) {
        			if (q.subType == 'group') {

	   					List<Survey_Question__c> qList = null;
	   					if (q.sub_question_skus.size()>0) {
	   						qList = matrixResponsesMap.get(q.sub_question_skus[0]);
	   					}
	   					Integer repetitions = qList==null?1:qList.size();
	   					for (Integer listIdx=0;listIdx<repetitions;listIdx++) {
	   						if (qList != null && !isAnyAnswersInGroup( q.sub_question_skus, listIdx )) continue;
		       				VFSurveyQuestion vfQuestion = new VFSurveyQuestion();
    		   				vfQuestion.title = q.title.English;
       						vfPage.questions.add(vfQuestion);
        					VFSurveyGroup qGroup = new VFSurveyGroup();
        					vfQuestion.qGroup = qGroup;
	        				for (String subQId : q.sub_question_skus) {
    	    					setQuestion( qGroup.questions, subQId, qList==null?null:listIdx );
        					}
	   					}
        			} else {
       					setQuestion( vfPage.questions, q.id, null );
        			}
        		}
        		if (vfPage.questions.size()>0) {
	        		pages.add( vfPage );
        		}
        	}
        }
	}

	private static Set<String> simpleQuestions = new Set<String>{'textbox', 'menu', 'essay', 'radio', 'checkbox'}; 
	private void setQuestion( List<VFSurveyQuestion> questions, String qId, Integer listIdx) {
		surveyGizmoUtil.questionClass qStruct = questionMap.get(qId);
		if (qStruct != null) {
			if (qStruct.type == 'SurveyQuestion') {
				if (simpleQuestions.contains(qStruct.subType)) {
					Survey_Question__c dbQ = null;
					if (listIdx==null) {
						dbQ = surveyResponsesMap.get(qId);
					} else {
						List<Survey_Question__c> qList = matrixResponsesMap.get(qId);
						if (qList==null || qList.size()<=listIdx) return;
						dbQ = qList[listIdx];
					}
					if (dbQ != null /*&& (listIdx==null || dbQ.Answer__c!=null)*/) {
  						questions.add(new VFSurveyQuestion(qStruct.title.English, dbQ.Answer__c==null?'No Answer':dbQ.Answer__c));
       				}
				} else if (qStruct.subType == 'multi_textbox') {
					VFSurveyQuestion vfQuestion = new VFSurveyQuestion();
					questions.add(vfQuestion);
					vfQuestion.title = qStruct.title.English;
					vfQuestion.multitextAnswers = new List<VFSurveyQuestion>();
					for (surveyGizmoUtil.optionClass option : qStruct.options) {
						String responseKey = qId+':'+option.id;
						VFSurveyQuestion mtQuestion = new VFSurveyQuestion();
						vfQuestion.multitextAnswers.add(mtQuestion);
						mtQuestion.title = option.title.English;
						Survey_Question__c dbQ = surveyResponsesMap.get(responseKey);
						if (dbQ != null) {
							mtQuestion.Answer = dbQ.Answer__c==null?'No Answer':dbQ.Answer__c;
						}
					}
				} else if (qStruct.subType == 'table') {
system.debug('********************* subtype is table ***********************************');
       				for (String subQId : qStruct.sub_question_skus) {
						surveyGizmoUtil.questionClass subQStruct = questionMap.get(subQId);
						VFSurveyQuestion vfQuestion = new VFSurveyQuestion();
						questions.add(vfQuestion);
						vfQuestion.title = subQStruct.title.English;
						String delim = '';
						String answer = '';
						for (surveyGizmoUtil.optionClass option : qStruct.options) {
							String responseKey = subQId+':'+option.id;
system.debug('table responseKey='+responseKey);
						Survey_Question__c dbQ = surveyResponsesMap.get(responseKey);
system.debug('dbQ='+dbQ);
						if (dbQ != null && dbq.Answer__c != null) {
							answer += delim + dbq.Answer__c;
							delim = ', ';
						}
						vfQuestion.Answer = answer;
					}
       				}
				} else if (qStruct.subType == 'matrix') {
   					Map<String, String> matrixAnswersMap = new Map<String, String>();
       				for (String subQId : qStruct.sub_question_skus) {
						surveyGizmoUtil.questionClass subQStruct = questionMap.get(subQId);
						if (subQStruct.options!=null && subQStruct.options.size()>0) {
							for (surveyGizmoUtil.optionClass option : subQStruct.options) {
								String responseKey = subQId+':'+option.id;
		       					List<Survey_Question__c> qList = matrixResponsesMap.get(responseKey);
		       					if (qList != null) {
		       						for (Survey_Question__c sQ : qList) {
		       							String answer = matrixAnswersMap.get(sQ.Row_Label__c);
		       							if (answer == null) {
		       								answer = sQ.Answer__c;
		       							} else if (sQ.Answer__c != null){
		       								answer = answer + ', ' + sQ.Answer__c;
		       							}
		       							matrixAnswersMap.put(sQ.Row_Label__c, answer);
		       						}
		       					}
							
							}
						} else {
	       					List<Survey_Question__c> qList = matrixResponsesMap.get(subQId);
	       					if (qList != null) {
	       						for (Survey_Question__c sQ : qList) {
	       							String answer = matrixAnswersMap.get(sQ.Row_Label__c);
	       							if (answer == null) {
	       								answer = sQ.Answer__c;
	       							} else if (sQ.Answer__c != null) {
	       								answer = answer + ', ' + sQ.Answer__c;
	       							}
	       							matrixAnswersMap.put(sQ.Row_Label__c, answer);
	       						}
	       					}
						}
       				}
       				for (String answerKey : matrixAnswersMap.keySet()) {
       					questions.add(new VFSurveyQuestion(answerKey, matrixAnswersMap.get(answerKey)));
       				}
				}
        	}
        }
	}
	
	private void loadSurvey() {
		if (surveyHeaderId == null) return;
		Survey_Header__c[] headers = [SELECT Id, Survey_Id__c, Patient__c, Response_Id__c, Name, Survey_Pages_JSON__c, 
			(SELECT Answer__c,Order__c,Response_Id__c,Row_Label__c FROM Survey_Questions__r order by Order__c) 
			FROM Survey_Header__c where id = :surveyHeaderId limit 1];
System.debug('loadSurvey headers='+headers);
		surveyHeader = (headers.size()==1) ? headers[0] : null;
		if (surveyHeader == null) return;
		surveyResponsesMap = new Map<String, Survey_Question__c>();
		matrixResponsesMap = new Map<String, List<Survey_Question__c>>();
		for (Survey_Question__c q : surveyHeader.Survey_Questions__r) {
			surveyResponsesMap.put(q.Response_Id__c, q);
			if (q.Row_Label__c != null) {
				List<Survey_Question__c> qList = matrixResponsesMap.get(q.Response_Id__c);
				if (qList == null) {
					qList = new List<Survey_Question__c>();
					matrixResponsesMap.put(q.Response_Id__c, qList);
				}
				qList.add(q);
			}
		}
	}
	
	private Boolean isAnyAnswersInGroup( List<String> subQuestions, Integer listIdx ) {
		for (String qId : subQuestions) {
			List<Survey_Question__c> qList = matrixResponsesMap.get(qId);
			if (qList != null && qList.size()>listIdx) {
				Survey_Question__c q = qList[listIdx];
				if (q.Answer__c != null) return true;
			}
		}
		return false;
	}
}