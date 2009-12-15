
<%@ page import="org.bworks.bworksdb.LessonDate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="tabName" content="classSession" />
        <title>Create LessonDate</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">LessonDate List</g:link></span>
        </div>
        <div class="body">
            <h1>Create LessonDate</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${lessonDateInstance}">
            <div class="errors">
                <g:renderErrors bean="${lessonDateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lessonDate">Lesson Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lessonDateInstance,field:'lessonDate','errors')}">
                                    <g:datePicker name="lessonDate" value="${lessonDateInstance?.lessonDate}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
