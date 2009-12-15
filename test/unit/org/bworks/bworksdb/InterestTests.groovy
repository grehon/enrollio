package org.bworks.bworksdb
import grails.test.*

class InterestTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testConstraints_Green() {
        mockDomain(Interest)
        
        def s = new Student()
        def p = new Program()
        
        // test
        def interest = new Interest(active:false, student:s, program:p)
        
        assertTrue interest.validate()
    }    

}
