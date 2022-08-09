## Solution Overview
1. Looking at the contract, if we're able to cause the transfer(msg.value) step to fail consistently, we'd then be able to be king forever
2. So that's what the KingKiller contract is supposed to achieve, since we don't have any payable or fallback functions in there
3. Deploy KingKiller and call the iAmKing function with the contract address and msg value of at least 0.001 ether