/**
* 
* This file is part of MuraModelGlue
*
* Copyright 2013 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true output=false {

	property name='$';
	property name='pluginConfig';

	include '../../config/applicationSettings.cfm';
	include '../../config/mappings.cfm';
	include '../mappings.cfm';

	// framework variables
	include 'includes/modelglueconfig.cfm';

	public string function doAction(string action='', string appKey='app1') {
		var local = {};
		var ModelGlue_APP_KEY = arguments.appKey;
		var ModelGlue_LOCAL_COLDSPRING_PATH = expandPath('plugins/' & variables.framework.package & '/' & ModelGlue_APP_KEY) & '/config/ColdSpring.xml';

		local.eventKey = 'event'; // this will need to be unique if there are multiple plugins using MG (e.g., ?event=some.event vs. ?packageNameEvent=some.event)

		url[local.eventKey] = StructKeyExists(url, local.eventKey) 
			? url[local.eventKey] : StructKeyExists(form, local.eventKey)
			? form[local.eventKey] : arguments.action;

		savecontent variable='local.response' {
			include '/#variables.framework.package#/includes/ModelGlue/gesture/ModelGlue.cfm';
		}

		return local.response;
	}

	public any function onApplicationStart() {
		include '../../config/appcfc/onApplicationStart_include.cfm';
		return true;
	}

	public any function onRequestStart(required string targetPage) {
		var $ = StructKeyExists(application, 'serviceFactory') ? application.serviceFactory.getBean('$') : {};

		include '../../config/appcfc/onRequestStart_include.cfm';

		if ( StructKeyExists(session, 'siteid') ) {
			$.init(session.siteid);
		} else {
			$.init('default');
		}

		if ( StructKeyExists(url, $.globalConfig('appreloadkey')) ) {
			onApplicationStart();
		}

		set$($);
		setPluginConfig($.getPlugin(variables.framework.package));
		// You may want to change the methods being used to secure the request
		if ( inPluginDirectory() ) {
			secureRequest();
		}

		return true;
	}

	public void function onRequest(required string targetPage) {
		include arguments.targetPage;
	}

	public void function onSessionStart() {
		include '../../config/appcfc/onSessionStart_include.cfm';
		/* Not sure anyone'll ever need this...
			invokeSessionEvent("modelglue.onSessionStartPreRequest", session, application);
		*/
		// Set flag letting MG know it needs to broadcast onSessionStart before onRequestStart
		request._modelglue.bootstrap.sessionStart = true;
	}

	public void function onSessionEnd(required struct sessionScope, struct appScope) {
		include '../../config/appcfc/onSessionEnd_include.cfm';
		invokeSessionEvent('modelglue.onSessionEnd', arguments.sessionScope, arguments.appScope);
	}

	private void function invokeSessionEvent(eventName, sessionScope, struct appScope) {
		var mgInstances = new ModelGlue.Util.ModelGlueFrameworkLocator().findInScope(arguments.appScope);
		var values = {};
		var i = '';
		values.sessionScope = arguments.sessionScope;

		for (i=1; i <=ArrayLen(mgInstances); i++) {
			mgInstances[i].executeEvent(arguments.eventName, values);
		}
	}


	// ---------------------------------------------------------------------------------
	// HELPERS

	public any function secureRequest() {
		if ( !allowedAccess() ) {
			location(url='#$.globalConfig('context')#/admin/index.cfm?muraAction=clogin.main&returnURL=/plugins/#variables.framework.package#/', addtoken=false);
		}
	}

	public any function allowedAccess() {
		// You could also check the user's group with $.currentUser().isInGroup('Some Group Name')
		return $.currentUser().isSuperUser() && inPluginDirectory() ? true : false;
	}

	public boolean function inPluginDirectory() {
		return ListFindNoCase(getPageContext().getRequest().getRequestURI(), 'plugins', '/');
	}

}