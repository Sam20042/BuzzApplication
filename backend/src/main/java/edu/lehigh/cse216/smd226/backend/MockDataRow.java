package edu.lehigh.cse216.smd226.backend;

import java.util.Date;

/**
 * MockDataRow holds a row of information.  A row of information consists of
 * an identifier, strings for a "title" and "content", and a creation date.
 * Being a java record, all fields are final (cannot be changed)
 * 
 * We will ultimately be converting instances of this object into JSONdirectly, 
 * so it is convenient that all record fields are public. This is ok because
 * all fields are immutable. 
 */
public record MockDataRow( int mId, String mTitle, int mLikes, Date mCreated ){

    /**
     * We override the default constructor to set a null mCreated to the current time
     * @param mId The unique identifier associated with this element. Can be null
     * @param mTitle The title for this row of data. Can be null
     * @param mLikes The content for this row of data. Can be null
     * @param mCreated The creation date for this row of data; if null, sets it to current system clock time
     */
    public MockDataRow {
        if(mCreated == null)
            mCreated = new Date();
    }

    /**
     * For convenience, because of the immutability of records, we also provide a 
     * Builder that lets you incrementally initialize the object, and then build() it
     * when ready to have an instance of MockDataRow.
     * @return instance on which all public fields are set; build() it when done.
     */
    public Builder builder(){return new Builder( this );}

    /** because record fields are final, we have a builder */
    public static class Builder{
        public int mId;
        public String mTitle;
        public int mLikes;
        public Date mCreated;

        private Builder(){}
        private Builder( MockDataRow mdr ){
            this.mId = mdr.mId;
            this.mTitle = mdr.mTitle;
            this.mLikes = mdr.mLikes;
            this.mCreated = mdr.mCreated;
        }
        
        /** returns a new MockDataRow instance with currently set values of builder */
        public MockDataRow build(){
            return new MockDataRow(mId, mTitle, mLikes, mCreated);
        }
    }
}
