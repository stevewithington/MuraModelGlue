<!---

This file is part of MuraModelGlue

Copyright 2013 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

--->
<cfcomponent output="false">

	<cfscript>
		include 'includes/modelglueconfig.cfm'; // framework variables
		include '../../config/applicationSettings.cfm';
		include '../../config/mappings.cfm';
		include '../mappings.cfm';

		public string function doAction(string action='') {
			var local = {};
			var ModelGlue_APP_KEY = variables.framework.applicationKey;

			local.eventKey = 'event'; // this will need to be unique if there are multiple plugins using MG (e.g., ?event=some.event vs. ?packageNameEvent=some.event)

			url[local.eventKey] = StructKeyExists(url, local.eventKey) 
				? url[local.eventKey] : StructKeyExists(form, local.eventKey)
				? form[local.eventKey] : arguments.action;

			savecontent variable='local.response' {
				include '/#variables.framework.package#/includes/ModelGlue/gesture/ModelGlue.cfm';
			}

			//WriteDump(var=mg, abort=1);

			return local.response;
		}

		public any function onApplicationStart() {
			include '../../config/appcfc/onApplicationStart_include.cfm';
		}
	</cfscript>

	<cffunction name="onSessionStart"  output="false">
		<cfinclude template="../../config/appcfc/onSessionStart_include.cfm" />
		<!--- Not sure anyone'll ever need this...
		<cfset invokeSessionEvent("modelglue.onSessionStartPreRequest", session, application) />
		--->
		<!--- Set flag letting MG know it needs to broadcast onSessionStart before onRequestStart --->
		<cfset request._modelglue.bootstrap.sessionStart = true />
	</cffunction>

	<cffunction name="onSessionEnd" output="false">
		<cfargument name="sessionScope" type="struct" required="true">
		<cfargument name="appScope" 	type="struct" required="false">
		<cfinclude template="../../config/appcfc/onSessionEnd_include.cfm" />
		<cfset invokeSessionEvent("modelglue.onSessionEnd", arguments.sessionScope, arguments.appScope) />
	</cffunction>

	<cffunction name="invokeSessionEvent" output="false" access="private">
		<cfargument name="eventName" />
		<cfargument name="sessionScope" />
		<cfargument name="appScope" />

		<cfset var mgInstances = createObject("component", "ModelGlue.Util.ModelGlueFrameworkLocator").findInScope(arguments.appScope) />
		<cfset var values = structNew() />
		<cfset var i = "" />

		<cfset values.sessionScope = arguments.sessionScope />

		<cfloop from="1" to="#arrayLen(mgInstances)#" index="i">
			<cfset mgInstances[i].executeEvent(arguments.eventName, values) />
		</cfloop>
	</cffunction>

</cfcomponent>