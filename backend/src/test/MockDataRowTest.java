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
        MockDataRow d = new MockDataRow(id, message, likes, null); //date is set to null at the moment

        assertTrue(d.mMessage().equals(message));
        assertTrue(d.mLikes() == likes);
        assertTrue(d.mId() == id);
        assertFalse(d.mCreated() == null); // this can help catch subtle bugs!
    }
}
