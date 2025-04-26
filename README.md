# CSE331 / BIL503

## Computer Organization

# Final Project: 32-Bits Single Cycle MIPS Processor


## Project Overview

This project involves designing a 32-bit MIPS processor using Verilog, implementing a variety of instructions including a mandatory `MOVE` instruction.

---

## Memory Files

- **instructionMemory.mem**: Holds the instructions.
- **registerMemory.mem**: Holds the contents of the registers.
- **dataMemory.mem**: Holds the contents of the data memory.

### File Formats

- Each line in `instructionMemory.mem` and `registerMemory.mem` represents **32 bits**.
- Each line in `dataMemory.mem` represents **8 bits**.

### Current Capacity

- Maximum of **256 instructions**.
- Maximum of **64 bytes** of data in `dataMemory`.

> To increase memory capacity, modifications are required in the `instruction_block` and `memory_block` modules.

---

## Known Limitations

- The `jal` instruction is **not fully operational**. Although it correctly writes to register `$31`, a subsequent write operation to the register file causes conflicting writes, even though inputs have not changed.
- The `jr` instruction **works correctly**. The system can successfully jump to the address stored in a register.

All other instructions have been verified and are **working correctly**.

---

## Updated Datapath

The following is a rough updated version of the datapath to accommodate the implemented instructions:

![image](https://github.com/user-attachments/assets/e159c668-9ed0-4ebc-9fcd-a07fbe9ec005)



## Additional Resources

For a more detailed explanation and interactive Q&A support about the 32-bit MIPS Processor, please visit the [DeepWiki page on the 32-bit MIPS Processor](https://deepwiki.com/OmerSaricam/32-bit-Mips-Processor#overview).



