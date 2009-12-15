
<%@ page import="org.bworks.bworksdb.Student" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="tabName" content="student" />
        <title>Edit Student</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="content">
                <div class="rightnow">
        <div class="body">
            <h1>Edit Student</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${studentInstance}">
            <div class="errors">
                <g:renderErrors bean="${studentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${studentInstance?.id}" />
                <input type="hidden" name="version" value="${studentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">First Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:studentInstance,field:'firstName','errors')}">
                                    <input type="text" id="firstName" name="firstName" value="${fieldValue(bean:studentInstance,field:'firstName')}"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="middleName">Middle Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:studentInstance,field:'middleName','errors')}">
                                    <input type="text" id="middleName" name="middleName" value="${fieldValue(bean:studentInstance,field:'middleName')}"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName">Last Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:studentInstance,field:'lastName','errors')}">
                                    <input type="text" id="lastName" name="lastName" value="${fieldValue(bean:studentInstance,field:'lastName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="birthDate">Birth Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:studentInstance,field:'birthDate','errors')}">
                                    <g:datePicker name="birthDate" value="${studentInstance?.birthDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contact">Contact:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:studentInstance,field:'contact','errors')}">
                                    <g:select optionKey="id" from="${org.bworks.bworksdb.Contact.list()}" name="contact.id" value="${studentInstance?.contact?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gender">Gender:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:studentInstance,field:'gender','errors')}">
                                    <input type="text" id="gender" name="gender" value="${fieldValue(bean:studentInstance,field:'gender')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="middleName">Email Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:studentInstance,field:'emailAddress','errors')}">
                                    <input type="text" id="emailAddress" name="emailAddress" value="${fieldValue(bean:studentInstance,field:'emailAddress')}"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="interests">Interests:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:studentInstance,field:'interests','errors')}">
                                    <g:select name="interests"
from="${org.bworks.bworksdb.Interest.list()}"
size="5" multiple="yes" optionKey="id"
value="${studentInstance?.interests}" />

                                </td>
                            </tr> 
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
        </div>
        </div><div id="sidebar">
            <g:render template="/common/sideMenu" />
        </div>
    </body>
</html>
