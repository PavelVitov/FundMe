-include .env 

build:; forge build

.PHONY: all test clean deploy fund help install snapshot format anvil zktest


deploy-sepolia: 
forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEP_RPC) --private-key $(SEP_PRIVATE_KEY) --broadcast--verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv