
<%@ page import="x3.crm.address.Addressing" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'addressing.label', default: 'Addressing')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-addressing" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-addressing" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="addressType" title="${message(code: 'addressing.addressType.label', default: 'Address Type')}" />
					
						<g:sortableColumn property="addressTerm" title="${message(code: 'addressing.addressTerm.label', default: 'Address Term')}" />
					
						<g:sortableColumn property="isActice" title="${message(code: 'addressing.isActice.label', default: 'Is Actice')}" />
					
						<th><g:message code="addressing.person.label" default="Person" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${addressingInstanceList}" status="i" var="addressingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${addressingInstance.id}">${fieldValue(bean: addressingInstance, field: "addressType")}</g:link></td>
					
						<td>${fieldValue(bean: addressingInstance, field: "addressTerm")}</td>
					
						<td><g:formatBoolean boolean="${addressingInstance.isActice}" /></td>
					
						<td>${fieldValue(bean: addressingInstance, field: "person")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${addressingInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
