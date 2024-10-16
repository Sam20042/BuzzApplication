package edu.lehigh.cse216.smd226.backend;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class MockDataRowTest extends TestCase{
    /* Create the test case
     *
     * @param testName name of the test case
     */
    public MockDataRowTest(String testName) {
        super(testName);
    }
    /**
     * @return the suite of tests being tested
     */
    public static Test suite() {
        return new TestSuite(MockDataRow.class);
    }
    public void testConstructor() {
        String message = "Test Message";
        int likes = 5;
        int id = 17;
        MockDataRow d = new MockDataRow(id, message, likes); //date is set to null at the moment, create two mockdatarow objects
        MockDataRow dd = new MockDataRow("Test Message", 5, 17);
        assertTrue(d.mMessage().equals(message));
        assertTrue(d.mLikes() == likes);
        assertTrue(d.mId() == id);
        assertTrue(d == dd);
    }
    public void testConstructor2(){
        String message = "Test Message";
        int likes = 200;
        int id = 0;
        MockDataRow d = new MockDataRow(id, message, likes); //date is set to null at the moment
        MockDataRow dd = new MockDataRow("Test Message", 200, 0);
        assertTrue(d.mMessage().equals(message));
        assertTrue(d.mLikes() == likes);
        assertTrue(d.mId() == id);
        assertTrue(d == dd);
    }
}
