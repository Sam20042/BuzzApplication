# Phase 1 Sprint 5

## User/Admin stories:
As a user I want to access the application through a web browser so I can add/delete an idea.

As an admin I want to add/drop table entries so that i can manage the ideas posted by users.

## Listing (description) of the tests for the backend, admin, web, and mobile
Tests for Each User Story: 
Test the like and dislike counter by testing if the like or dislike counter goes up by 1. Testing for whether you are able to add friends and making a test to see if your friend count goes up by 1 if you add a friend or down by 1 if you block/remove one. Testing to see if you block a user, the profile will disappear from the website.

Tests ideas for backend:
Test whether a user can be made and data can be stored inside including an email and password. Test the backend to determine how fast queries are able to be run to find a specific user given user_id. Accurately be able to identify the number of likes for a given post and be able to update that value correctly once a new like is added. Be able to determine if a post is private or public using a query search.

Tests ideas for admin: 
Automatic Tests:
Test weather idea field in posts can’t have more than 512 characters.

Manual Tests: 
Create a table to store ideas.
Insert a few ideas into the table, ensuring each idea fits within a 512-character limit. Verify that all ideas are visible in the database and that each one contains the necessary information. Delete one of the ideas from the table, ensuring the others remain intact and only the deleted idea is removed. Drop the entire table, ensuring that no records remain after the table is dropped.

## System drawing 
https://lucid.app/lucidchart/516f5158-a2f9-45bb-adec-38fc204c9524/edit?viewport_loc=-279%2C-78%2C2899%2C1293%2C0_0&invitationId=inv_94fccc9b-75ff-4b9c-a1c3-74b119f140b9

## Drawing of a mock web/mobile user interface

## Drawing of state machine for anonymous user persona’s interaction with the application
https://lucid.app/lucidchart/888c1b78-6236-4cac-97c4-5459b87a900d/edit?beaconFlow[…]A&invitationId=inv_8afbfedc-a591-416a-a770-7e899d84cbe4&page=0_0

## Listing of the routes, their purpose, and the format of any passed object
The routes could look a bit like this:

### 1. GET /ideas
   - **Purpose:** Retrieve a list of all ideas.
   - **Response Format:** 
     - Array of message objects, each containing:
       ```json
       [
         {
           "id": 1,
           "content": "This is my first idea",
           "timestamp": "2024-10-05T12:34:56Z"
         },
         {
           "id": 2,
           "content": "Another idea",
           "timestamp": "2024-10-05T13:00:00Z"
         }
       ]
       ```

### 2. POST /ideas
   - **Purpose:** Add a new idea
   - **Request Format:**
     - JSON object passed in the request body:
       ```json
       {
         "content": "This is my second idea :)"
       }
       ```
   - **Response Format:**
     - Newly created message object with an auto-generated ID and timestamp:
       ```json
       {
         "id": 3,
         "content": "This is my third idea",
         "timestamp": "2024-10-05T14:00:00Z"
       }
       ```

### 3. DELETE /ideas/{id}
   - **Purpose:** Delete a message with the given ID.
   - **Request Format:**
     - No request body required, but the `id` should be passed as a URL parameter.
   - **Response Format:** 
     - A success message:
       ```json
       {
         "status": "success",
         "message": "idea deleted"
       }
       ```

## Entity relationship diagram of the database table and fields
link:
https://lucid.app/lucidchart/bb642f5b-6855-418e-ad6d-f705a918baa4/edit?viewport_loc=-89%2C356%2C1564%2C697%2C0_0&invitationId=inv_231d6c96-d58d-4a79-aef6-0e6c977e194e
