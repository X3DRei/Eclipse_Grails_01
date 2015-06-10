
<%@ page import="x3.crm.address.Addressing" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'addressing.label', default: 'Addressing')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-addressing" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-addressing" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list addressing">
			
				<g:if test="${addressingInstance?.addressType}">
				<li class="fieldcontain">
					<span id="addressType-label" class="property-label"><g:message code="addressing.addressType.label" default="Address Type" /></span>
					
						<span class="property-value" aria-labelledby="addressType-label"><g:fieldValue bean="${addressingInstance}" field="addressType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressingInstance?.addressTerm}">
				<li class="fieldcontain">
					<span id="addressTerm-label" class="property-label"><g:message code="addressing.addressTerm.label" default="Address Term" /></span>
					
						<span class="property-value" aria-labelledby="addressTerm-label"><g:fieldValue bean="${addressingInstance}" field="addressTerm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressingInstance?.isActice}">
				<li class="fieldcontain">
					<span id="isActice-label" class="property-label"><g:message code="addressing.isActice.label" default="Is Actice" /></span>
					
						<span class="property-value" aria-labelledby="isActice-label"><g:formatBoolean boolean="${addressingInstance?.isActice}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressingInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="addressing.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${addressingInstance?.person?.id}">${addressingInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:addressingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${addressingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
