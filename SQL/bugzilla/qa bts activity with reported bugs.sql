SELECT
    bugs.bugs_activity.bug_id,
    bugs.bugs.reporter          AS Reporter,
    bugs.bugs.creation_ts       AS Reported,
    bugs.bugs_activity.bug_when AS Updated,
    bugs.profiles.realname      AS Updater,
    bugs.fielddefs.name         AS Field,
    bugs.bugs_activity.removed  AS Removed,
    bugs.bugs_activity.added    AS Added
FROM
    bugs.bugs_activity
INNER JOIN
    bugs.fielddefs
ON
    (
        bugs.bugs_activity.fieldid = bugs.fielddefs.id)
INNER JOIN
    bugs.profiles
ON
    (
        bugs.bugs_activity.who = bugs.profiles.userid)
INNER JOIN
    bugs.bugs
ON
    (
        bugs.profiles.userid = bugs.bugs.reporter) ;