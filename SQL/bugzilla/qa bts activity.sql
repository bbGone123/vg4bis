-- last updated 1/5/2015
SELECT 
    bugs.reporter,
    bugs.profiles.realname,
    bugs.bugs_activity.bug_when as 'Time',
    bugs.creation_ts as "Reported at",
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

WHERE 
/*
(bugs.bugs_activity.who in (31,45,49,50) 
AND bugs.bugs_activity.added != ""
-- AND bugs.bugs_activity.removed != ""
)

OR */ ( bugs.reporter in (31,45,49,50)   /*AND bugs.creation_ts>0 < bugs.bugs_activity.bug_when*/ )
 
   
 
ORDER BY  bugs.bugs_activity.bug_when DESC       
        ;