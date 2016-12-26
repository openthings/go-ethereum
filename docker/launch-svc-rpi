#!/bin/bash -x

export HOSTROOT=/media/pirate/ethereum
export DOCKERIMAGE=openthings/rpi-ethereum

echo
echo "=================================================="
echo "Ethereum devnet starting... "
echo "Ethereum running at $echo HOSTROOT"
echo "=================================================="

# Generate and store a wallet password
if [ ! -f $HOSTROOT/.accountpassword ]; then
    echo `date +%s | sha256sum | base64 | head -c 32` > $HOSTROOT/.accountpassword
fi

if [ ! -f $HOSTROOT/.primaryaccount ]; then
  docker run --rm -v $HOSTROOT:/root \
    $DOCKERIMAGE --dev \
    --password /root/.accountpassword \
    account new > /root/.primaryaccount
fi

docker run -d --name ethedev --restart=always -v $HOSTROOT:/root \
  -p 8545:8545 -p 8546:8546 -p 30303:30303 \
  $DOCKERIMAGE --dev \
  --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" --rpcapi "db,eth,net,web3,personal" \
  --ws --wsaddr "0.0.0.0" \
  --password /root/.accountpassword \
  --extradata "openthings"
  
#docker run -d --name ethedev --restart=always -v $HOSTROOT:/root \
#  $DOCKERIMAGE --dev \
#  --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" --rpcapi "db,eth,net,web3,personal" \
#  --password /root/.accountpassword \
#  --mine --minerthreads 1 \
#  --extradata "openthings"
