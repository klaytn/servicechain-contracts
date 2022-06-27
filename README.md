# This is a ServiceChain bridge
It is for making service chain bridge and for generating go files for klaytn from bridge contract.
### Versions used to build 
- npm 6.14.16
- node v12.22.10
- truffle 5.5.19
- solc 0.8.15 
- Web3.js v1.5.3
- klaytn abigen v1.8.4
- klaytn 1.8.4
- go 1.18.2

## The `Solidity` Tool

## Solc is available as a Homebrew package for macOS.
```shell
brew update
brew tap ethereum/ethereum
brew install solidity
```

## Install @klaytn/contracts node modules
- yarn add @klaytn/contracts@1.0.2

## Install truffle node modules
- yarn add truffle
- yarn add @chainsafe/truffle-plugin-abigen
```shell
yarn install
```

## The `Truffle` Tool
### Compile the contract
```
$ yarn truffle compile
```

### Generate the ABI and BIN files (stored in abigenBindings/)
```
$ yarn truffle run abigen
```

## Create Go code from solidity bytecode
### Create the Go binding with bytecode
```
$ go generate generate.go 
```

### Tagging
```shell
$ git tag v0.9.7
$ git push origin v0.9.7 
```

### Packaging for klaytn projects
add servicechain-contracts modules in klaytn go.mod
```
require ( 
  github.com/klaytn/servicechain-contracts v0.9.7
)
```

import  servicechain-contracts
```
import "github.com/klaytn/servicechain-contracts/bridge"
```