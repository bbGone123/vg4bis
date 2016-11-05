SELECT
    bugs.keyworddefs.name,
    bugs.bugs.bug_id            AS Story_ID,
    bugs.bugs.short_desc        AS Description,
    bugs.bugs.priority          AS Priority,
    bugs.bugs.bug_severity      AS Severity,
    stories.realname            AS Story_Owner,
    bugs.bugs.bug_status        AS Story_status,
    bugs.dependencies.dependson AS Blocker,
    blokers.bug_status          AS Blocker_status,
    blokers.resolution          AS Blocker_resolution,
    bug_reporter.realname       AS Bug_Reporter,
    story_blockers.realname     AS Bug_Owner
FROM
    bugs.dependencies
INNER JOIN   bugs.bugs ON   ( bugs.dependencies.blocked = bugs.bugs.bug_id)

INNER JOIN    bugs.keywords ON  ( bugs.bugs.bug_id = bugs.keywords.bug_id)
        
INNER JOIN    bugs.bugs blokers            ON    (bugs.dependencies.dependson = blokers.bug_id)

INNER JOIN    bugs.profiles stories        ON   ( bugs.bugs.assigned_to = stories.userid)
INNER JOIN    bugs.profiles story_blockers ON    ( blokers.assigned_to = story_blockers.userid)
INNER JOIN    bugs.profiles bug_reporter   ON    ( blokers.reporter = bug_reporter.userid)
INNER JOIN    bugs.keyworddefs             ON    ( bugs.keywords.keywordid = bugs.keyworddefs.id)

WHERE
    bugs.keyworddefs.name = 'story'
AND bugs.bugs.bug_status IN (
                           --  'QA_IN_PROGRESS',
                             'TESTED')
AND blokers.bug_status NOT IN (
                             --  'OPENED',
                             --  'REOPENED',
                               'CLOSE',
                               'TESTED',
                               'QA_IN_PROGRESS',
                               'RELEASED'
                          )
ORDER BY
    bugs.bugs.bug_id DESC ;