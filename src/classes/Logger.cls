public with sharing class Logger {
	public static void info( String msg ) {
		System.debug(LoggingLevel.INFO, msg);
	}
	public static void info( List<SObject> sobjs ) {
		System.debug(LoggingLevel.INFO, JSON.serialize(sobjs));
	}
	
}