SELECT 
    bugs.bugs_activity.bug_when as 'Time',
    bugs.bugs_activity.bug_id as 'Story ID',
    bugs.profiles.realname as Tester,
    bugs.bugs.short_desc as 'Summary',
    bugs.bugs_activity.removed,
    bugs.bugs_activity.added,
    concat("*",bugs.bugs.short_desc,"*(#",bugs.bugs_activity.bug_id," - ", bugs.profiles.realname,")" ) AS 'Copy to Roadmap'
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON  ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN
    bugs.bugs
ON  ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id)         

WHERE bugs.bugs_activity.who in (31,45,49,50)
AND bugs.bugs_activity.added = "TESTED"
AND bugs.bug_status = "TESTED"
ORDER BY  bugs.bugs_activity.bug_when DESC       
        ;