#!/bin/bash

# Adapted from https://github.com/wnameless/docker-oracle-xe-11g
# Thank you Wei-Ming Wu <wnameless@gmail.com>!

LISTENERS_ORA=/u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora

cp "${LISTENERS_ORA}.tmpl" "$LISTENERS_ORA" &&
sed -i "s/%hostname%/$HOSTNAME/g" "${LISTENERS_ORA}" &&
sed -i "s/%port%/1521/g" "${LISTENERS_ORA}" &&

service oracle-xe start

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe

$ORACLE_HOME/bin/sqlplus system/oracle@localhost < /opt/app/init.sql
