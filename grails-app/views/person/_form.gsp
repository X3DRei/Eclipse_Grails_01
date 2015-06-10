<%@ page import="x3.crm.address.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'surname', 'error')} required">
	<label for="surname">
		<g:message code="person.surname.label" default="Surname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="surname" required="" value="${personInstance?.surname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'christianName', 'error')} required">
	<label for="christianName">
		<g:message code="person.christianName.label" default="Christian Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="christianName" required="" value="${personInstance?.christianName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="person.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gender" from="${personInstance.constraints.gender.inList}" required="" value="${personInstance?.gender}" valueMessagePrefix="person.gender"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthDate', 'error')} required">
	<label for="birthDate">
		<g:message code="person.birthDate.label" default="Birth Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${personInstance?.birthDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'placeOfBirth', 'error')} required">
	<label for="placeOfBirth">
		<g:message code="person.placeOfBirth.label" default="Place Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="placeOfBirth" required="" value="${personInstance?.placeOfBirth}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'nationality', 'error')} required">
	<label for="nationality">
		<g:message code="person.nationality.label" default="Nationality" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nationality" required="" value="${personInstance?.nationality}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="person.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${personInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'addressings', 'error')} ">
	<label for="addressings">
		<g:message code="person.addressings.label" default="Addressings" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.addressings?}" var="a">
    <li><g:link controller="addressing" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="addressing" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'addressing.label', default: 'Addressing')])}</g:link>
</li>
</ul>


</div>

