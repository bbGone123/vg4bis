SELECT
    bugs.bugs.bug_id,
    bugs.bugs.priority,
    bugs.bugs.deadline,
    bugs.bugs.bug_status,
    bugs.bugs.resolution,
    r.realname AS Reporter,
    q.realname AS Owner,
    bugs.bugs.short_desc   AS Summary
FROM
    bugs.bugs
INNER JOIN
    bugs.profiles as q
ON
    (
        bugs.bugs.qa_contact = q.userid)
INNER JOIN
    bugs.profiles as r
ON
    (
        bugs.bugs.reporter = r.userid) ;