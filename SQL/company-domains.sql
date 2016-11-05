SELECT
    frontend.ui_company.id as "Company ID",
    frontend.ui_company.name as "Company name",
    frontend.ui_domain.name as "Domain",
    frontend.ui_domain.user_source,
    frontend.ui_domain.auth_source
FROM
    frontend.ui_company
INNER JOIN
    frontend.ui_domain
ON
    (
        frontend.ui_company.id = frontend.ui_domain.company_id) ;