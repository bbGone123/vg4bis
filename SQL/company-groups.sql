SELECT
    frontend.ui_company.id as 'Company ID',
    frontend.ui_company.name as 'Company',
    frontend.ui_group.group_name as 'Group',
    frontend.ui_group.description,
    frontend.ui_group.group_type,
--    frontend.ui_group.sync_with_idp_id,
    frontend.ui_group.objectGUID
FROM
    frontend.ui_company
INNER JOIN
    frontend.ui_group
ON
    (
        frontend.ui_company.id = frontend.ui_group.company_id)
ORDER BY
    frontend.ui_company.name ASC,
    frontend.ui_group.group_name ASC ;