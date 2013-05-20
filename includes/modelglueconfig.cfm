<cfscript>
/*

This file is part of MuraModelGlue

Copyright 2013 Stephen J. Withington, Jr.
Licensed under the Apache License, Version v2.0
http://www.apache.org/licenses/LICENSE-2.0

	NOTES:
		The most important variable to note is variables.framework.package.
		'package' should be set to whatever you want the directory name to be (e.g., MuraModelGlue)

*/
	// Model-Glue Configuration
	variables.framework = {
		package = 'MuraModelGlue'
		, packageVersion = '0.0.1'
	};

	variables.framework.applicationKey = variables.framework.package;
	variables.framework.action = variables.framework.package & 'action';
</cfscript>