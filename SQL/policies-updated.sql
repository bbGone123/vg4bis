SELECT
    frontend.ui_company.name as 'Company',
    frontend.ui_appmeta.name as 'Application',
    frontend.ui_group.group_name as 'Group',
    frontend.ui_apppolicy.ordering,
    frontend.ui_apppolicy.compiled as 'Policy'
        
    
FROM
    frontend.ui_apppolicy
INNER JOIN
    frontend.ui_appmeta
ON
    (
        frontend.ui_apppolicy.application_id = frontend.ui_appmeta.id)
INNER JOIN
    frontend.ui_apppolicy_groups
ON
    (
        frontend.ui_apppolicy.id = frontend.ui_apppolicy_groups.apppolicy_id)
INNER JOIN
    frontend.ui_group
ON
    (
        frontend.ui_apppolicy_groups.group_id = frontend.ui_group.group_ptr_id)
INNER JOIN
    frontend.ui_company
ON
    (
        frontend.ui_group.company_id = frontend.ui_company.id)
ORDER BY
    frontend.ui_company.name ASC,
    frontend.ui_appmeta.name ASC,frontend.ui_apppolicy.ordering,frontend.ui_group.group_name ;