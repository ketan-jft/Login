<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Login Example</title>
	</head>
	<body>
	<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link url="register">Register With Us</g:link></li>
			<li><g:link controller="register" action="login">Login</g:link></li>
		</ul>
	</div>
	<div id="page-body" role="main">
		<g:img id="logo" dir="images"
			   file="1.jpg" alt="hubbub logo" style="width: 100%;height: 100%" />
	</div>
	</body>
</html>
