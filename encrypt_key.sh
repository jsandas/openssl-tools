#!/bin/bash

RECIPIENT=$1

for CERT in ./*.key;
do
    CERT_NAME=$(echo $CERT | awk -F "/" '{print $2}')
    echo ""
    echo $CERT_NAME
    cat $CERT | gpg --armor --batch --trust-model always --encrypt -r $RECIPIENT
done
