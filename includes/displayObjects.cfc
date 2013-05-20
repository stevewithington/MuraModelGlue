/*

This file is part of MuraModelGlue

Copyright 2013 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

*/
component persistent="false" accessors="true" output="false" extends="mura.plugin.pluginGenericEventHandler" {

	// framework variables
	include 'modelglueconfig.cfm';

	public any function init() {
		return this;
	}

	// ========================== Display Methods ==============================
	
	// This is where you put any display objects you wish to make available to Content Managers
	// These display objects will also have to be mapped in the config.xml.cfm file for Mura to know they exist and should be exposed

	public any function dspMuraModelGlue() {
		return getApplication().doAction(action='page.index', appKey='app1');
	}

	// ========================== Helper Methods ==============================

	private any function getApplication() {
		if( !StructKeyExists(request, '#variables.framework.applicationKey#Application') ) {
			request['#variables.framework.applicationKey#Application'] = new '#variables.framework.package#.Application'();
		};
		return request['#variables.framework.applicationKey#Application'];
	}

}