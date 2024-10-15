package edu.lehigh.cse216.team21.admin;

import java.sql.Connection;
import java.util.Map;

import edu.lehigh.cse216.team21.admin.Database.RowData;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class DatabaseTest
        extends TestCase {
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public DatabaseTest(String testName) {
        super(testName);
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite() {
        return new TestSuite(DatabaseTest.class);
    }

    /**
     * Rigourous Test :-)
     */
    public void testDatabase_selecting_deleting() {
        Database db = Database.getDatabase();
        // clearing database for tests
        // will need to be changed for future but for now in phase 1 works - Brian
        db.dropTable();
        db.createTable();
        db.insertRow("Message", 40);
        // Checks if deleting row shows how many were deleted
        Database.RowData test = db.selectOne(1);
        // checking select row works
        assertTrue(test.mId() == 1);
        assertTrue(test.mMessage().equals("Message"));
        assertTrue(test.mLikes() == 40);
        // checking deleting row works
        assertTrue(db.deleteRow(1) == 1);
        // checks if deleting an already deleted row will return 0 rows deleted
        assertTrue(db.deleteRow(1) == 0);
    }
}
