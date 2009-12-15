import org.bworks.bworksdb.*

class MiscTagLib {

    def configSettingService

    def debug = { map ->
        if (grailsApplication.config.grails.views.debug.mode == true) {
            def msg = map['msg']
            out << "<h2>${msg}</h2><br/>"
        }
    }
    
    // Create a checkbox for all programs for this student
    // Checkboxes are named using an index 'idx' which corresponds to the student's
    // index, so that the appropriate programs/interests can be assigned to the appropriate
    // student.
    // If student already has an active Interest in a program, the checkbox is checked.
    def interestCheckBoxes = { attrs ->
        def student = attrs['student']
        def idx = attrs['idx']
        def defaultProgId
        // Whether to check the default program
        def checkDefaultProg = attrs['checkDefaultProg']
        if (checkDefaultProg) {
            defaultProgId = configSettingService.getSetting('defaultInterestProgram')
            if (defaultProgId) defaultProgId = defaultProgId.value;
        }
        def programs = Program.findAll()
        // def defaultProgram = configSettingService.getSetting('defaultInterestProgram')
        programs.each { prog ->
            // Note: Need to search for active == true, also
            def checkBoxName = "studentInterests[${idx}]"
            // TODO Find out why I can't put AndActive at the end of
            // this dynamic query
            def results = Interest.withCriteria {
                eq("student", student)
                eq("program", prog)
                eq("active", true)
            }
            // If student already has an interest in this program, or if
            // the caller wants us to check the default program automatically
            if (results || (checkDefaultProg && (prog.id.toString() == defaultProgId))) {
                out << g.checkBox(value:prog.id, checked:true, name:checkBoxName)
            }
            else {
                out << g.checkBox(value:prog.id, checked:false, name:checkBoxName)
            }
            out << "<label for='${checkBoxName}'>${prog.name}</label>"
            out << '<br />'
        }
        return out
    }

    def isCurrentTab = { attrs ->
        if (pageProperty(name:'meta.tabName') == attrs['tabName']) {
            out << 'current'
        }
        else {
            out << 'enr-top-menu-item'
        }
        return out
    }
}
