
<%@ page import="org.bworks.bworksdb.Lesson" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="tabName" content="program" />
        <title>Edit Lesson</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Lesson List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Lesson</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Lesson</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${lessonInstance}">
            <div class="errors">
                <g:renderErrors bean="${lessonInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${lessonInstance?.id}" />
                <input type="hidden" name="version" value="${lessonInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lessonInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:lessonInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="program">Program:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lessonInstance,field:'program','errors')}">
                                    <g:select optionKey="id" from="${org.bworks.bworksdb.Program.list()}" name="program.id" value="${lessonInstance?.program?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lessonInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:lessonInstance,field:'description')}"/>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sequence">Sequence:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lessonInstance,field:'sequence','errors')}">
                                    <input type="text" id="sequence" name="sequence" value="${fieldValue(bean:lessonInstance,field:'sequence')}" />
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
    </body>
</html>
