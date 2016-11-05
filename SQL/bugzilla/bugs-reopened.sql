SELECT 
    bugs.profiles.realname,
    bugs.bugs_activity.bug_when as 'Time',
    bugs.bugs_activity.bug_id,
    bugs.bugs.short_desc as 'Summary',
    bugs.bugs_activity.removed,
    bugs.bugs_activity.added
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON  ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN
    bugs.bugs
ON  ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id)         

WHERE bugs.bugs_activity.added = 'REOPENED'
ORDER BY  bugs.bugs_activity.bug_when DESC       
        ;