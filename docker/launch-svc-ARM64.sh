docker run -d --name ethenode --restart=always \
  -v /media/linaro/zdata/ethereum:/root \
  -p 8545:8545 -p 8546:8546 -p 30303:30303 \
  openthings/ethereum:ARM64 --fast --cache=512 \
  --rpc --rpcaddr "0.0.0.0" \
  --ws --wsaddr "0.0.0.0" 
