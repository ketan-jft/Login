<%@ page import="com.Register" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'register.label', default: 'Register')}" />
    <title>Login </title>
</head>
<body>
<a href="#list-register" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link controller="register" action="create">Register With Us</g:link></li>
    </ul>
</div>
    <form action="validate" method="post">
                <div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'userId', 'error')} required">
                    <label for="userId">
                        <g:message code="register.userId.label" default="User Id" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="userId" required="" value="${registerInstance?.userId}"/>

                </div>

                <div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'password', 'error')} required">
                    <label for="password">
                        <g:message code="register.password.label" default="Password" />
                        <span class="required-indicator">*</span>
                    </label>
                    <g:passwordField name="password" required="" value="${registerInstance?.password}"/>
                </div>
                <div class="fieldcontain">
                    <fieldset class="buttons">
                        <g:submitButton name="register" value="Login" />
                    </fieldset>
                </div>
    </form>
<div class="pagination">
    <g:paginate total="${registerInstanceCount ?: 0}" />
</div>
</body>
</html>
