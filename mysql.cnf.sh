[mysqld]

# General settings
port = {{ db_port }}
socket = /var/run/mysqld/mysqld.sock

# Security settings
skip-name-resolve
skip-host-cache

# Log settings
log-error = /var/log/mysql/error.log
slow-query-log = 1
slow-query-log-file = /var/log/mysql/slow.log

# Backup settings
innodb_file_per_table = 1
innodb_flush_log_at_trx_commit = 2
