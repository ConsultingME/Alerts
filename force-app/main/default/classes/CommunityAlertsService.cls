public without sharing class CommunityAlertsService { 

  @AuraEnabled
  public static List<Community_Alerts__c> GetAlerts(string componentName, string language) {
    List<Community_Alerts__c> alertList = [select Name, Details__c, Type__c from Community_Alerts__c where Component_Name__c = :componentName and Start_Date__c <= TODAY and Expiration_Date__c >= TODAY and Language__c = :language];
    return alertList;
  }

}