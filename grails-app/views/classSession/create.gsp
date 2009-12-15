<%@ page import="org.bworks.bworksdb.ClassSession;org.bworks.bworksdb.Program" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="tabName" content="classSession" />
        <title>Create ClassSession</title>
        <script type="text/javascript" src="${resource(dir:'js', file:'jquery-1.3.2.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'ui.core.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'ui.datepicker.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'date.js')}"></script>
        <script type="text/javascript">
            // This function updates the other lessonDates when the startDate
            // is chosen from the Calendar.  Each lessonDate is given a date
            // that's a week later than the previous lessonDate
            $(document).ready(function(){
              $('#startDate').datepicker({
                  showOn: 'both',
                  buttonImage: '${resource(dir:'images', file:'calendar.gif')}',
                  onSelect: function(dateText, inst) { 
                  
                      $('.lessonDate').each(function(i) {
                          Date.format = 'mm/dd/yyyy';
                          var newDate = new Date(dateText);
                          newDate.addDays(i * 7);
                          $(this).val(newDate.asString('mm/dd/yyyy'));
                      });
                  }
              });
                 // This function updates the other lessonDates when the startDate
                 // is chosen from the Calendar.  Each lessonDate is given a date
                 // that's a week later than the previous lessonDate
                 $('#startDate').datepicker({
                   showOn: 'both',
                   buttonImage: '${resource(dir:'images', file:'calendar.gif')}',
                   onSelect: function(dateText, inst) { 
                   
                       $('.lessonDate').each(function(i) {
                           Date.format = 'mm/dd/yyyy';
                           var newDate = new Date(dateText);
                           newDate.addDays(i * 7);
                           $(this).val(newDate.asString('mm/dd/yyyy'));
                       });
                   }
                   });  
                 
                 // When user changes the program, then fetch
                 // the classes for the selected program, and
                 // re-populate the "Lesson Dates" section
                 // If user has already specified a startDate, then
                 // use that startDate for the 1st Lesson Date
                var url = "${createLink(action:'nextAvailableLessonDates', controller:'program')}";
                $('#programId').change(function() {
                    $.get(url, { 'id' : $(this).attr('value'),
                                 'startDate' : $('#startDate').val()
                        }, function(data) {
                        $('#lessonDates').html(data);
                    });
                });
             });
        </script>
    </head>
    <body>
        <g:form action="save" method="post">
            <div id="wrapper">
                <div id="content">
                    <div class="infobox">
                        <h3 class="reallynow">New Class Session</h3>
                        <g:hasErrors bean="${classSessionInstance}">
                            <div class="errors">
                                <g:renderErrors bean="${classSessionInstance}"
                                as="list" />
                            </div>
                        </g:hasErrors>
                        <table>
                            <tbody>
                                <tr class="prop">
                                    <td valign="top" class="name">
                                        <label for="name">Program:</label>
                                    </td>
                                    <td valign="top"
                                    class="value ${hasErrors(bean:classSessionInstance,field:'name','errors')}">
                <g:select id="programId" name="program.id"
          from="${Program.list()}"
          value="${classSessionInstance?.program.id}"
          optionKey="id" />
                                    </td>
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name">
                                        <label for="name">Name:</label>
                                    </td>
                                    <td valign="top"
                                    class="value ${hasErrors(bean:classSessionInstance,field:'name','errors')}">

                                        <input type="text" id="name" name="name"
                                        value="${fieldValue(bean:classSessionInstance,field:'name')}" />
                                    </td>
                                </tr>
                                <tr class="prop">
                                    <td valign="top" class="name">
                                        <label for="startDate">Start Date:</label>
                                    </td>
                                    <td valign="top"
                                    class="value ${hasErrors(bean:classSessionInstance,field:'startDate','errors')}">

                                        <input type="text" id="startDate" name="startDate"
                                        id="startDate"></input>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="infobox">
                        <h3 class="reallynow">Lesson Dates</h3>
                        <g:render template="editLessonDates"
                        model="[lessonDates:classSessionInstance.lessonDates]" />
                        </div>
                    </div>
            </div>
            <div id="footer">
                        <span class="button">
                            <input class="save" type="submit" value="Create" />
                        </span>
                    </div>
        </g:form>
    </body>
</html>
