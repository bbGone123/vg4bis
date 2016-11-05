/*
    31,   -- Deepika
    45,   -- Sharlin
--    49,   -- Michael
--    50,   -- David
    59,   -- Xiaoqing
--    73,   -- Hassan
    74,   -- Natalia
    77,   -- Bogdan
    88,   -- Kirill
   101    -- Megha 
   104    -- Kevin
   114    -- Svetlana  
*/

set @users = '31,45,49,50,59,73,74,77,88,101,104,114';

-- RELEASED
SELECT 
    bugs.bugs_activity.bug_when as 'Time',
    bugs.bugs_activity.bug_id as 'Story ID',
    bugs.profiles.realname as Tester,
    bugs.bugs.priority as 'Priority',
    bugs.bugs.short_desc as 'Summary',
    bugs.bugs_activity.removed as 'From',
    bugs.bugs_activity.added as 'To',
    concat("*",bugs.bugs.short_desc,"*(#",bugs.bugs_activity.bug_id," - ", bugs.profiles.realname,")" ) AS 'Copy to Roadmap - RELEASED'
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON  ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN
    bugs.bugs
ON  ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id)         

WHERE bugs.bugs_activity.who in (31,45,49,50,59,73,74,77,88,101,104,114)
AND bugs.bugs_activity.added = "RELEASED"
ORDER BY  bugs.bugs_activity.bug_when DESC       
        ;
-- TESTED, BUT NOT RELEASED        
SELECT 
    bugs.bugs_activity.bug_when as 'Time',
    bugs.bugs_activity.bug_id as 'Story ID',
    bugs.profiles.realname as Tester,
    bugs.bugs.priority as 'Priority',
    bugs.bugs.short_desc as 'Summary',
    bugs.bugs_activity.removed as 'From',
    bugs.bugs_activity.added as 'To',
    concat("*",bugs.bugs.short_desc,"*(#",bugs.bugs_activity.bug_id," - ", bugs.profiles.realname,")" ) AS 'Copy to Roadmap - TESTED'
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON  ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN
    bugs.bugs
ON  ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id)         

WHERE bugs.bugs_activity.who in (31,45,49,50,59,73,74,77,88,101,104,114)
AND bugs.bugs_activity.added = "TESTED"
AND bugs.bug_status = "TESTED"
ORDER BY  bugs.bugs_activity.bug_when DESC       
        ;
-- QA IN PROGRESS
SELECT 
    bugs.bugs_activity.bug_when as 'Time',
    bugs.bugs_activity.bug_id as 'Story ID',
    bugs.profiles.realname as Tester,
    bugs.bugs.priority as 'Priority',
    bugs.bugs.short_desc as 'Summary',
    bugs.bugs_activity.removed as 'From',
    bugs.bugs_activity.added as 'To',
    concat("*",bugs.bugs.short_desc,"*(#",bugs.bugs_activity.bug_id," - ", bugs.profiles.realname,")" ) AS 'Copy to Roadmap - Stories in QA'
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON  ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN
    bugs.bugs
ON  ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id)         

WHERE bugs.bugs_activity.who in (31,45,49,50,59,73,74,77,88,101,104,114)
AND bugs.bugs_activity.added = "QA_IN_PROGRESS"
AND bugs.bug_status = "QA_IN_PROGRESS"
ORDER BY  bugs.bugs_activity.bug_when DESC       
        ;                