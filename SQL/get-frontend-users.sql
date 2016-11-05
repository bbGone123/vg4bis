SELECT
    frontend.auth_user.id,
    frontend.auth_user.first_name,
    frontend.auth_user.last_name,
    frontend.auth_user.email,
    frontend.auth_user.username,
    frontend.ui_user.secondary_email,
    frontend.auth_user.date_joined,
    frontend.auth_user.last_login,
    frontend.auth_user.is_staff as "Superadmin",
    frontend.ui_user.deleted,
    frontend.ui_user.is_admin as "Company Admin",
    frontend.ui_user.active,
    frontend.ui_user.migration_status as "Migrated"
--    frontend.ui_user.is_federated,
--    frontend.ui_user.do_not_federate
    
FROM
    frontend.auth_user
INNER JOIN
    frontend.ui_user
ON
    (
        frontend.auth_user.id = frontend.ui_user.user_ptr_id) 
        
-- where email LIKE 'qa_@btglss.com'      

        ;