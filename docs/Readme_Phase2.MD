# Phase 2 Sprint 8

## User/Admin stories:

## Updated user story-based tests (indicate manual vs. automated)

## System Drawing:
https://lucid.app/lucidchart/516f5158-a2f9-45bb-adec-38fc204c9524/edit?invitationId=inv_94fccc9b-75ff-4b9c-a1c3-74b119f140b9&page=0_0#
## Updated mock web/mobile UI drawings

## Updated state machine drawing for user persona’s interaction with the application

## NEW state machine drawing from perspective of an idea object (update, add comment, edit comment, like, repeated like, dislike, repeated dislike, delete comment)

## Updated listing of routes, their purpose, and format of passed objects


## GET /ideas
### Purpose: 
Retrieve a list of ideas and comments and their attributes
### Request format: 

    {
        "mUserId": int
    }

#### Fields: 
* *mUserId* - The user ID of the user sending the GET request

### Response format: 

    {
        "mStatus": String,
        "mError": String,
        "mData": JSON object
        {
            "mIdeas": list of JSON
                [
                    {
                        "mId": int,
                        "mMessage": String,
                        "mAuthorId": int,
                        "mAuthorName": String,
                        "mUpvotes": int,
                        "mDownvotes": int,
                        "mVote": int
                    },
                    ...
                ],
            "mComments": list of JSON
                [
                    {
                        "mId": int,
                        "mIdeaId": int,
                        "mMessage": String,
                        "mAuthorId": int,
                        "mAuthorName": String
                    },
                    ...
                ]
        }
    }
#### Fields: 
* *mStatus* - Status of the request; either "ok" or "error"
* *mError* - Error message (null if mStatus is "ok", meaning there is no error)
* *mData* - The data being provided in the response
    * *mIdeass* - A list of all ideas and their attributes
        * *mId* - The ID of the idea
        * *mMessage* - The message content of the idea
        * *mAuthorId* - The user ID of the author of the idea
        * *mAuthorName* - The username of the author of the idea
        * *mUpvotes* - The number of upvotes on the idea
        * *mDownvotes* - The number of downvotes on the idea
        * *mVote* - Vote of the current user on the idea. 1 (or positive) if upvoted, -1 (or negative) if downvoted, 0 if neither.
    * *mComments* - A list of all comments and their attributes
        * *mId* - The ID of the comment
        * *mIdeaId* - The ID of the idea that is being commented on
        * *mMessage* - The message content of the comment
        * *mAuthorId* - The user ID of the author of the comment
        * *mAuthorName* - The username of the author of the comment


## GET /ideas/{id}
### Purpose: 
Retrieve one idea and its attributes
### Request format: 

    {
        "mUserId": int
    }

#### Fields: 
* *mUserId* - The user ID of the user sending the GET request

### Response format: 

    {
        "mStatus": String,
        "mError": String,
        "mData": JSON object
        {
            "mIdea": JSON object
                {
                    "mId": int,
                    "mMessage": String,
                    "mAuthorId": int,
                    "mAuthorName": String,
                    "mUpvotes": int,
                    "mDownvotes": int,
                    "mVote": int
                },
            "mComments": list of JSON
                [
                    {
                        "mId": int,
                        "mIdeaId": int,
                        "mMessage": String,
                        "mAuthorId": int,
                        "mAuthorName": String
                    },
                    ...
                ]
        }
    }
#### Fields: 
* *mStatus* - Status of the request; either "ok" or "error"
* *mError* - Error message (null if mStatus is "ok", meaning there is no error)
* *mData* - The data being provided in the response
    * *mIdea* - The idea being retrieved
        * *mId* - The ID of the idea
        * *mMessage* - The message content of the idea
        * *mAuthorId* - The user ID of the author of the idea
        * *mAuthorName* - The username of the author of the idea
        * *mUpvotes* - The number of upvotes on the idea
        * *mDownvotes* - The number of downvotes on the idea
        * *mVote* - Vote of the current user on the idea. 1 (or positive) if upvoted, -1 (or negative) if downvoted, 0 if neither.
    * *mComments* - A list of all comments on the idea and their attributes
        * *mId* - The ID of the comment
        * *mMessage* - The message content of the comment
        * *mAuthorId* - The user ID of the author of the comment
        * *mAuthorName* - The username of the author of the comment


## POST /ideas
### Purpose: 
Create a new idea posting
### Request format: 

    {
        "mUserId": int
        "mMessage": String
    }

#### Fields: 
* *mUserId* - The user ID of the user sending the POST request
* *mMessage* - The message content to include for the idea

### Response format: 

    {
        "mStatus": String,
        "mError": String,
        "mData": JSON object
        {
            "mIdea": JSON object
                {
                    "mId": int,
                    "mMessage": String,
                    "mAuthorId": int,
                    "mAuthorName": String,
                    "mUpvotes": int,
                    "mDownvotes": int,
                    "mVote": int
                },
            "mComments": list of JSON
                [
                    {
                        "mId": int,
                        "mMessage": String,
                        "mAuthorId": int,
                        "mAuthorName": String
                    },
                    ...
                ]
        }
    }
#### Fields: 
* *mStatus* - Status of the request; either "ok" or "error"
* *mError* - Error message (null if mStatus is "ok", meaning there is no error)
* *mData* - The data being provided in the response
    * *mIdea* - The new idea being created
        * *mId* - The ID of the idea
        * *mMessage* - The message content of the idea
        * *mAuthorId* - The user ID of the author of the idea
        * *mAuthorName* - The username of the author of the idea
        * *mUpvotes* - The number of upvotes on the idea ***(should be 0 for this response)***
        * *mDownvotes* - The number of downvotes on the idea ***(should be 0 for this response)***
        * *mVote* - Vote of the current user on the idea. 1 (or positive) if upvoted, -1 (or negative) if downvoted, 0 if neither ***(should be 0 for this response)***.
    * *mComments* - A list of all comments on the idea and their attributes ***(should be empty for this response)***
        * *mId* - The ID of the comment
        * *mMessage* - The message content of the comment
        * *mAuthorId* - The user ID of the author of the comment
        * *mAuthorName* - The username of the author of the comment

## POST /ideas/{id}/comments
### Purpose: 
Create a new comment on an idea
### Request format: 

    {
        "mUserId": int
        "mIdeaId": int
        "mMessage": String
    }

#### Fields: 
* *mUserId* - The user ID of the user sending the POST request
* *mIdeaId* - The ID of the idea that is being commented on
* *mMessage* - The message content to include for the comment

### Response format: 

    {
        "mStatus": String,
        "mError": String,
        "mData": JSON object
        {
            "mComment": JSON object
                {
                    "mId": int,
                    "mIdeaId": int,
                    "mMessage": String,
                    "mAuthorId": int,
                    "mAuthorName": String,
                },
        }
    }
#### Fields: 
* *mStatus* - Status of the request; either "ok" or "error"
* *mError* - Error message (null if mStatus is "ok", meaning there is no error)
* *mData* - The data being provided in the response
    * *mComment* - The new comment being created
        * *mId* - The ID of the comment
        * *mIdeaId* - The ID of the idea that is being commented on
        * *mMessage* - The message content of the comment
        * *mAuthorId* - The user ID of the author of the comment
        * *mAuthorName* - The username of the author of the comment

## PUT /ideas/{id}/upvote
### Purpose:
Upvote an idea
### Request format:
    {
        "mUserId": int
    }
#### Fields:
* *mUserId* - The user ID of the user sending the PUT request
### Response format:
    {
        "mStatus": String,
        "mError": String,
        "mData": JSON object
    
        {
            "mIdea": JSON object
                {
                    "mId": int,
                    "mUpvotes": int,
                    "mDownvotes": int,
                    "mVote": int
                },
        }
    }
#### Fields: 
* *mStatus* - Status of the request; either "ok" or "error"
* *mError* - Error message (null if mStatus is "ok", meaning there is no error)
* *mData* - The data being provided in the response
    * *mIdea* - The idea being retrieved
        * *mId* - The ID of the idea
        * *mUpvotes* - The new number of upvotes on the idea
        * *mDownvotes* - The new number of downvotes on the idea
        * *mVote* - Vote of the current user on the idea. 1 (or positive) if upvoted, -1 (or negative) if downvoted, 0 if neither ***(should be 1 for this response)***.

## PUT /ideas/{id}/downvote
### Purpose: 
Downvote an idea
### Request format:
    {
        "mUserId": int
    }
#### Fields:
* *mUserId* - The user ID of the user sending the PUT request
### Response format:
    {
        "mStatus": String,
        "mError": String,
        "mData": JSON object
    
        {
            "mIdea": JSON object
                {
                    "mId": int,
                    "mUpvotes": int,
                    "mDownvotes": int,
                    "mVote": int
                },
        }
    }
#### Fields: 
* *mStatus* - Status of the request; either "ok" or "error"
* *mError* - Error message (null if mStatus is "ok", meaning there is no error)
* *mData* - The data being provided in the response
    * *mIdea* - The idea being retrieved
        * *mId* - The ID of the idea
        * *mUpvotes* - The new number of upvotes on the idea
        * *mDownvotes* - The new number of downvotes on the idea
        * *mVote* - Vote of the current user on the idea. 1 (or positive) if upvoted, -1 (or negative) if downvoted, 0 if neither ***(should be -1 for this response)***.

## PUT /comments/{id}
### Purpose: 
Edit a comment
### Request format:
    {
        "mUserId": int,
        "mNewMessage": String
    }
#### Fields: 
* *mUserId* - The user ID of the user sending the PUT request
* *mNewMessage* - The new message content for the comment
### Response format: 

    {
        "mStatus": String,
        "mError": String,
        "mData": JSON object
        {
            "mComment": JSON object
                {
                    "mId": int,
                    "mIdeaId": int,
                    "mMessage": String,
                    "mAuthorId": int,
                    "mAuthorName": String,
                },
        }
    }
#### Fields: 
* *mStatus* - Status of the request; either "ok" or "error"
* *mError* - Error message (null if mStatus is "ok", meaning there is no error)
* *mData* - The data being provided in the response
    * *mComment* - The new comment being created
        * *mId* - The ID of the comment
        * *mIdeaId* - The ID of the idea that is being commented on
        * *mMessage* - The message content of the comment
        * *mAuthorId* - The user ID of the author of the comment
        * *mAuthorName* - The username of the author of the comment

## GET /user/{id}
### Purpose:
Get information about a user
### Request format:
    {
        "mUserId": int
    }
#### Fields:
* *mUserId* - The user ID of the user sending the GET request
### Response format: 
    {
        "mStatus": String,
        "mError": String,
        "mData": JSON object
        {
            "mOwner": boolean,
            "mUser": JSON object
                {
                    "mUserId": int,
                    "mUserName": String,
                    "mUserEmail": String,
                    "mUserGI": String,
                    "mUserSO": String,
                    "mUserNote": String
                }
        }
    }
#### Fields: 
* *mStatus* - Status of the request; either "ok" or "error"
* *mError* - Error message (null if mStatus is "ok", meaning there is no error)
* *mData* - The data being provided in the response
    * *mOwner* - Whether or not the user information being provided is about the current user. True if the current user "owns" this profile, False if not.
    * *mUser* - The user data being provided for the response
        * *mUserId* - The ID of the given user
        * *mUserName* - The username of the given user
        * *mUserEmail* - The email of the given user
        * **(OPTIONAL)** *mUserGI* - The gender identity of the given user. Only provided if the given user is the current user and "mOwner" is True.
        * **(OPTIONAL)** *mUserSO* - The sexual orientation of the given user. Only provided if the given user is the current user and "mOwner" is True.
        * *mUserNote* - The personal note of the given user.
## PUT /user/{id}
### Purpose:
Update/change information about a user
### Request format:
    {
        "mUserId": int,
        "mUserName": String,
        "mUserEmail": String,
        "mUserGI": String,
        "mUserSO": String,
        "mUserNote": String
    }
#### Fields:
* *mUserId* - The user ID of the user sending the GET request
* *mUserName* - The new username to change to
* *mUserEmail* - The new email to change to
* *mUserGI* - The new user gender identity to change to
* *mUserSO* - The new user sexual orientation to change to
* *mUserNote* - The new personal user note to change to
### Response format: 
    {
        "mStatus": String,
        "mError": String,
        "mData": JSON object
        {
            "mOwner": boolean,
            "mUser": JSON object
                {
                    "mUserId": int,
                    "mUserName": String,
                    "mUserEmail": String,
                    "mUserGI": String,
                    "mUserSO": String,
                    "mUserNote": String
                }
        }
    }
#### Fields: 
* *mStatus* - Status of the request; either "ok" or "error"
* *mError* - Error message (null if mStatus is "ok", meaning there is no error)
* *mData* - The data being provided in the response
    * *mOwner* - Whether or not the user information being provided is about the current user. True if the current user "owns" this profile, False if not.
    * *mUser* - The user data being provided for the response
        * *mUserId* - The ID of the given user
        * *mUserName* - The username of the given user
        * *mUserEmail* - The email of the given user
        * **(OPTIONAL)** *mUserGI* - The gender identity of the given user. Only provided if the given user is the current user and "mOwner" is True.
        * **(OPTIONAL)** *mUserSO* - The sexual orientation of the given user. Only provided if the given user is the current user and "mOwner" is True.
        * *mUserNote* - The personal note of the given user.

## POST /auth/weblogin
### Purpose:
Send ID token to server for authentication

## GET /auth/weblogout

## GET /auth/google/callback
## Updated Entity relationship diagram of the database tables and fields
https://lucid.app/lucidchart/bb642f5b-6855-418e-ad6d-f705a918baa4/edit?page=0_0&invitationId=inv_231d6c96-d58d-4a79-aef6-0e6c977e194e#
## Updated unit test DESCRIPTIONS for the backend, admin, web, and mobile (implementation not required for this sprint)

## Thorough list of all backlog items for Phase 2 (including tech debt from Phase 1 and/or Phase 1')
Mobile:

Connect Mobile PUT and POST routes to database

Web:

From phase 1:

Frontend UI needs to be updated

Get rid of that "Placeholder" box, as we are no longer putting anything there most likely

Fix the colors

Change the like and dislike buttons to icons instead of basic HTML buttons

Whatever else you think makes sense

More unit tests are needed

There could be more commenting in the files

More console logs

Test backend is pretty barebones

Currently only has a hardcoded memory store with many hardcoded responses, only made to simply make sure that requests and responses work on the frontend, presuming the JSON formats are correct

Add more main methods

A main method that uses the proper in-memory datastore classes we created in the tutorials

A main method that actually connects to the database(?)

Add in another environment variable that you can set called MODE or something that allows you to quickly and easily choose which main method to run when running the backend

.gitignore might need to be updated idk

For phase 2:
Google OAuth
Downvotes
Comments
Profiles
Update how upvotes/downvotes work ie 1 upvote/downvote per user per idea

Backend:
    For phase 2:
Add new tables to database: Comments and Users
Google OAuth
Clean up backend code
Clean or get rid of main methods


Correct/update comments
Improve terminal output for new routes and requirements


Admin:
   From Phase 1:
.gitignore could probably use work
PM:
	-Organize jira board (possibly add new colors to color code for organization).

Team's Dokku URL(s): http://team-git-gud.dokku.cse.lehigh.edu

Team's software repo (bitbucket): https://bitbucket.org/sml3/cse216_fa24_team_21/src/main/

Team's Jira board: https://cse216-24sp-ala326.atlassian.net/jira/software/projects/GGT2/boards/35?atlOrigin=eyJpIjoiMjBiMDA4ZTY2ODMxNGQ3OWE1Yjc0ODMzNjllYThmOTQiLCJwIjoiaiJ9

