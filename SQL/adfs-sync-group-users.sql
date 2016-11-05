SELECT
    frontend.ui_syncgroup.domain    AS 'GROUP Domain',
    frontend.ui_syncgroup.name      AS 'GROUP',
    frontend.ui_syncgroup.sync_with_main      AS 'Sync',
    frontend.ui_syncuser.first_name AS 'F-Name',
    frontend.ui_syncuser.last_name  AS 'L-Name',
    frontend.ui_syncuser.email      AS 'E-mail',
    frontend.ui_syncuser.upn        AS 'UPN'
FROM
    frontend.ui_syncuser
INNER JOIN
    frontend.ui_syncmembership
ON
    (
        frontend.ui_syncuser.id = frontend.ui_syncmembership.user_id)
INNER JOIN
    frontend.ui_syncgroup
ON
    (
        frontend.ui_syncmembership.group_id = frontend.ui_syncgroup.id)

WHERE UPN LIKE 
-- '%@test-acme.com'    
 '%@qa-acme.com'
-- '%@qacaws.com'
-- and frontend.ui_syncgroup.name like 'Executive'

ORDER BY
    'GROUP Domain' ASC,
    'GROUP' ASC 
    ;