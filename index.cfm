<cfsilent>
<!---

This file is part of MuraModelGlue

Copyright 2013 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

--->
	<cfset ModelGlue_LOCAL_COLDSPRING_PATH = expandPath(".") & "/admin/config/ColdSpring.xml" />
</cfsilent>
	<cfsavecontent variable="body">
		<cfinclude template="/ModelGlue/gesture/ModelGlue.cfm" />
	</cfsavecontent>
<cfoutput>
	#$.getBean('pluginManager').renderAdminTemplate(
		body = body
		, pageTitle = pluginConfig.getName()
	)#
</cfoutput>