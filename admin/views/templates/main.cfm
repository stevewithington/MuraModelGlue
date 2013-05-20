<cfoutput>
<!---

This is a basic "wrapper" template for your application.

It expects you to run an event that includes a view named "body".
--->
<h1>MuraModelGlue</h1>

<!--- Display the view named "body" --->
#viewCollection.getView("body")#

<footer class="container">
	<ul class="breadcrumb pull-left">
		<li>
			<a href="https://github.com/stevewithington/MuraModelGlue"><i class="icon-github"></i> MuraModelGlue Github Project</a>&nbsp; <span class="divider">|</span>
		</li>
		<li>
			<a href="https://github.com/modelglue/modelglue-framework"><i class="icon-github"></i> Model-Glue Github Project</a>
		</li>
	</ul>
</footer>

</cfoutput>