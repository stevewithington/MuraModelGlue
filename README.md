# MuraModelGlue
-------------------------------------------------------------------------------

## Introduction
This is a base Mura CMS plugin using [Model-Glue](http://www.model-glue.com) as its 
application framework.  It's intended to be used by experienced ColdFusion/CFML 
developers and those developers familiar with Model-Glue.

There are technically two (2) MG applications included in this plugin:
	* **admin:** an area that can be used by Content Managers to administer the plugin.
	* **app1:** a display object that will be available for Content Managers via the 'Layout & Objects' tab by selecting 'Plugins' from the Content Objects select menu, then choosing the plugin (e.g, MuraModelGlue) and then assigning the display object to a content display region.

In addition, you could place **app1** directly into a layout template with the following code:
	* ```coldfusion
		#$.MuraModelGlue.doAction(action='page.index', appKey='app1')#
	```


### Minimum Requirements
	* Mura CMS v.6.0+
	* Adobe ColdFusion 9.0.1+ or Railo 3.3+

## Important Notes
This plugin has NOT been fully tested. It's just an example of one way to get a 
Model-Glue application into Mura CMS.


## Additional Resources
* [Model-Glue Project Home](http://www.model-glue.com)
* [Model-Glue Github Project](https://github.com/modelglue/modelglue-framework)
* [MuraModelGlue Project Home](http://github.com/stevewithington/MuraModelGlue)
* [Mura CMS Project Home](http://www.getmura.com)
* [Mura CMS Github Project](http://github.com/blueriver/MuraCMS.git)
* [Mura Support](http://www.getmura.com/index.cfm/support/)
* [Mura Blog](http://www.getmura.com/index.cfm/blog/)
* [Mura Forum](http://www.getmura.com/forum/)


## License
Copyright 2013 Stephen J. Withington, Jr.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.