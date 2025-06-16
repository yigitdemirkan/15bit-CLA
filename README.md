# 15 Bit CLA
Designing a 15 bit carry lookahead adder using 3-bit carry lookahead adder as a submodule.

# Table of Contents:

- **15bit_CLA.pdf:** Explanatory document of the project.
- **CLA_3bit.v:** This Verilog file defines a 3-bit Carry Lookahead Adder module, which computes fast binary addition by generating carry bits in parallel for small-bit inputs.
- **CLA_15bit_top.v:** This file defines the top-level 15-bit Carry Lookahead Adder module by hierarchically instantiating smaller CLA units and connecting them to perform full 15-bit binary addition.
- **CLA_15bit_tb.v:** This Verilog file is the testbench for the 15-bit CLA, providing input stimuli and verifying the correctness of the top-level adder module under different test conditions.
- **CLA_15bit.vvp:** This is the compiled simulation output (Verilog Virtual Processor file) of the 15-bit CLA testbench, used by tools like vvp to execute simulation runs.
- **CLA_15bit_top.vcd:** This Value Change Dump (VCD) file logs signal changes during the simulation of the 15-bit CLA, which can be used to visualize waveform outputs.
