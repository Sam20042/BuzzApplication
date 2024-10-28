# Phase 1 Sprint 6 - PM Report Template
Use this form to provide your project manager report for Phase 1 Sprint 6.

Submit one report per team. This should be submitted by the designated PM, except in approved circumstances. The report should be created as a markdown file (and converted to pdf if required).

In addition to uploading to coursesite, version control this in the `master` branch under the `docs` folder.

## Team Information [10 points total]

### Team Information:

* Number: 21
Name: Git-Gud
Mentor: <Matt Manganillo, mmm625@lehigh.edu>
Weekly live & synchronous meeting:
without mentor: 10/12/24
with mentor: 10/9/24
Team Roles:
Project Manger: <Aliza Askari, ala326@lehigh.edu>
Has this changed from last week (if so, why)? No
Backend developer: <Sam Deich, smd226@lehigh.edu>
Admin developer: <Brian Badillo, bdb226@lehigh.edu>
Web developer: <Anders Heyniger, avh226@lehigh.edu>
Mobile developer: <Ash Niemann, asn226@lehigh.edu>


### Essential links for this project:

Team's Dokku URL(s)
http://team-git-gud.dokku.cse.lehigh.edu
Team's software repo (bitbucket)
https://bitbucket.org/sml3/cse216_fa24_team_21/src/main/
Team's Jira board
https://cse216-24sp-ala326.atlassian.net/jira/software/projects/GGT2/boards/35?atlOrigin=eyJpIjoiMjBiMDA4ZTY2ODMxNGQ3OWE1Yjc0ODMzNjllYThmOTQiLCJwIjoiaiJ9



## General questions [15 points total]

1. Did the PM for this week submit this report (If not, why not?)? 
-Yes.
2. Has the team been gathering for a weekly, in-person meeting(s)? If not, why not?
-Yes.
3. Summarize how well the team met the requirements of this sprint.
-I think everyone has done a lot for this sprint equally and has put in a good amount of effort. I did not have to pick up after anyone (for example– team members not doing their part). 

4. Report on each member's progress (sprint and phase activity completion) –Everyone’s progress has been pretty regular. Today it is currently October 15th (due date) and some of my team members are still working on their part of the project, like Ash and Anders. However, everyone did start the day that the sprint was released, but I think we are all trying to get used to how these implementation sprints are going to work in the future. 
Anders: I think that I balanced things pretty well overall. I spent the first half of the sprint learning React.js, which took some time, but I think it was worth it. The rest was spent implementing the frontend as needed. Despite a few things needing fixes in the frontend, I think that overall I did pretty good this week. As a group, I think we could have coordinated some things better, as there was a lot of confusion and conflicts of how we implemented certain things. That said, I think we were able to get it all figured out pretty well.
Brian: I think i balanced pretty well this week tbh like all i have is unit tests and i would have done that last night if matt would just respond to me. Having a singular role and not tutorials for me at least much more manageable.
Ash: I think that this sprint was the most difficult to balance. I made use of time on Tuesday and Wednesday to touch up my Figma and learn/work on exporting the figma to my desktop to give me the baseline flutter. However, from Thursday to Monday night, I was away on a family vacation and unable to work on it much other than for an hour on Saturday, as it was pacing break. Monday night and Tuesday I finished my design and attempted to do group work, but we had difficulty connecting to the database. Instead I just made a mock database with some json objects and read from that
Sam: I think I handled it well. We had some errors but it was all figured out at the end.

    * If incomplete, what challenges are being overcome, how are they being overcome, and by when will the team member be able to finish? 
-I think we are still figuring out how to connect the frontend and the backend but it should be done by tonight’s due date (10/15).
    * If complete, how do you know everyone completed the work, and at a satisfactory level? 
-We are basically done now, we had to speak to our mentor about a few problems but got them fixed. It is at a satisfactory level because we met with our mentor and he helped us and graded some of our stuff. 

5. Summary of "code review" during which each team member discussed and showed their progress – "how did you confirm the status?"
-I confirmed the status by seeing everyone’s code progress during recitation and checking the pull requests (and approving them).
       * More details will follow on code reviews.
    * For now, report out on **when** (once? multiple times?) and **how** (in person? zoom? Watching a recording?) each member showed *and discussed* their progress. 
-Three times
        * Was this done individually with the PM, or together as a team?
-One time was done together on Zoom, the next we communicated through Slack and I did it individually. The last time was together, in person, during recitation. 
        * Did you watch each other’s videos? Did you each look at each others’ jira boards and git commit history?
-We all looked at the team Jira board. I checked all the git history on BitBucket. The video we are doing together. 

        * Did you notify each other via slack as you completed each tutorial? 
-We checked in on Slack regularly when we were done with quizzes and team work.
        * Were these reviews scheduled, or "on-demand" / as completed?
-On demand.

6. What did you do to encourage the team to be working on phase activities "sooner rather than later"?
-I don’t think my team needed encouragement since we all knew this implementation was very new to everyone and we did not want to mess it up. But I made sure I asked everyone where they were in their code regularly.

7. What did you do to encourage the team to help one another?
-I think it is known that everyone needs to help each other regardless so I did not need to encourage my team, it’s kind of just implied.

8. How well is the team communicating?
-It is usually all business but sometimes we discuss other things. We usually discuss other things in person. 
    * Has one or more team members been communicating infrequently, only after a long delay, or in a non-transparent way? 
-No
        * If so, what did you and/or the team do about this? How was this handled?
        * What was the reaction? 
        * Has communication improved?
-N/A

9. Discuss expectations the team has set for one another, if any. Please highlight any changes from last week.
-We do regular check ins on Slack and Zoom. We also each present what we have done so far so everyone gets a time to speak.

10. If anything was especially challenging or unclear, please make sure this is [1] itemized, [2] briefly described, [3] its status reported (resolved or unresolved), and [4] includes critical steps taken to find resolution. 
-Nothing right now
   
11. What might you suggest the team or the next PM "start", "stop", or "continue" doing in the next sprint?
-start: check in more often via zoom since it is easier
-stop: checking in a lot via slack (we should do it on zoom more).

## Role reporting [75 points total, 15 points each (teams of 4 get 15 free points)]
Report-out on each role, from the PM perspective.
You may seek input where appropriate, but this is primarily a PM related activity.

### Back-end

1. Overall evaluation of back-end development (how was the process? was Jira used appropriately? how were tasks created? how was completion of tasks verified?)
-My backend teammate used Jira and changed his assigned tasks to done/todo/etc.
2. List your back-end's REST API endpoints
-).get( "/hello", ctx -> ctx.result("Hello World") )
-app.delete("/messages/{id}", ctx -> {
-app.post("/messages", ctx -> {
3. Assess the quality of the back-end code
-The backend code is like the tutorial code. It was definitely referenced from that.
4. Describe the code review process you employed for the back-end
-I read the code, saw the test and made a checklist. For example: no code smells, no dead code, etc. 
5. What was the biggest issue that came up in code review of the back-end server? 
-The biggest issue was making sure the variables (and constants) were the same along each branch, and connecting to the frontend 
6. Is the back-end code appropriately organized into files / classes / packages?
-yes
7. Are the dependencies in the `pom.xml` file appropriate? Were there any unexpected dependencies added to the program?
-They are appropriate
8. Evaluate the quality of the unit tests for the back-end
-The unit tests are good since they properly test each function we need in the rubric.
9. Describe any technical debt you see in the back-end
-Nothing much, just a lot of comments which I think can be minimized. 

### Admin

1. Overall evaluation of admin app development (how was the process? was Jira used appropriately? how were tasks created? how was completion of tasks verified?)
-My admin teammate used Jira and changed his assigned tasks to done/todo/etc.
2. Describe the tables created by the admin app
-The tables are good since they do everything that is needed for this sprint
3. Assess the quality of the admin code
-The admin code was also like the tutorial code, so it was pretty well done and also clean.
4. Describe the code review process you employed for the admin app
-I checked the admin code before merging. I used the same code review checklist as I did with backend.
5. What was the biggest issue that came up in code review of the admin app?
-Making some of the table functions work properly.
6. Is the admin app code appropriately organized into files / classes / packages?
-yes
7. Are the dependencies in the `pom.xml` file appropriate? Were there any unexpected dependencies added to the program?
-They are appropriate
8. Evaluate the quality of the unit tests for the admin app
-The tests were well done and went smoothly
9. Describe any technical debt you see in the admin app
-I think the admin app was really well done, not much debt I can check
### Web

1. Overall evaluation of Web development (how was the process? was Jira used appropriately? how were tasks created? how was completion of tasks verified?)
-My frontend-web teammate used Jira and changed his assigned tasks to done/todo/etc.
2. Describe the different models and other templates used to provide the web front-end's user interface
-The frontend definitely used the mock drawing we had made for the UI (and it is done pretty well)
3. Assess the quality of the Web front-end code
-The frontend code is done well with a good amount of comments, but not blocks of them which makes it readable. Also very modular
4. Describe the code review process you employed for the Web front-end
-I checked the frontend code before merging. I used the same code review checklist as I did with backend and admin.
5. What was the biggest issue that came up in code review of the Web front-end?
-Probably the routes and merging with backend.
6. Is the Web front-end code appropriately organized into files / classes / packages?
-yes
7. Are the dependencies in the `package.json` file appropriate? Were there any unexpected dependencies added to the program?
-They are appropriate
8. Evaluate the quality of the unit tests for the Web front-end
-He has not made unit tests yet but will do them soon
9. Describe any technical debt you see in the Web front-end
-Everything looks pretty good besides the unit tests
### Mobile

1. Overall evaluation of Mobile development (how was the process? was Jira used appropriately? how were tasks created? how was completion of tasks verified?)
-My mobile teammate used Jira and changed his assigned tasks to done/todo/etc.
2. Describe the activities that comprise the Mobile app
-It went pretty well. My mobile teammate deployed to dokku when that was not even necessary, which is nice to see that it deploys and works. 
3. Assess the quality of the Mobile code
-The mobile code is modular and well structured.
4. Describe the code review process you employed for the Mobile front-end
-I checked the frontend code before merging. I used the same code review checklist as I did with the rest of the branches.
5. What was the biggest issue that came up in code review of the Mobile front-end?
-There were not really any issues. 
6. Is the Mobile front-end code appropriately organized into files / classes / packages?
-yes
7. Are the dependencies in the `pubspec.yaml` (or build.gradle) file appropriate? Were there any unexpected dependencies added to the program?
-They were appropriate
8. Evaluate the quality of the unit tests for the Mobile front-end here
-The unit tests went smoothly, showing that they were good quality. Everything connected and was solid
9. Describe any technical debt you see in the Mobile front-end here
-not much technical debt. Comments are fine and code is modular.

### Project Management
Self-evaluation of PM performance

1. When did your team meet with your mentor, and for how long?
-without mentor: 10/12/24 for over an hour. with mentor: 10/9/24 for 30 mins. 
2. Describe your use of Jira.  Did you have too much detail?  Too little?  Just enough? Did you implement policies around its use (if so, what were they?)?
-I made sure to remove the old issues so that it would not be cluttered and messy. I also moved all my tasks around to make sure they were done (or backlog).
3. How did you conduct team meetings?  How did your team interact outside of these meetings?
-Team meetings were done over zoom or in person, mostly over zoom as they were most effective
4. What techniques (daily check-ins/scrums, team programming, timelines, Jira use, group design exercises) did you use to mitigate risk? Highlight any changes from last week.
-We used Jira to track tasks, bugs, and progress. Each team member updated their tasks daily, and we reviewed the board during our daily check-ins. This was similar to last week but less rushed.
5. Describe any difficulties you faced in managing the interactions among your teammates. Were there any team issues that arose? If not, what do you believe is keeping things so constructive?
-No difficulties– we always work things out.
6. Describe the most significant obstacle or difficulty your team faced.
-Trying to get everything in by the deadline
7. What is your biggest concern as you think ahead to the next phase of the project? To the next sprint?
-I think there is less concern for the next sprint since everything hard is out the way.
8. How well did you estimate time during the early part of the phase?  How did your time estimates change as the phase progressed?
-I just wish I had more time to submit the video as I was stressed about that. But I started early even though there was not much work for me to do.
9. What aspects of the project would cause concern for your customer right now, if any?
-Probably just adding more things we can do to make this a full, complete app, liked editing messages and such but that is out of the scope so nothing as of right now. 

