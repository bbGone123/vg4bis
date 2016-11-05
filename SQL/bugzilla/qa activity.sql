-- ========= Updated bugs ====================
SELECT 
    bugs.profiles.realname as "Who",
    bugs.bugs_activity.bug_when as 'Time',
    DATE_FORMAT(bugs.bugs_activity.bug_when, '%W, %M %D, %Y') AS 'Date',
    bugs.bugs_activity.bug_id,
    bugs.bugs.short_desc as 'Updated bug: Summary',
    bugs.bugs_activity.removed as "From",
    bugs.bugs_activity.added as "To"
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON  ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN
    bugs.bugs
ON  ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id)         

WHERE bugs.bugs_activity.who in (31,45,59,74,77,84,88,101,104,114)
-- AND bugs.bugs_activity.added != ""
-- AND bugs.bugs_activity.removed != ""
-- AND bugs.bugs_activity.added LIKE '%VERIFY%'     -- only resolved to verify bugs
-- AND bugs.bugs_activity.removed LIKE '%VERIFY%'     -- only verified bugs

ORDER BY  bugs.bugs_activity.bug_when DESC       
LIMIT 3000        ;

-- ========= Reported bugs ====================        
SELECT
    NewBugs.creation_ts  AS Reported,
    DATE_FORMAT(NewBugs.creation_ts, '%W, %M %D, %Y') AS 'Date',
    bugs.profiles.realname AS Reporter,
    NewBugs.bug_id,
    NewBugs.short_desc AS '---- New bug: Summary -----',
    NewBugs.bug_status,
    NewBugs.bug_severity
FROM
    bugs.bugs NewBugs
INNER JOIN
    bugs.profiles
ON
    (
        NewBugs.reporter = bugs.profiles.userid)
WHERE
    bugs.profiles.userid IN (
    31,    -- Deepika
    45,    -- Sharlin
--    49,   -- Michael
--    50,  -- David
    59,    -- Xiaoqing
--    73,  -- Hassan
    74,    -- Natalia
    77,    -- Bogdan
    84,    -- Kimtan
    88,     -- Kirill
   101,      -- Megha
   104,     -- Kevin
   114      -- Lana
 )
ORDER BY
    NewBugs.bug_id DESC 
LIMIT 3000    
    ;        




-- =================== worked overtime ================
-- updated bugs --
SELECT 
    bugs.profiles.realname as "Who",
    bugs.bugs_activity.bug_when as 'Time',
    DATE_FORMAT(bugs.bugs_activity.bug_when, '%W, %M %D, %Y') AS 'Date',
    INT(DATE_FORMAT(bugs.bugs_activity.bug_when, '%h')),
    bugs.bugs_activity.bug_id,
    bugs.bugs.short_desc as 'Updated bug: Summary',
    bugs.bugs_activity.removed as "From",
    bugs.bugs_activity.added as "To"
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.profiles
ON  ( bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN
    bugs.bugs
ON  ( bugs.bugs_activity.bug_id = bugs.bugs.bug_id)         

WHERE bugs.bugs_activity.who in (31,45,49,50,59,73,74,77,88,101,104,114)
AND bugs.bugs_activity.bug_when > '2016-01-01'
-- AND (DATE_FORMAT(bugs.bugs_activity.bug_when, '%W, %M %D, %Y') LIKE '%Satur%' OR DATE_FORMAT(bugs.bugs_activity.bug_when, '%W, %M %D, %Y') LIKE '%Sunday%') -- weekends
-- AND DATE_FORMAT(bugs.bugs_activity.bug_when, '%h') -- late hours 
ORDER BY  bugs.bugs_activity.bug_when DESC       
LIMIT 3000        ;

-- ========= Reported bugs ====================        
SELECT
    NewBugs.creation_ts  AS Reported,
    @dd:=DATE_FORMAT(NewBugs.creation_ts, '%W, %M %D, %Y') AS 'Date',
    bugs.profiles.realname AS Reporter,
    NewBugs.bug_id,
    NewBugs.short_desc AS '---- New bug: Summary -----',
    NewBugs.bug_status,
    NewBugs.bug_severity,
    @dd
FROM
    bugs.bugs NewBugs
INNER JOIN
    bugs.profiles
ON
    (
        NewBugs.reporter = bugs.profiles.userid)
WHERE
    bugs.profiles.userid IN (
    31,    -- Deepika
    45,    -- Sharlin
--    49,   -- Michael
--    50,  -- David
    59,    -- Xiaoqing
--    73,  -- Hassan
    74,    -- Natalia
    77,    -- Bogdan
    84,    -- Kimtan
    88,    -- Kirill
   101,    -- Megha
   104,    -- Kevin
   114     -- Svetlana
 )
AND (DATE_FORMAT(NewBugs.creation_ts, '%W, %M %D, %Y') LIKE '%Satur%' OR DATE_FORMAT(NewBugs.creation_ts, '%W, %M %D, %Y') LIKE '%Sunday%')   -- weekends
AND NewBugs.creation_ts > '2016-01-01'
ORDER BY   NewBugs.bug_id DESC 
LIMIT 3000    
    ;                