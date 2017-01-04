docker run -d --name ethenode --restart=always \
  -v /media/linaro/zdata/ethereum:/root \
  -p 8545:8545 -p 30303:30303 \
  openthings/ethereum:ARM64 --fast --cache=512
