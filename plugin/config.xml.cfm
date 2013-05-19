<!---

This file is part of MuraModelGlue

Copyright 2013 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

NOTE: Anytime you make a change to this file, you will need to EDIT the plugin and click 'Update'
for the new information to be picked up.

--->
<cfinclude template="../includes/modelglueconfig.cfm" />
<cfoutput><plugin>
	<name>#variables.framework.package#</name>
	<package>#variables.framework.package#</package>
	<directoryFormat>packageOnly</directoryFormat>
	<provider>Steve Withington</provider>
	<providerURL>http://stephenwithington.com</providerURL>
	<loadPriority>5</loadPriority>
	<version>#variables.framework.packageVersion#</version>
	<category>Application</category>
	<ormcfclocation />
	<customtagpaths />
	<mappings>
		<mapping name="ModelGlue" directory="includes/ModelGlue" />
	</mappings>
	<settings />
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="includes.eventHandler" persist="false" />
	</eventHandlers>
	<displayobjects location="global">
		<displayobject name="MuraModelGlue" displaymethod="dspMuraModelGlue" component="includes.displayObjects" persist="false" />
	</displayobjects>
</plugin></cfoutput>