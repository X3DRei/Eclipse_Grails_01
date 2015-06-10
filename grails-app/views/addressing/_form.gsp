<%@ page import="x3.crm.address.Addressing" %>



<div class="fieldcontain ${hasErrors(bean: addressingInstance, field: 'addressType', 'error')} required">
	<label for="addressType">
		<g:message code="addressing.addressType.label" default="Address Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="addressType" from="${addressingInstance.constraints.addressType.inList}" required="" value="${addressingInstance?.addressType}" valueMessagePrefix="addressing.addressType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressingInstance, field: 'addressTerm', 'error')} required">
	<label for="addressTerm">
		<g:message code="addressing.addressTerm.label" default="Address Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="addressTerm" required="" value="${addressingInstance?.addressTerm}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressingInstance, field: 'isActice', 'error')} ">
	<label for="isActice">
		<g:message code="addressing.isActice.label" default="Is Actice" />
		
	</label>
	<g:checkBox name="isActice" value="${addressingInstance?.isActice}" />

</div>

<div class="fieldcontain ${hasErrors(bean: addressingInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="addressing.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${x3.crm.address.Person.list()}" optionKey="id" required="" value="${addressingInstance?.person?.id}" class="many-to-one"/>

</div>

