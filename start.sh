#!/bin/bash
/bin/sed -i 's/$ODBC_SERVER/'$ODBC_SERVER'/g' /root/.odbc.ini
/bin/sed -i 's/$ODBC_NAME/'$ODBC_NAME'/g' /root/.odbc.ini
/root/PAServer-19.0/paserver -password=$PASERVER_PASSWORD