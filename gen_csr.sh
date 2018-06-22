#!/bin/bash

NAME=$1
TEST=$2

UNDERSCORED_NAME=$(echo $NAME | tr "." _)

source ./config/general

sed -i 's/CN=.*/'"CN=$NAME"'/g' $CONF_DIR/openssl.cnf

if [[ $NAME != "" ]]; then
    openssl genrsa -out ./$UNDERSCORED_NAME.key 2048 
    #openssl req -out ./$NAME.csr -key ./$NAME.key -new -sha256
    openssl req -out ./$UNDERSCORED_NAME.csr -config $CONF_DIR/openssl.cnf -key ./$UNDERSCORED_NAME.key -new -sha256
    openssl req -in ./$UNDERSCORED_NAME.csr -noout -text
    echo ""
    echo "Private key and CSR generate for: $NAME"
else
    echo ""
    echo "Please provide a name"
    echo "Example: gen_csr.sh test.digicert.com"
fi




#gen_san_csr() {
#cat > ./$NAME.conf << 'EOF'
#[ req ]
#default_bits = 2048
#prompt = no
#encrypt_key = no
#default_md = sha256
#distinguished_name = dn
#req_extensions = req_ext
# 
#[ dn ]
#CN = 
#emailAddress = ssl@example.com
#O = Example Company
#OU = Example Unit
#L = City
#ST = State
#C = US
# 
#[ req_ext ]
#EOF
#
#    subjectAltName = DNS: www.example.com, DNS: mai.example.com, DNS: files.example.com
