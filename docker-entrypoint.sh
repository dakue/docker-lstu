#!/bin/bash
set -e

if [ "$1" = 'lstu' ]
then
    cd $LSTU_HOME
    echo "INFO: executing envplate to replace environment variables in configuration file ..."
    /usr/local/bin/ep -v "${LSTU_HOME}/lstu.conf"
    echo "INFO: starting Lstu ..."
    exec carton exec hypnotoad -f script/lstu
fi

exec "$@"
