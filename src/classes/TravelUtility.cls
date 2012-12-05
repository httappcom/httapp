/**
* TravelUtility.cls
* Description : Utility methods for Travel__c trigger
* @author M. Wicherski, MK Partners 2012
*/ 

public with sharing class TravelUtility {
	
	/**
	 * Before Insert Actions
	 * @param Trigger.new list<Travel__c> newlist
	 */
	public static void beforeInsert (list<Travel__c> newlist) {
		
	}
	
	/**
	 * Before Update Actions
	 * @param Trigger.new list<Travel__c> newlist
	 * @param Trigger.oldmap map<id,Travel__c> oldmap
	 */
	public static void beforeUpdate (list<Travel__c> newlist, map<id,Travel__c> oldmap) {
		
	}
	
	/**
	 * After Insert Actions
	 * @param Trigger.new list<Travel__c> newlist
	 */
	public static void afterInsert (list<Travel__c> newlist) {
		updateTreatmentLastDepartureDate(newlist);
	}
	
	/**
	 * After Update Actions
	 * @param Trigger.new list<Travel__c> newlist
	 * @param Trigger.oldmap map<id,Travel__c> oldmap
	 */
	public static void afterUpdate (list<Travel__c> newlist, map<id,Travel__c> oldmap) {
		list<Travel__c> updatedDepartures = new list<Travel__c>();
		list<Travel__c> arrivals = new list<Travel__c>();
		for (integer i=0; i<newlist.size(); i++) {
			if (newlist[i].departure_date__c != null && newlist[i].departure_date__c != oldmap.get(newlist[i].id).departure_date__c) {
				updatedDepartures.add(newlist[i]);
			}	
			else if (newlist[i].arrived__c == true && oldmap.get(newlist[i].id).arrived__c == false) {
				arrivals.add(newlist[i]);
			}
		}
		
		if (updatedDepartures.size() > 0) {
			updateTreatmentLastDepartureDate(updatedDepartures);
		}	
		if (arrivals.size() > 0) {
			updateTreatmentAtProvider(arrivals);
		}
	}
	
	/**
	 * Updates the associated treatment with the last departure date from travel
	 * @param list<Travel__c> newlist
	 */
	public static void updateTreatmentLastDepartureDate(list<Travel__c> newlist){
/*		map<id,list<Travel__c>> treatmentTravelsMap = new map<id,list<Travel__c>>();
		list<Travel__c> templist = new list<Travel__c>();
		for (integer i=0; i<newlist.size(); i++) {
			if (treatmentTravelsMap.containsKey(newlist[i].treatment__c)) {
				templist = treatmentTravelsMap.get(newlist[i].treatment__c);
				templist.add(newlist[i]);
				treatmentTravelsMap.put(newlist[i].treatment__c, templist);
			}
			else {
				templist = new list<Travel__c>();
				templist.add(newlist[i]);
				treatmentTravelsMap.put(newlist[i].treatment__c, templist);
			}
		}
		
		map<id,Treatment__c> treatmentMap = populateTreatmentMap(treatmentTravelsMap.keySet());
		for (String s : treatmentTravelsMap.keySet()) {
			list<Travel__c> travelList = treatmentTravelsMap.get(s);
			for (Travel__c t : travelList) {
				if (treatmentMap.get(s).final_departure_Date__c == null || t.departure_date__c > treatmentMap.get(s).final_departure_Date__c) {
					Treatment__c treat = treatmentMap.get(s);
					treat.Final_Departure_Date__c = t.departure_date__c;
					treatmentMap.put(s, treat);	
				}
			}
		}
		
		update treatmentMap.values();*/	
	}
	
	/**
	 * Updates treatment when travel is 'Arrived'
	 * @param list<Travel__c> arrivals
	 */
	public static void updateTreatmentAtProvider (list<Travel__c> arrivals) {
/*FIXME		set<id> arrivalsTreatments = new set<id>();
		for (Travel__c t : arrivals) {
			arrivalsTreatments.add(t.treatment__c);
		}
		
		list<Treatment__c> treatments = populateTreatmentMap(arrivalsTreatments).values(); 
		for (Treatment__c t : treatments) {
			t.Phase__c = '(3) Travel';
			t.stage__c = 'At Provider';
			t.Sub_Stage__c = 'Treatment In Progress';
		}
		
		update treatments;*/
	}
	
	/**
	 * Utility Method for retrieving a map of Treatment__c by id
	 * @param set<id> Treatments
	 * @return map<id,Treatment__c> for passed in set of treatment ids
	 */
	private static map<id, Treatment__c> populateTreatmentMap (set<id> treatments) {
		if (treatments != null && treatments.size() > 0) {
			return new map<id, Treatment__c>([	select id, 
											final_departure_Date__c,
											stage__c,
											phase__c,
											Sub_Stage__c 
											from Treatment__c 
											where id IN :treatments]);
		}
		else return null;
	}
}