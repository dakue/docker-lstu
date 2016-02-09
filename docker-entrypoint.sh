#!/bin/bash
set -e

if [ "$1" = 'lstu' ]
then
    cd $LSTU_HOME
    cp lstu.conf.template lstu.conf
    sed -i 's|127.0.0.1|0.0.0.0|g;s|www-data|root|g;s|#contact|contact|g;s|admin[at]example.com|daniel.kuehne[at]unbelievable-machine.com|g' lstu.conf
    exec carton exec hypnotoad -f script/lstu
fi

exec "$@"
