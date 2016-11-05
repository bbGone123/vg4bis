SELECT
    bugs.keyworddefs.name,
    bugs.bugs.bug_id            AS "Story ID",
    bugs.bugs.short_desc        AS "Story Summary",
    bugs.bugs.priority          AS Priority,
    bugs.bugs.bug_severity      AS Severity,
    stories.realname            AS Story_Owner,
    story_qa.realname           AS Story_QA,
    bugs.bugs.bug_status        AS Story_status,
    bugs.dependencies.dependson AS Blocked_By,
    blokers.short_desc          AS Blocker_Summary,
    blokers.bug_status          AS Blocker_status,
    blokers.resolution          AS Blocker_resolution,
    bug_reporter.realname       AS Bug_Reporter,
    story_blockers.realname     AS Bug_Owner

FROM  bugs.dependencies

INNER JOIN    bugs.bugs            ON (bugs.dependencies.blocked = bugs.bugs.bug_id)
INNER JOIN    bugs.keywords        ON (bugs.bugs.bug_id = bugs.keywords.bug_id)
INNER JOIN    bugs.bugs blokers    ON (bugs.dependencies.dependson = blokers.bug_id)

INNER JOIN    bugs.profiles stories        ON  (bugs.bugs.assigned_to = stories.userid)
INNER JOIN    bugs.profiles story_qa       ON  (bugs.bugs.qa_contact = story_qa.userid)
INNER JOIN    bugs.profiles story_blockers ON  (blokers.assigned_to = story_blockers.userid)
INNER JOIN    bugs.profiles bug_reporter   ON  (blokers.reporter = bug_reporter.userid)

INNER JOIN    bugs.keyworddefs             ON  (bugs.keywords.keywordid = bugs.keyworddefs.id)

WHERE    bugs.keyworddefs.name = 'story'
AND      bugs.bugs.bug_status IN   ('QA_IN_PROGRESS', 'TESTED')
AND      blokers.bug_status NOT IN ('CLOSE','RELEASED','QA_IN_PROGRESS','TESTED')
ORDER BY
    bugs.bugs.bug_id DESC,  blokers.resolution ASC ;


------------- Story Status - age, number of open issues -----------------------------------------
SELECT
    bugs.bugs.bug_id            AS "Story ID",
    bugs.bugs.short_desc        AS "Story Description",
    '4'                         AS "Story age",       -- days between status changed to VERIFY and today                     
    bugs.bugs.priority          AS Priority,
    bugs.bugs.bug_severity      AS Severity,
    stories.realname            AS Story_Owner,
    story_qa.realname           AS Story_QA,
    bugs.bugs.bug_status        AS Story_status,
    Count(bugs.dependencies.dependson) AS Total_Blockers,
    '2'                         AS Closed_Blockers,      --    Count(bugs.dependencies.dependson)
    '3'                         AS Active_Blockers       --    Count(bugs.dependencies.dependson) 


FROM          bugs.dependencies
INNER JOIN    bugs.bugs              ON  (bugs.dependencies.blocked = bugs.bugs.bug_id)
INNER JOIN    bugs.keywords          ON  (bugs.bugs.bug_id = bugs.keywords.bug_id)
INNER JOIN    bugs.bugs blokers      ON  (bugs.dependencies.dependson = blokers.bug_id)
INNER JOIN    bugs.profiles stories  ON  (bugs.bugs.assigned_to = stories.userid)
INNER JOIN    bugs.profiles story_qa ON  (bugs.bugs.qa_contact = story_qa.userid)

INNER JOIN    bugs.profiles story_blockers   ON  (blokers.assigned_to = story_blockers.userid)
INNER JOIN    bugs.profiles bug_reporter     ON  (blokers.reporter = bug_reporter.userid)
INNER JOIN    bugs.keyworddefs               ON  (bugs.keywords.keywordid = bugs.keyworddefs.id)

WHERE    bugs.keyworddefs.name = 'story'
AND      bugs.bugs.bug_status IN ('QA_IN_PROGRESS','TESTED')
AND      blokers.bug_status  NOT IN ('CLOSED','RELEASED')

GROUP BY  bugs.bugs.bug_id
ORDER BY  bugs.bugs.bug_id DESC,  blokers.resolution ASC;
    
 