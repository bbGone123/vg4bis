SELECT
    frontend.ui_company.name,
    frontend.ui_group.group_name,
    frontend.auth_user.id as 'User ID',
    frontend.auth_user.first_name,
    frontend.auth_user.last_name,
    frontend.auth_user.username,
    frontend.auth_user.email,
    frontend.auth_user.is_active
FROM
    frontend.auth_user
INNER JOIN
    frontend.auth_user_groups
ON
    (
        frontend.auth_user.id = frontend.auth_user_groups.user_id)
INNER JOIN
    frontend.ui_group
ON
    (
        frontend.auth_user_groups.group_id = frontend.ui_group.group_ptr_id)
INNER JOIN
    frontend.ui_company
ON
    (
        frontend.ui_group.company_id = frontend.ui_company.id) 
/*
 WHERE    frontend.auth_user.username LIKE 
--  '%bitglass-inc.com' 
--  '%@qa-acme.com'
    '%@emcooo.com'
*/    
-- AND frontend.ui_group.group_name = 'All Users'  