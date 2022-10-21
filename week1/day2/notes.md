# day 2

* pow and pos are not actually consensus protocols
* actually they are Sybil resistance mechanism combined with a block selection
rule that makes the consensus mechanism

## checkpoint block

* improves finality
* finalizes the blockchain history
* validators can vote to change blocks in the chain up until the last ckpt

## txns

* user creates txn and sends to node
* node validates txn => puts in it's meme pool
* using the gossip protocol the node propogates it around the network
* _block producer_ - picks up txns and makes a block from them and sends across
network

## smart contracts (SC)

* SC gets created on the network as a txn
* the SC is picked up eventually and put in a block and sent around network
* now all nodes have a copy of the SC

## ethereum virtual machine (EVM)

* all nodes run some client software
* client software all ave some features
    - network functions
    - EVM
    - can also have a local DB
* SCs run in client's EVM
* execution client is the client that runs the smart contract
* validators all run the SC and agree on the output

## some solidity

* no support for floats
* uint256. unsigned integer of 256 bits. "unsigned" just means it doens't have
a positive or negative sign

### functions

* public - most open visibility. can be called externally and internally
* private
* internal
* external

* view - read only function

```solidity

contract Storage {
    // public creates an automatic getter function that makes the number readable
    unint256 public number;
}

```
