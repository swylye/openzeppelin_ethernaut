## You'd need to deploy a contract to solve this challenge

1. Deploy the Buyer contract
2. Call the buy function in the deployed buyer contract

### How did we reduce the price to 0 (bypassing the check in the Shop contract)?
The price function in our buyer contract returns a different value depending on whether the item is sold.