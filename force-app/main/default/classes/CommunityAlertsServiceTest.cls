@isTest
private class CommunityAlertsServiceTest {

	// Get active alerts
	// don't get inactive alerts
	// don't get alerts for other component name
	@isTest
	private static void GetAlerts_MultipleComponentAlerts() {
		//Arrange
		string language = 'en_US';
		string componentName1 = 'Good';
		string componentName2 = 'Bad';

		List<Community_Alerts__c> testAlerts = new List<Community_Alerts__c>();

		Community_Alerts__c a1 = new Community_Alerts__c();
		a1.Component_Name__c = componentName2;
		a1.Details__c = 'Alert Details 1';
		a1.Expiration_Date__c = Date.today().addDays(-1);
		a1.Name = 'Alert 1';
		a1.Start_Date__c = Date.today().addDays(-2);
		a1.Type__c = 'Default';
		a1.Language__c = language;
		testAlerts.add(a1);

		Community_Alerts__c a2 = new Community_Alerts__c();
		a2.Component_Name__c = componentName1;
		a2.Details__c = 'Alert Details 2';
		a2.Expiration_Date__c = Date.today().addDays(5);
		a2.Name = 'Alert 2';
		a2.Start_Date__c = Date.today();
		a2.Type__c = 'Success';
		a2.Language__c = language;
		testAlerts.add(a2);

		Community_Alerts__c a3 = new Community_Alerts__c();
		a3.Component_Name__c = componentName1;
		a3.Details__c = 'Alert Details 3';
		a3.Expiration_Date__c = Date.today().addDays(-1);
		a3.Name = 'Alert 3';
		a3.Start_Date__c = Date.today().addDays(-8);
		a3.Type__c = 'Warning';
		a3.Language__c = language;
		testAlerts.add(a3);

		Community_Alerts__c a4 = new Community_Alerts__c();
		a4.Component_Name__c = componentName2;
		a4.Details__c = 'Alert Details 4';
		a4.Expiration_Date__c = Date.today();
		a4.Name = 'Alert 4';
		a4.Start_Date__c = Date.today().addDays(-2);
		a4.Type__c = 'Error';
		a4.Language__c = language;
		testAlerts.add(a4);

		insert testAlerts;

		Map<Id, Community_Alerts__c> alertMap = new Map<Id, Community_Alerts__c>(testAlerts);
		
		//Act
		Test.startTest();
		List<Community_Alerts__c> alertList = CommunityAlertsService.GetAlerts(componentName1, language);
		Test.stopTest();

		//Assert
		System.assertEquals(1, alertList.size());

		for(Community_Alerts__c alert : alertList) {
			Community_Alerts__c testAlert = alertMap.get(alert.Id);
			System.assertNotEquals(null, testAlert);
			System.assertEquals(testAlert.Name, alert.Name);
			System.assertEquals(testAlert.Details__c, alert.Details__c);
			System.assertEquals(testAlert.Type__c, alert.Type__c);
		}

	}

		@isTest
	private static void GetAlerts_ExpiredAlerts() {
		//Arrange
		string componentName = 'All';
		string language = 'en_US';

		List<Community_Alerts__c> testAlerts = new List<Community_Alerts__c>();

		Community_Alerts__c a1 = new Community_Alerts__c();
		a1.Component_Name__c = componentName;
		a1.Details__c = 'Alert Details 1';
		a1.Expiration_Date__c = Date.today().addDays(-1);
		a1.Name = 'Alert 1';
		a1.Start_Date__c = Date.today().addDays(-2);
		a1.Type__c = 'Default';
		a1.Language__c = language;
		testAlerts.add(a1);

		Community_Alerts__c a2 = new Community_Alerts__c();
		a2.Component_Name__c = componentName;
		a2.Details__c = 'Alert Details 2';
		a2.Expiration_Date__c = Date.today().addDays(5);
		a2.Name = 'Alert 2';
		a2.Start_Date__c = Date.today();
		a2.Type__c = 'Success';
		a2.Language__c = language;
		testAlerts.add(a2);

		Community_Alerts__c a3 = new Community_Alerts__c();
		a3.Component_Name__c = componentName;
		a3.Details__c = 'Alert Details 3';
		a3.Expiration_Date__c = Date.today().addDays(-1);
		a3.Name = 'Alert 3';
		a3.Start_Date__c = Date.today().addDays(-8);
		a3.Type__c = 'Warning';
		a3.Language__c = language;
		testAlerts.add(a3);

		Community_Alerts__c a4 = new Community_Alerts__c();
		a4.Component_Name__c = componentName;
		a4.Details__c = 'Alert Details 4';
		a4.Expiration_Date__c = Date.today();
		a4.Name = 'Alert 4';
		a4.Start_Date__c = Date.today().addDays(-2);
		a4.Type__c = 'Error';
		a4.Language__c = language;
		testAlerts.add(a4);

		insert testAlerts;

		Map<Id, Community_Alerts__c> alertMap = new Map<Id, Community_Alerts__c>(testAlerts);
		
		//Act
		Test.startTest();
		List<Community_Alerts__c> alertList = CommunityAlertsService.GetAlerts(componentName, language);
		Test.stopTest();

		//Assert
		System.assertEquals(2, alertList.size());

		for(Community_Alerts__c alert : alertList) {
			Community_Alerts__c testAlert = alertMap.get(alert.Id);
			System.assertNotEquals(null, testAlert);
			System.assertEquals(testAlert.Name, alert.Name);
			System.assertEquals(testAlert.Details__c, alert.Details__c);
			System.assertEquals(testAlert.Type__c, alert.Type__c);
		}

	}


	@isTest
	private static void GetAlerts_Valid() {
		//Arrange
		string componentName = 'All';
		string language = 'en_US';

		List<Community_Alerts__c> testAlerts = new List<Community_Alerts__c>();

		Community_Alerts__c a1 = new Community_Alerts__c();
		a1.Component_Name__c = componentName;
		a1.Details__c = 'Alert Details 1';
		a1.Expiration_Date__c = Date.today().addDays(3);
		a1.Name = 'Alert 1';
		a1.Start_Date__c = Date.today().addDays(-2);
		a1.Type__c = 'Default';
		a1.Language__c = language;
		testAlerts.add(a1);

		Community_Alerts__c a2 = new Community_Alerts__c();
		a2.Component_Name__c = componentName;
		a2.Details__c = 'Alert Details 2';
		a2.Expiration_Date__c = Date.today().addDays(5);
		a2.Name = 'Alert 2';
		a2.Start_Date__c = Date.today();
		a2.Type__c = 'Success';
		a2.Language__c = language;
		testAlerts.add(a2);

		Community_Alerts__c a3 = new Community_Alerts__c();
		a3.Component_Name__c = componentName;
		a3.Details__c = 'Alert Details 3';
		a3.Expiration_Date__c = Date.today();
		a3.Name = 'Alert 3';
		a3.Start_Date__c = Date.today().addDays(-2);
		a3.Type__c = 'Warning';
		a3.Language__c = language;
		testAlerts.add(a3);

		Community_Alerts__c a4 = new Community_Alerts__c();
		a4.Component_Name__c = componentName;
		a4.Details__c = 'Alert Details 4';
		a4.Expiration_Date__c = Date.today();
		a4.Name = 'Alert 4';
		a4.Start_Date__c = Date.today().addDays(-2);
		a4.Type__c = 'Error';
		a4.Language__c = language;
		testAlerts.add(a4);

		insert testAlerts;

		Map<Id, Community_Alerts__c> alertMap = new Map<Id, Community_Alerts__c>(testAlerts);
		
		//Act
		Test.startTest();
		List<Community_Alerts__c> alertList = CommunityAlertsService.GetAlerts(componentName, language);
		Test.stopTest();

		//Assert
		System.assertEquals(testAlerts.size(), alertList.size());

		for(Community_Alerts__c alert : alertList) {
			Community_Alerts__c testAlert = alertMap.get(alert.Id);
			System.assertNotEquals(null, testAlert);
			System.assertEquals(testAlert.Name, alert.Name);
			System.assertEquals(testAlert.Details__c, alert.Details__c);
			System.assertEquals(testAlert.Type__c, alert.Type__c);
		}

	}

/*	@isTest
	private static void GetAlerts_Localization() {
		//Arrange
		string componentName = 'All';
		string language1 = 'en_US';
		string language2 = 'de';

		List<Community_Alerts__c> testAlerts = new List<Community_Alerts__c>();

		Community_Alerts__c a1 = new Community_Alerts__c();
		a1.Component_Name__c = componentName;
		a1.Details__c = 'Alert Details 1';
		a1.Expiration_Date__c = Date.today().addDays(3);
		a1.Name = 'Alert 1';
		a1.Start_Date__c = Date.today().addDays(-2);
		a1.Type__c = 'Default';
		a1.Language__c = language1;
		testAlerts.add(a1);

		Community_Alerts__c a2 = new Community_Alerts__c();
		a2.Component_Name__c = componentName;
		a2.Details__c = 'Alert Details 2';
		a2.Expiration_Date__c = Date.today().addDays(5);
		a2.Name = 'Alert 2';
		a2.Start_Date__c = Date.today();
		a2.Type__c = 'Success';
		a2.Language__c = language2;
		testAlerts.add(a2);

		Community_Alerts__c a3 = new Community_Alerts__c();
		a3.Component_Name__c = componentName;
		a3.Details__c = 'Alert Details 3';
		a3.Expiration_Date__c = Date.today();
		a3.Name = 'Alert 3';
		a3.Start_Date__c = Date.today().addDays(-2);
		a3.Type__c = 'Warning';
		a3.Language__c = language1;
		testAlerts.add(a3);

		Community_Alerts__c a4 = new Community_Alerts__c();
		a4.Component_Name__c = componentName;
		a4.Details__c = 'Alert Details 4';
		a4.Expiration_Date__c = Date.today();
		a4.Name = 'Alert 4';
		a4.Start_Date__c = Date.today().addDays(-2);
		a4.Type__c = 'Error';
		a4.Language__c = language2;
		testAlerts.add(a4);

		insert testAlerts;

		Map<Id, Community_Alerts__c> alertMap = new Map<Id, Community_Alerts__c>(testAlerts);
		
		//Act
		Test.startTest();
		List<Community_Alerts__c> alertList = CommunityAlertsService.GetAlerts(componentName, language2);
		Test.stopTest();

		//Assert
		System.assertEquals(2, alertList.size());

		for(Community_Alerts__c alert : alertList) {
			Community_Alerts__c testAlert = alertMap.get(alert.Id);
			System.assertNotEquals(null, testAlert);
			System.assertEquals(testAlert.Name, alert.Name);
			System.assertEquals(testAlert.Details__c, alert.Details__c);
			System.assertEquals(testAlert.Type__c, alert.Type__c);
			System.assertEquals(language2, testAlert.Language__c); 
		}

	}  */
}