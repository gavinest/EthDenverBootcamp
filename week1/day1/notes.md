# day 1

## digital signatures

* authentic - Alice unencrypts with Bob's pub key so she knows it came from Bob
* unforgeable - only Bob has his priv key
* not reusable - priv key signature is function of the document
* unalterable - cannot alter the msg and still have it be un-encryptable

## hash function (digital fingerprint)

* any change to input produces and radically diff output
* one way function
* hash functions are used to build up merkle trees

# addresses in eth

* address derived from public key. pub key is hashed and a certain amt of bits
are used

andersonbrownworth.com/blockchain/hash

## p2p network

* people can join or leave at any time
* no central authority deciding who can join or kick people out

## block structure

* blocks have a header (timestamp, hash of parent block's header, tx merkle 
root and nonce). nonce is different for different block chains
* store all txns that occurred in block

## consensus in systems

* _byzantine fault tolerance_ - dependability of a fault-tolerant system to
come to agreement when errors happen even if there is imperfect information

* how does blockchain solve the double spend problem?
