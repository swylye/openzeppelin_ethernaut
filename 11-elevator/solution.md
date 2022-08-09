## Solution Overview
1. Looking at the contract, building.isLastFloor is called twice in the goTo function
2. In order to bypass the check and make top == true, we'd want the first building.isLastFloor call to result in false and the second call to result in true
3. That's what the Building contract achieves. 
4. Deploy the Building contract and call the goTo function with a random integer (i.e. 10)