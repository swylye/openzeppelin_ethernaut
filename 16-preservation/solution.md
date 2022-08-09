## Solution involves both calling some functions on ethernaut page and deploying another contract
1. First deploy the NewLibrary contract 
2. Because of how delegatecall works, by calling the setFirstTime function, we'd be altering the timeZone1Library address
3. So we'd want to use the getUint function in the NewLibrary contract, to get the uint for the NewLibrary contract
4. We'd then call setFirstTime with that uint as an input. This would alter the timeZone1Library address to our NewLibrary contract address.
5. And since the variable we want to alter is owner which is the 3rd one on the list, the setTime function in our NewLibrary contract does just that.
6. We will again make use of the getUint function in the NewLibrary contract, to get the uint for our player address
7. Lastly, using the uint of our player address, we would call setFirstTime with that as an input