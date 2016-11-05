use frontend;

CREATE TEMPORARY TABLE tmp_users_to_delete (uid int(11), username varchar(75), sync_uid int(11)); 
INSERT INTO tmp_users_to_delete 
        SELECT
            frontend.auth_user.id,
            frontend.auth_user.username,
            frontend.ui_syncuser.id
        FROM
            frontend.auth_user
        INNER JOIN
            frontend.ui_syncuser
        ON
            (
                frontend.auth_user.username = frontend.ui_syncuser.upn) 
        WHERE frontend.auth_user.username  
 --       LIKE 'la_fer%@qa-acme.com'; 
        -- 'Bear%bitglass%';
--       REGEXP 'la_fer.*@qa-acme.com|bear.*@qa-acme.com|gogi.*@qa-acme.com|mura.*@qa-acme.com'
--        REGEXP '(sjim|pfry|cfry)@qa-acme.com'
         Like 'deleteme%'
--        LIKE '%@bgstg.net'
;

SELECT * from tmp_users_to_delete;

DELETE FROM auth_user_groups WHERE user_id IN (SELECT uid from tmp_users_to_delete);
DELETE FROM ui_membership WHERE user_id IN (SELECT uid from tmp_users_to_delete);
DELETE FROM ui_customview WHERE user_id IN (SELECT uid from tmp_users_to_delete);
DELETE FROM ui_device WHERE user_id IN (SELECT uid from tmp_users_to_delete);
DELETE FROM registration_registrationprofile WHERE user_id IN (SELECT uid from tmp_users_to_delete);
DELETE FROM ui_user WHERE user_ptr_id IN (SELECT uid from tmp_users_to_delete);
DELETE FROM auth_user WHERE id IN (SELECT uid from tmp_users_to_delete);

DELETE FROM ui_syncmembership WHERE user_id IN (SELECT sync_uid from tmp_users_to_delete);
DELETE FROM ui_syncuser WHERE id IN (SELECT sync_uid from tmp_users_to_delete);


DROP TABLE tmp_users_to_delete;