SELECT
    frontend.auth_user.first_name,
    frontend.auth_user.last_name,
    frontend.auth_user.username,
    frontend.ui_devicetype.model,
    frontend.ui_devicetype.os,
    frontend.ui_devicetype.type,
    frontend.ui_device.wipe,
    frontend.ui_device.full_wipe_status,
    frontend.ui_device.type,
    frontend.auth_user.id,
    frontend.ui_device.id,
    frontend.ui_device.device_id,
    frontend.ui_device.model_id,
    frontend.ui_device.imei,
    frontend.ui_devicetype.useragent,
    frontend.ui_devicetype.name,
    frontend.ui_devicetype.bg_name
FROM
    frontend.auth_user
INNER JOIN
    frontend.ui_device
ON
    (
        frontend.auth_user.id = frontend.ui_device.user_id),
    frontend.ui_devicetype ;