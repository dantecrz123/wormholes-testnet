#!/bin/bash

function info(){
     cn=0
     while true
     do 
             echo "IP address :" "$(curl -s ifconfig.me):"$1""   
             rs1=`curl -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_blockNumber","id":64}' https://api.wormholestest.com 2>/dev/null`
             blockNumbers=$(parse_json $rs1 "result")
             echo "Block height of the whole network: $((16#${blockNumbers:2}))"
          
             rs2=`curl -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"net_peerCount","id":64}' 127.0.0.1:$1 2>/dev/null`
             count=$(parse_json $rs2 "result")
             echo "Number of node connections: $((16#${count:2}))"
             
             rs3=`curl -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_blockNumber","id":64}' 127.0.0.1:$1 2>/dev/null`
             blckNumber=$(parse_json $rs3 "result")
             echo "Block height of the current peer: $((16#${blckNumber:2}))"
             
             sleep 15
             clear
             let cn+=15
     done
}

function parse_json(){
      if [[ $# -gt 1 ]] && [[ $1 =~ $2 ]];then
         echo "${1//\"/}"|sed "s/.*$2:\([^,}]*\).*/\1/"
      else
         echo "0x0"
     fi
}

function main(){
     if [[ $# -eq 0 ]];then
             info 8545
     else
             info $1
     fi
}

main "$@"
