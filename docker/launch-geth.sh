docker run -d --name ethenode \
  -v $PWD/ethereum:/root \
  -p 8545:8545 -p 30303:30303 \
  openthings/rpi-ethereum --fast --cache=512
