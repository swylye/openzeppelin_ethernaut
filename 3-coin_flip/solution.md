## Solution Overview
1. Looking at the CoinFlip code, the results can be calculated beforehand
2. So CoinFlipAttacker effectively calculates the results and calls flip with the calculated results
3. Deploy CoinFlipAttacker and call the win function. Do note that the win function calls would need to be spaced out, as we can only call flip, once per block.
4. Once we've called win successful 10 times, we'd have beaten the level.