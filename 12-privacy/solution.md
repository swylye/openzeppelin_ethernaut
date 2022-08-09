## Solution Overview
1. In order to unlock the contract, we require the key which in this case is equal to bytes16(data[2]) (i.e. third element of the data array truncated to bytes16 from bytes32)
2. Looking at the storage slots: 
```
  bool public locked = true; //slot 0
  uint256 public ID = block.timestamp; // slot 1
  uint8 private flattening = 10; // sharing slot 2
  uint8 private denomination = 255; // sharing slot 2
  uint16 private awkwardness = uint16(now); // sharing slot 2
  bytes32[3] private data; // element 0 in slot 3, element 1 in slot 4 and element 2 in slot5
```
3. Now that we've determined the storage slot positions, we'll call the following code to figure out the key and unlock the contract

### Code
```
const data2 = await web3.eth.getStorageAt(contract.address, 5)
const key = data2.slice(0,34) //truncating it to bytes16
await contract.unlock(key)
```
