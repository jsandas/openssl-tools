#!/bin/bash

source ./config/general

genca () {
    mkdir -p ./$CA_FOLDER
    rm $CA_FOLDER/index*
    touch $CA_FOLDER/index.txt
    touch $CA_FOLDER/index.txt.attr
    echo 00 > $CA_FOLDER/serial
    openssl req -nodes -x509 -config $CONF_DIR/openssl-ca.cnf -newkey rsa:2048 -out $CA_FOLDER/cacert.pem -outform PEM -days 7300
}

genclientcert () {
    openssl req -nodes -config $CONF_DIR/openssl-clientcert.cnf -newkey rsa:2048 -keyout client_cert.key -keyform PEM -out temp.csr -outform PEM
    openssl ca -config $CONF_DIR/openssl-ca.cnf -in temp.csr -out client_cert.pem -days 7300
    rm temp.csr
}

$1
