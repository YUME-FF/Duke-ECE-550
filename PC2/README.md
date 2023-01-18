# ALU project for 550

Zhe Fan, zf70

## Checkpoint 1

1 bit full adder -> 2 bit RCA -> 4 bit CSA -> 8bit CSA -> 16 bit CSA -> 32 bit CSA

Calculate addition and substraction and then use MUX to choose result based on ctrl_ALUopcode[0]
For overflow: from 2 bit RCA to 32 bit CSA, they all will record the carry out, and finally generate a 16 bit result, I use XOR_gate to calculate the 16th bit and the final cout, then the result is overflow.

I use recursion to build from 2 bit RCA to 32 bit CSA, most of my module has been set parameter to change  input with different bits.

## Checkpoint 2

- add And and Or.

- add SLL (Logical Left Shift) and SRA (Arithmetic Right Shift).

According to the value of each bit of Opcode, the corresponding shift operation is performed on the input. Since the bit width of Opcode is 5 bits, I used 5 generate for.

- add isNotEqual and isLessThan

For isNotEqual , I XOR the subtraction result with all 0 bits, and then OR each two bits of the XOR result until I get a result with a bit width of 1 bit.

For isLessThan, I use subtract_overflow to choose between the highest bit of the two input.

