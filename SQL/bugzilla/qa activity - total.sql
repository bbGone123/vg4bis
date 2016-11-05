SELECT
   -- DISTINCT
    DATE(bugs.bugs_activity.bug_when) as BusDate,
    bugs.profiles.realname as Reporter,
    COUNT(bugs.profiles.realname) as "BZ updates"
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON
    ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN   bugs.bugs
ON
    ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id) 

 WHERE bugs.profiles.realname REGEXP 'Chalabi|Zeppa|Verma|Grijalva|Zhang|Hass|Lunova' 
 GROUP BY 
      --bugs.bugs_activity.bug_when,bugs.profiles.realname
      BusDate, Reporter
 ORDER BY 
 BusDate DESC
 -- bugs.bugs_activity.bug_when DESC
 ;
 
 -- Team total --
 SELECT
   -- DISTINCT
    DATE(bugs.bugs_activity.bug_when) as BusDate,
    COUNT(bugs.bugs_activity.bug_when) as "Team BZ updates"
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON
    ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN   bugs.bugs
ON
    ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id) 

 WHERE bugs.profiles.realname REGEXP 'Chalabi|Zeppa|Verma|Grijalva|Zhang|Hass|Lunova'  
 GROUP BY 
      --bugs.bugs_activity.bug_when,bugs.profiles.realname
      BusDate
 ORDER BY 
 BusDate DESC
 -- bugs.bugs_activity.bug_when DESC
 ;