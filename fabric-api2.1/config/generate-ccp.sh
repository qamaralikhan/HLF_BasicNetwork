#!/bin/bash

# function one_line_pem {
#     echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
# }

# function json_ccp {
#     local PP=$(one_line_pem $4)
#     local CP=$(one_line_pem $5)
#     local PP1=$(one_line_pem $6)
#     sed -e "s/\${ORG}/$1/" \
#         -e "s/\${P0PORT}/$2/" \
#         -e "s/\${CAPORT}/$3/" \
#         -e "s#\${PEERPEM}#$PP#" \
#         -e "s#\${CAPEM}#$CP#" \               
#         ./ccp-template.json
# }

function one_line_pem {
echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
local PP=$(one_line_pem $4)
local CP=$(one_line_pem $5)
sed -e "s/\${ORG}/$1/" \
-e "s/\${P0PORT}/$2/" \
-e "s/\${CAPORT}/$3/" \
-e "s#\${PEERPEM}#$PP#" \
-e "s#\${CAPEM}#$CP#" \
./ccp-template.json
} 

ORG=nationwide
P0PORT=7051
CAPORT=7054
PEERPEM=../../DTL-Network/buildartifacts/crypto-config/peerOrganizations/calibber.example.com/peers/peer0.calibber.example.com/msp/tlscacerts/tlsca.calibber.example.com-cert.pem
CAPEM=../../DTL-Network/buildartifacts/crypto-config/peerOrganizations/calibber.example.com/msp/tlscacerts/tlsca.calibber.example.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-nationwide.json


ORG=calibber
P0PORT=9051
CAPORT=8054
PEERPEM=../../DTL-Network/buildartifacts/crypto-config/peerOrganizations/nationwide.example.com/peers/peer0.nationwide.example.com/msp/tlscacerts/tlsca.nationwide.example.com-cert.pem
CAPEM=../../DTL-Network/buildartifacts/crypto-config/peerOrganizations/nationwide.example.com/msp/tlscacerts/tlsca.nationwide.example.com-cert.pem


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-calibber.json