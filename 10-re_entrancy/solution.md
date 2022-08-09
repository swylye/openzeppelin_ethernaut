## Solution Overview
1. Looking at the code, we can drain the contract balance using re-entrancy (i.e. keep calling withdraw before the balance gets updated)
2. That's what the Thief contract does, when we call withdraw using the thief contract, it'll then trigger the receive fallback function when the contract receives the withdrawal, which in turn calls the withdraw function again. Thus draining the contract funds before it even reaches the step where the balance gets updated
3. So we'd need to deploy the thief contract, call the donate function and then call the withdraw function