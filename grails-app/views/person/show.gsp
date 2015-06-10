
<%@ page import="x3.crm.address.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">
			
				<g:if test="${personInstance?.surname}">
				<li class="fieldcontain">
					<span id="surname-label" class="property-label"><g:message code="person.surname.label" default="Surname" /></span>
					
						<span class="property-value" aria-labelledby="surname-label"><g:fieldValue bean="${personInstance}" field="surname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.christianName}">
				<li class="fieldcontain">
					<span id="christianName-label" class="property-label"><g:message code="person.christianName.label" default="Christian Name" /></span>
					
						<span class="property-value" aria-labelledby="christianName-label"><g:fieldValue bean="${personInstance}" field="christianName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="person.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${personInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.birthDate}">
				<li class="fieldcontain">
					<span id="birthDate-label" class="property-label"><g:message code="person.birthDate.label" default="Birth Date" /></span>
					
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${personInstance?.birthDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.placeOfBirth}">
				<li class="fieldcontain">
					<span id="placeOfBirth-label" class="property-label"><g:message code="person.placeOfBirth.label" default="Place Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="placeOfBirth-label"><g:fieldValue bean="${personInstance}" field="placeOfBirth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.nationality}">
				<li class="fieldcontain">
					<span id="nationality-label" class="property-label"><g:message code="person.nationality.label" default="Nationality" /></span>
					
						<span class="property-value" aria-labelledby="nationality-label"><g:fieldValue bean="${personInstance}" field="nationality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="person.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${personInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.addressings}">
				<li class="fieldcontain">
					<span id="addressings-label" class="property-label"><g:message code="person.addressings.label" default="Addressings" /></span>
					
						<g:each in="${personInstance.addressings}" var="a">
						<span class="property-value" aria-labelledby="addressings-label"><g:link controller="addressing" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:personInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
