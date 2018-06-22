#!/bin/bash

LIST=('nessie2018' 'nessie2019' 'nessie2020' 'nessie2021' 'nessie2021' 'nessie2022')

for NAME in ${LIST[@]};
do
    ./gen_csr.sh ${NAME}.ct.digicert.com
done
