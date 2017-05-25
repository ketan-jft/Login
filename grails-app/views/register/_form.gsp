<%@ page import="com.Register" %>



<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'fullName', 'error')} required">
	<label for="fullName">
		<g:message code="register.fullName.label" default="Full Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fullName" required="" value="${registerInstance?.fullName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'emailId', 'error')} required">
	<label for="emailId">
		<g:message code="register.emailId.label" default="Email Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="emailId" required="" value="${registerInstance?.emailId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registerInstance, field: 'mobile', 'error')} required">
	<label for="mobile">
		<g:message code="register.mobile.label" default="Mobile" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mobile" required="" value="${registerInstance?.mobile}"/>

</div>

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
	<g:textField name="password" required="" value="${registerInstance?.password}"/>

</div>

