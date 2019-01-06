# MySQL

## Daemon

Provides a MySQL server defaulted to `ut8mb4`. There is no root password.

Your databases and settings are persisted through the `data` folder.

If you upgrade the MySQL server version (with a different image) then you will need to run `docker exec -it mysql mysql_upgrade`.
