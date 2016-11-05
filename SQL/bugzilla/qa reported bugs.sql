SELECT
    bugs.bugs.creation_ts  AS Reported,
    bugs.profiles.realname AS Reporter,
    bugs.bugs.bug_id,
    bugs.bugs.short_desc AS 'Summary',
    bugs.bugs.bug_status,
    bugs.bugs.bug_severity
FROM
    bugs.bugs
INNER JOIN
    bugs.profiles
ON
    (
        bugs.bugs.reporter = bugs.profiles.userid)
WHERE
    bugs.profiles.userid IN (31,45,49,50)
ORDER BY
    bugs.bugs.bug_id DESC ;