package org.bworks.bworksdb

import org.bworks.bworksdb.util.TestKeys
import grails.test.*

class StudentServiceTests extends GrailsUnitTestCase {
    def studentService
    
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void assertInterestSelection(student, programName, isSelected) {
        def result = student.interests.find { it.program.name == programName }
        assertEquals isSelected, result.active        
    }
    
    void testSaveInterests_NewInterest() {
        // see TestDataService for preloaded data
        def student = Student.findByLastName(TestKeys.STUDENT)
        def selection = Program.findByName(TestKeys.PROGRAM_MENTORSHIP).id.toString()
        
        // test
        studentService.saveInterests(student, selection)

        assertInterestSelection(student, TestKeys.PROGRAM_MENTORSHIP, true)
        assertInterestSelection(student, TestKeys.PROGRAM_KIDS_AEC, false)
        assertInterestSelection(student, TestKeys.PROGRAM_ADULT_AEC, false)
    }
    
    void testSaveInterests_SelectInterest() {
        // see TestDataService for preloaded data
        def student = Student.findByLastName(TestKeys.STUDENT)
        def selection = Program.findByName(TestKeys.PROGRAM_KIDS_AEC).id.toString()
        
        // test
        studentService.saveInterests(student, selection)

        assertInterestSelection(student, TestKeys.PROGRAM_KIDS_AEC, true)
        assertInterestSelection(student, TestKeys.PROGRAM_ADULT_AEC, false)
    }

    void testSaveInterests_SelectAllInterests() {
        // see TestDataService for preloaded data
        def student = Student.findByLastName(TestKeys.STUDENT)
        def selections = []
        
        selections << Program.findByName(TestKeys.PROGRAM_KIDS_AEC).id.toString()
        selections << Program.findByName(TestKeys.PROGRAM_ADULT_AEC).id.toString()
        selections << Program.findByName(TestKeys.PROGRAM_MENTORSHIP).id.toString()
        
        // test
        studentService.saveInterests(student, selections)

        assertInterestSelection(student, TestKeys.PROGRAM_MENTORSHIP, true)
        assertInterestSelection(student, TestKeys.PROGRAM_KIDS_AEC, true)
        assertInterestSelection(student, TestKeys.PROGRAM_ADULT_AEC, true)
    }
    
    void testSaveInterests_SelectNone() {
        // see TestDataService for preloaded data
        def program = Program.findByName(TestKeys.PROGRAM_KIDS_AEC)
        def student = Student.findByLastName(TestKeys.STUDENT)
        
        // test
        studentService.saveInterests(student, [])

        assertInterestSelection(student, TestKeys.PROGRAM_KIDS_AEC, false)
        assertInterestSelection(student, TestKeys.PROGRAM_ADULT_AEC, false)
    }
    
}
