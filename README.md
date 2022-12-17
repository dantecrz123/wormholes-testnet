
<p align="center">
  <img width="270" height="auto" src="https://user-images.githubusercontent.com/108969749/201534786-9fd914e1-fe09-456f-b56a-4082da2ae687.jpeg">
</p>


### Spesifikasi Hardware :
NODE  | CPU     | RAM      | SSD     |
| ------------- | ------------- | ------------- | -------- |
| Testnet | 4          | 8         | 120  |


### Install Docker 
```
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update && apt upgrade -y
apt-cache policy docker-ce
sudo apt install docker-ce -y
```

### Install Program
```
wget -O wormholes.sh https://raw.githubusercontent.com/Whalealert/wormholes-testnet/main/wormholes.sh && chmod +x wormholes.sh && ./wormholes.sh
```

> Enter your private key：

### Monitoring
```
wget -O monitor.sh https://raw.githubusercontent.com/Whalealert/wormholes-testnet/main/monitor.sh && chmod +x monitor.sh && ./monitor.sh
```

### Next ? Become A Validator
` membutuhkan 70k ERB untuk menjadi validator `

[Validator](https://wormholes.com/docs/Install/stake/index.html)

### Node Info
 * check versi node
```
docker exec -it wormholes ./wormholes version|grep "Version"|grep -v go
```
 * check koneksi node
```
curl -X POST -H 'Content-Type:application/json' --data '{"jsonrpc":"2.0","method":"net_peerCount","id":1}' http://127.0.0.1:8545
```
 * check log wormholes
```
WALLET= masukan address
```
```
echo export WALLET=${WALLET} >> $HOME/.bash_profile
source ~/.bash_profile
```
```
tail -f /wm/.wormholes/wormholes.log | grep -i '$WALLET'
```
  * check private key
```
cat /wm/.wormholes/wormholes/nodekey
```
### Hapus Node

```
docker stop wormholes && docker rm wormholes && docker rmi wormholestech/wormholes:v1
```
