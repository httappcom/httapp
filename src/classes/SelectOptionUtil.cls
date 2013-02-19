global with sharing class SelectOptionUtil {
	global static List<SelectOption> sort(List<SelectOption> ListToSort) {
	system.debug('List to Sort='+ListToSort);
		if(ListToSort == null || ListToSort.size() <= 1)
			return ListToSort;
		list<SelectOption> Less = new List<SelectOption>();
		List<SelectOption> Greater = new List<SelectOption>();
		integer pivot = ListToSort.size() / 2;                  // save the pivot and remove it from the list
		SelectOption pivotValue = ListToSort[pivot];
		ListToSort.remove(pivot);
		for(SelectOption x : ListToSort) {
			if(x.getLabel() <= pivotValue.getLabel())
				Less.add(x);
			else if(x.getLabel() > pivotValue.getLabel())
				Greater.add(x);
		}
		List<SelectOption> returnList = new List<SelectOption> ();
		returnList.addAll(sort(Less));
		returnList.add(pivotValue);
		returnList.addAll(sort(Greater));
system.debug('sort retlist='+returnList);
		return returnList;
	}  
}