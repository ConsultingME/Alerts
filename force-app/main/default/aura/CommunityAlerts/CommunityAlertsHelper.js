({
	doInit : function(component, event, helper) {
		//console.log("Community Alerts Helper doInit");
		this.setLanguage(component);
		var language = component.get("v.language");
		var action = component.get("c.GetAlerts");
		var componentName = component.get("v.componentName");
		action.setParams({"componentName":componentName, "language":language});
		action.setCallback(this, function(actionResult) {
			var data = actionResult.getReturnValue();
			var dataEx = data.map(function(alert) {
				if ("default" !== alert.Type__c.toLowerCase()) {
					alert.Style = "slds-theme--"+alert.Type__c.toLowerCase();
				}
				return alert;
			});
			//console.log(dataEx);
			component.set("v.alerts", dataEx);
		});
		$A.enqueueAction(action);
	},

	setLanguage: function(component) {
		var search = window.location.search;
		//console.log(search);
		if (search.length > 0) {
			var params = search.replace("?","").split("&");
			//console.log(params);
			for(var q = 0; q < params.length; q++) {
				if (0 < params[q].indexOf("language")) {
					var kvp = params[q].split("=");
					component.set("v.language", kvp[1]);
					break;
				}
			}
		}
	}
})