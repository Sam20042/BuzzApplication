# Phase 1prime Sprint 7 - PM Report Template
Use this form to provide your project manager report for Phase 1 Sprint 6.

## Team Information [10 points total]

### Team Information:

* Number: 21
* Name: Git-Gud
* Mentor: <Matt Manganillo, mmm625@lehigh.edu>
* Weekly live & synchronous meeting:
    * without mentor: 10/20/24
    * with mentor:

### Team Roles:

* Project Manager: <Aliza Askari, ala326@lehigh.edu>
    * Has this changed from last week (if so, why)? No
* Backend developer: <Sam Deich, smd226@lehigh.edu> 
* Admin developer: <Brian Badillo, bdb226@lehigh.edu> 
* Web developer: <Anders Heyniger, avh226@lehigh.edu>
*  Mobile developer: <Ash Niemann, asn226@lehigh.edu>
### Essential links for this project:

* Team's Dokku URL(s): http://team-git-gud.dokku.cse.lehigh.edu 
* Team's software repo (bitbucket): https://bitbucket.org/sml3/cse216_fa24_team_21/src/main/ 
* Team's Jira board: https://cse216-24sp-ala326.atlassian.net/jira/software/projects/GGT2/boards/35?atlOrigin=eyJpIjoiMjBiMDA4ZTY2ODMxNGQ3OWE1Yjc0ODMzNjllYThmOTQiLCJwIjoiaiJ9

## General questions [15 points total]

1. Did the PM for this week submit this report (If not, why not?)? 
* Yes

2. Has the team been gathering for a weekly, in-person meeting(s)? If not, why not? 
* Yes

3. Summarize how well the team met the requirements of this sprint.
    * I think everyone has done a lot for this sprint equally and has put in a good amount of effort. I did not have to pick up after anyone (for example– team members not doing their part). 

4. Report on each member's progress (sprint and phase activity completion) – "what is the status?"
    * If incomplete, what challenges are being overcome, how are they being overcome, and by when will the team member be able to finish?
    * If complete, how do you know everyone completed the work, and at a satisfactory level?

* The status, as of the main application code is mostly complete. The only thing my team is really working on is the jsdoc/dartdoc files. I think the only challenge as of right now is completing the last few steps (like the supporting docs) on time. Each member has a plan laid out so it will be done. 
* Brian: "I think this one i balanced pretty off because i was focusing on other classes mostly and now ill be doing artifact stuff tn. Quizzes i did last minute but its ok cause i got them done."
* Anders: "This sprint was OK since it was just fixing things up which we didn't do last time. I still have a little left to do but I think I handled my time as best as I could."
* Ash: "I think this sprint was not too bad to handle since there was not much for me left to do. It was definitely easier than last sprint."
* Sam: "I’ve been super busy with homework. But I balanced my time the best this week by doing a little computer science homework every day. And for group work, I made sure to keep in touch with Anders to make sure we could coordinate the routes."

5. Summary of "code review" during which each team member discussed and showed their progress – "how did you confirm the status?"
* The reviews were done right when everyone was done with their code (10/22). They were on demand, done individually by me, and also done one time via pull request. 

 What did you do to encourage the team to be working on phase activities "sooner rather than later"?
* Everyone started soon for this sprint

7. What did you do to encourage the team to help one another?
* My team did not really need encouragement and we help one another on demand or via zoom call.


8. How well is the team communicating?
* My team communicates well via slack, but also our weekly zoom calls. It is mostly business. The zoom calls leave room for more casual conversation. Everyone communicates frequently.

9. Discuss expectations the team has set for one another, if any. Please highlight any changes from last week.
* We are all nice to each other so we have not really set any expectations since it does not seem necessary. Our slack messages are regular, and usually pick up the pace when sprints are assigned. I make sure to ask who wants to present first during our zoom meetings to show our progress to make sure everyone gets the chance to speak and present.
    

10. If anything was especially challenging or unclear, please make sure this is [1] itemized, [2] briefly described, [3] its status reported (resolved or unresolved), and [4] includes critical steps taken to find resolution.
* N/A
    
11. What might you suggest the team or the next PM "start", "stop", or "continue" doing in the next sprint?
* start: maybe making a meeting recap after each meeting
* stop: waiting until the last minute to do stuff
* continue: communicating

## Role reporting [75 points total, 15 points each (teams of 4 get 15 free points)]
Report-out on each role, from the PM perspective.
You may seek input where appropriate, but this is primarily a PM related activity.

### Back-end

1. Overall evaluation of back-end development (how was the process? was Jira used appropriately? how were tasks created? how was completion of tasks verified?)
* My backend teammate used Jira and changed his assigned tasks to done/todo/etc.

2. List your back-end's REST API endpoints
* -).get( "/hello", ctx -> ctx.result("Hello World") )
* -app.delete("/messages/{id}", ctx -> {
* -app.post("/messages", ctx -> {


3. Assess the quality of the back-end code
* The backend code is like the tutorial code. It was definitely referenced from that.

4. Describe the code review process you employed for the back-end
* I read the code, saw the test and made a checklist. For example: no code smells, no dead code, etc. 

5. What was the biggest issue that came up in code review of the back-end server? 
* The biggest issue was making sure the variables (and constants) were the same along each branch, and connecting to the frontend 

6. Is the back-end code appropriately organized into files / classes / packages?
* yes

7. Are the dependencies in the `pom.xml` file appropriate? Were there any unexpected dependencies added to the program?
* They are appropriate

8. Evaluate the quality of the unit tests for the back-end
* The unit tests are good since they properly test each function we need in the rubric.

9. Describe any technical debt you see in the back-end
* Nothing much, just a lot of comments which I think can be minimized. 

### Admin

1. Overall evaluation of admin app development (how was the process? was Jira used appropriately? how were tasks created? how was completion of tasks verified?)
* My admin teammate used Jira and changed his assigned tasks to done/todo/etc.

2. Describe the tables created by the admin app
* The tables are good since they do everything that is needed for this sprint

3. Assess the quality of the admin code
* The admin code was also like the tutorial code, so it was pretty well done and also clean.

4. Describe the code review process you employed for the admin app
* I checked the admin code before merging. I used the same code review checklist as I did with backend.

5. What was the biggest issue that came up in code review of the admin app?
* Nothing it is pretty good

6. Is the admin app code appropriately organized into files / classes / packages?
* yes
7. Are the dependencies in the `pom.xml` file appropriate? Were there any unexpected dependencies added to the program?
* They are appropriate

8. Evaluate the quality of the unit tests for the admin app
* The tests were well done and went smoothly

9. Describe any technical debt you see in the admin app
* I think the admin app was really well done, not much debt.

### Web

1. Overall evaluation of Web development (how was the process? was Jira used appropriately? how were tasks created? how was completion of tasks verified?)
* My frontend-web teammate used Jira and changed his assigned tasks to done/todo/etc.

2. Describe the different models and other templates used to provide the web front-end's user interface
* The frontend definitely used the mock drawing we had made for the UI (and it is done pretty well)

3. Assess the quality of the Web front-end code
* The frontend code is done well with a good amount of comments, but not blocks of them which makes it readable. Also very modular

4. Describe the code review process you employed for the Web front-end
* I checked the frontend code before merging. I used the same code review checklist as I did with backend and admin.

5. What was the biggest issue that came up in code review of the Web front-end?
* Probably the routes and merging with backend.

6. Is the Web front-end code appropriately organized into files / classes / packages?
* yes

7. Are the dependencies in the `package.json` file appropriate? Were there any unexpected dependencies added to the program?
* They are appropriate

8. Evaluate the quality of the unit tests for the Web front-end
* He has not made unit tests yet but will do them soon

9. Describe any technical debt you see in the Web front-end
* Everything looks pretty good besides the unit tests

### Mobile

1. Overall evaluation of Mobile development (how was the process? was Jira used appropriately? how were tasks created? how was completion of tasks verified?)
* My mobile teammate used Jira and changed his assigned tasks to done/todo/etc.

2. Describe the activities that comprise the Mobile app
* It went pretty well. My mobile teammate deployed to dokku when that was not even necessary, which is nice to see that it deploys and works. 

3. Assess the quality of the Mobile code
* The mobile code is modular and well structured.

4. Describe the code review process you employed for the Mobile front-end
* I checked the frontend code before merging. I used the same code review checklist as I did with the rest of the branches.

5. What was the biggest issue that came up in code review of the Mobile front-end?
* There were not really any issues. 

6. Is the Mobile front-end code appropriately organized into files / classes / packages?
* yes

7. Are the dependencies in the `pubspec.yaml` (or build.gradle) file appropriate? Were there any unexpected dependencies added to the program?
* They were appropriate

8. Evaluate the quality of the unit tests for the Mobile front-end here
* The unit tests went smoothly, showing that they were good quality. Everything connected and was solid

9. Describe any technical debt you see in the Mobile front-end here

* not much technical debt. Comments are fine and code is modular.

### Project Management
Self-evaluation of PM performance

1. When did your team meet with your mentor, and for how long?
-without mentor: 10/12/24 for over an hour. with mentor: 10/9/24 for 30 mins. 
2. Describe your use of Jira.  Did you have too much detail?  Too little?  Just enough? Did you implement policies around its use (if so, what were they?)?
-I made sure to remove the old issues so that it would not be cluttered and messy. I also moved all my tasks around to make sure they were done (or backlog).
3. How did you conduct team meetings?  How did your team interact outside of these meetings?
* Team meetings were done over zoom or in person, mostly over zoom as they were most effective

4. What techniques (daily check-ins/scrums, team programming, timelines, Jira use, group design exercises) did you use to mitigate risk? Highlight any changes from last week.
* We used Jira to track tasks, bugs, and progress. Each team member updated their tasks daily, and we reviewed the board during our daily check-ins. This was similar to last week but less rushed.

5. Describe any difficulties you faced in managing the interactions among your teammates. Were there any team issues that arose? If not, what do you believe is keeping things so constructive?
* No difficulties– we always work things out.

6. Describe the most significant obstacle or difficulty your team faced.
* Trying to get everything in by the deadline

7. What is your biggest concern as you think ahead to the next phase of the project? To the next sprint?
* Switching roles

8. How well did you estimate time during the early part of the phase?  How did your time estimates change as the phase progressed?
* I just wish I had more time to submit the video as I was stressed about that, since my team members have to get it in to me before I can even make the full video. But I started early even though there was not much work for me to do.

9. What aspects of the project would cause concern for your customer right now, if any?
* Probably just adding more things we can do to make this a full, complete app, liked editing messages and such but that is out of the scope so nothing as of right now.

