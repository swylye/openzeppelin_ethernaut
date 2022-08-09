## Solution Overview
1. In order to change the owner, we'd want to call the changeOwner function
2. However the owner would only be changed to the address we supplied if the tx.origin is not the msg.sender
3. If we were to call the function directly, our address would be both the tx.origin and msg.sender
4. So in order to make it different, we'd need to call changeOwner via a smart contract
5. Deploy TelephoneAttacker and call the attack function