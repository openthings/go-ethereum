#!/bin/bash -x

export HOSTROOT=/Users/wangbook/Docker/ethereum
export DOCKERIMAGE=openthings/ethereum

echo
echo "=================================================="
echo "Ethereum devnet starting... "
echo "Ethereum running at $echo $HOSTROOT"
echo "=================================================="

# Generate and store a wallet password
if [ ! -f $HOSTROOT/.accountpassword ]; then
  echo `date +%s | md5 | base64 | head -c 32` > $HOSTROOT/.accountpassword
fi
echo “Password: ”
cat $HOSTROOT/.accountpassword

if [ ! -f $HOSTROOT/.primaryaccount ]; then
  docker run --rm -v $HOSTROOT:/root $DOCKERIMAGE \
    --password /root/.accountpassword account new > $HOSTROOT/.primaryaccount
fi
echo “Account: ”
cat $HOSTROOT/.primaryaccount

docker run -d --name ethenode --restart=always -v $HOSTROOT:/root \
  $DOCKERIMAGE \
  --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" --rpcapi "db,eth,net,web3,personal" \
  --password /root/.accountpassword \
  --extradata "openthings"

#  --mine --minerthreads 1 \
