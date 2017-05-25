<%@ page import="com.Register" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'register.label', default: 'Register')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-register" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<%
					String user=session.getAttribute("userId")
					if(user!=null)
					{
				%>
				<li><g:link controller="register" action="logout">Logout</g:link></li>
				<%
					}
					else {
				%>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<% } %>
			</ul>
		</div>
		<div id="list-register" class="content scaffold-list" role="main">
			<h1>Recent Registered List</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fullName" title="${message(code: 'register.fullName.label', default: 'Full Name')}" />
					
						<g:sortableColumn property="emailId" title="${message(code: 'register.emailId.label', default: 'Email Id')}" />
						%{--
						<g:sortableColumn property="mobile" title="${message(code: 'register.mobile.label', default: 'Mobile')}" />

						<g:sortableColumn property="userId" title="${message(code: 'register.userId.label', default: 'User Id')}" />

						<g:sortableColumn property="password" title="${message(code: 'register.password.label', default: 'Password')}" />
						--}%
					</tr>
				</thead>
				<tbody>
				<g:each in="${registerInstanceList}" status="i" var="registerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>%{--<g:link action="show" id="${registerInstance.id}">--}%${fieldValue(bean: registerInstance, field: "fullName")}%{--</g:link>--}%</td>
					
						<td>${fieldValue(bean: registerInstance, field: "emailId")}</td>

						%{--<td>${fieldValue(bean: registerInstance, field: "mobile")}</td>

						<td>${fieldValue(bean: registerInstance, field: "userId")}</td>

						<td>${fieldValue(bean: registerInstance, field: "password")}</td>--}%

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${registerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
