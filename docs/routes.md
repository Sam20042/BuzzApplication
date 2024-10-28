

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