## Codes to store and return the number 42

High level steps:
1. store the number 42
2. return the number 42

OPCODE steps:
1. PUSH1 0x2a
2. PUSH1 0x00
3. MSTORE 
4. PUSH1 0x20
5. PUSH1 0x00
6. RETURN

Converted to bytecode:
- 0x602a60005260206000F3

## Initialization code

OPCODE steps:
1. PUSH1 0x0a (size)
2. PUSH1 0x0c (offset)
3. PUSH1 0x00 (destination offset)
4. CODECOPY
5. PUSH1 0x0a (size)
6. PUSH 0x00 (offset)
7. RETURN

Converted to bytecode:
- 0x600a600c600039600a6000f3

## Combined bytecode:
- 0x600a600c600039600a6000f3602a60005260206000F3

## Solution
Deploy Solver contract and include the magic number contract address. Then run the solve function.



Reference:
https://www.ethervm.io/