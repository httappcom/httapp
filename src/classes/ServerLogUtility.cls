public with sharing class ServerLogUtility {
  public Server_Log__c serverLog { get; set; }
  public ServerLogUtility (String service, String errorMessage)
  {
  	this.serverLog = new Server_Log__c();
  	this.serverLog.Service__c = service;
  	this.serverLog.Error_text__c = errorMessage;
  }
  public static void updateServerLog (String service, String errorMessage)
  {
  	ServerLogUtility sl = new serverLogUtility(service, errorMessage);
  	insert sl.serverLog;
  }
}