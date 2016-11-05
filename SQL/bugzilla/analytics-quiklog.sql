-- qac-db-analytics
select count(ts) 
-- * 
from logger_quiklog
-- order by ts DESC

;

select * 
from logger_quiklog
 order by ts DESC
 limit 1000