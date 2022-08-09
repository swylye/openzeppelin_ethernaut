## Solution Overview
1. Since the contract does not have any payable or fallback functions, the other to force send the contract ether is to use the selfdestruct function
2. Deploy Kamikaze (and set Force contract address as the beneficiary), donate some ether and call harakiri to self destruct (and send the ether to the beneficiary address)