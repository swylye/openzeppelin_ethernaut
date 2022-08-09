## Solving this challenge requires a combination of deploying a contract and calling some functions on the ethernaut page
### Overview:
1. DET is the underlying token which should not be transferred out
2. However, when we call the sweepToken function in CryptoVault with the LegacyToken address, it'll then call the transfer function in the LegacyToken contract. And since the DelegateERC20 is set to DET's token address, it would then call the delegateTransfer function for DET contract. I.e. users would be able to transfer DET tokens out when they're not supposed to.
3. So we want to write a DetectionBot contract that would raise an alert when DET is being transferred out

### Code
```
// Deploy DetectionBot contract
const fortaAdd = await contract.forta()
const detectionBotAdd = <deployed DetectionBot address>

// call setDetectionBot of Forta with your detection bot address as the parameter
const _function = {
  "inputs": [
    { 
      "name": "detectionBotAdd",
      "type": "address"
    }
  ],
  "name": "setDetectionBot", 
  "type": "function"
};
const _parameters = [
  detectionBotAdd
];
const _calldata = web3.eth.abi.encodeFunctionCall(_function, _parameters);
await web3.eth.sendTransaction({
  from: player,
  to: fortaAdd,
  data: _calldata
})
```