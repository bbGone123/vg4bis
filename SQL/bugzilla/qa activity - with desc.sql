SELECT
    bugs.profiles.realname,
    bugs.bugs_activity.bug_when,
    bugs.bugs_activity.bug_id,
    bugs.bugs.short_desc,
    bugs.bugs_activity.removed,
    bugs.bugs_activity.added
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON
    ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN   bugs.bugs
ON
    ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id) 

 WHERE bugs.profiles.realname REGEXP 'Chalabi|Zeppa|Verma|Grijalva' 
 ORDER BY bugs.bugs_activity.bug_when DESC
 ;