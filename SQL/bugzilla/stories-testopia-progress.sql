-- GET STORIES WITH TEST CASES AND EXECUTED TEST CASES
SELECT
    bugs.keyworddefs.name,
    bugs.bugs.bug_id            AS "Story ID",
    bugs.bugs.short_desc        AS "Story Summary",
    bugs.bugs.priority          AS Priority,
    bugs.bugs.bug_severity      AS Severity,
    stories.realname            AS Story_Owner,
    story_qa.realname           AS Story_QA,
    bugs.bugs.bug_status        AS Story_status
 

FROM  bugs.dependencies

INNER JOIN    bugs.bugs            ON (bugs.dependencies.blocked = bugs.bugs.bug_id)
INNER JOIN    bugs.keywords        ON (bugs.bugs.bug_id = bugs.keywords.bug_id)


INNER JOIN    bugs.profiles stories        ON  (bugs.bugs.assigned_to = stories.userid)
INNER JOIN    bugs.profiles story_qa       ON  (bugs.bugs.qa_contact = story_qa.userid)


INNER JOIN    bugs.keyworddefs             ON  (bugs.keywords.keywordid = bugs.keyworddefs.id)

WHERE    bugs.keyworddefs.name = 'story'
AND      bugs.bugs.bug_status IN   ('QA_IN_PROGRESS', 'TESTED')

 ORDER BY    bugs.bugs.bug_id DESC
;