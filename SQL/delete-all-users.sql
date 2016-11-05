use frontend;
DELETE FROM auth_user_groups WHERE id != 0;
DELETE FROM ui_membership WHERE id != 0;
DELETE FROM registration_registrationprofile WHERE id != 0;
DELETE FROM ui_user WHERE user_ptr_id != 0;
DELETE FROM auth_user WHERE id != 0;
