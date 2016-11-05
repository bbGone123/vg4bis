use frontend;
SET @user_id:=88798; 
DELETE FROM auth_user_groups WHERE user_id = @user_id;
DELETE FROM ui_membership WHERE user_id = @user_id;
DELETE FROM ui_customview WHERE user_id = @user_id;
DELETE FROM ui_device WHERE user_id = @user_id;
DELETE FROM registration_registrationprofile WHERE user_id = @user_id;
DELETE FROM auth_user WHERE id = @user_id;
DELETE FROM ui_user WHERE user_ptr_id = @user_id;

