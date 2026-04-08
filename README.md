# 16-bit Carry Lookahead Adder (CLA) in Verilog

---

##  Overview

This project implements a **16-bit Carry Lookahead Adder (CLA)** using Verilog HDL.
The design uses a hierarchical approach to improve speed by reducing carry propagation delay compared to traditional Ripple Carry Adders (RCA).

---

## Design Concept

In digital addition, the major delay comes from **carry propagation**.

### 🔹 Ripple Carry Adder (RCA)

* Carry propagates sequentially from LSB to MSB
* Slower for large bit-width operations

### 🔹 Carry Lookahead Adder (CLA)

* Computes carry signals in advance
* Uses:

  * **Generate (G)** → Carry is generated
  * **Propagate (P)** → Carry is propagated
* Significantly faster than RCA

---

##  Architecture

The 16-bit CLA is implemented using a **hierarchical design**:

```text id="arch1"
16-bit CLA
   ├── 4-bit CLA (Adder4cla)
   ├── 4-bit CLA (Adder4cla)
   ├── 4-bit CLA (Adder4cla)
   └── 4-bit CLA (Adder4cla)
```

Each 4-bit CLA block internally computes:

* Generate (G)
* Propagate (P)

---

##  Project Structure

```text id="struct1"
verilog-adder/
├── Adder.v          // Top module (16-bit CLA)
├── Adder4cla.v      // 4-bit Carry Lookahead Adder
├── Adder4rca.v      // 4-bit Ripple Carry Adder (reference)
├── FullAdder.v      // Basic 1-bit adder
├── adder_tb.v       // Testbench
└── README.md
```

---

##  Module Description

### 🔹 FullAdder

* Performs 1-bit addition
* Inputs: A, B, Cin
* Outputs: Sum, Carry

---

### 🔹 Adder4rca (4-bit Ripple Carry Adder)

* Uses 4 Full Adders
* Carry propagates sequentially
* Used for comparison/reference

---

### 🔹 Adder4cla (4-bit Carry Lookahead Adder)

* Computes carry using generate and propagate logic
* Faster than RCA
* Outputs group generate (G) and propagate (P)

---

### 🔹 Adder (16-bit CLA - Top Module)

* Combines four 4-bit CLA blocks
* Computes intermediate carry signals
* Produces final 16-bit sum

---

##  Output Flags

The design also generates important flags:

* **Carry (Cout)** → Carry-out of MSB
* **Zero (Z)** → High when result is zero
* **Sign (S)** → MSB of result
* **Parity (P)** → Even parity of result
* **Overflow (V)** → Indicates signed overflow

---

##  Testbench & Verification

A testbench (`adder_tb.v`) is included to verify the functionality.

### ✔ Verification Includes:

* Multiple input test cases
* Sum and carry validation
* Flag verification
* Simulation using Vivado

---

##  Features

* High-speed addition using CLA logic
* Hierarchical and modular design
* Synthesizable Verilog code
* Includes verification through testbench

---

##  Tools Used

* Verilog HDL
* Xilinx Vivado (Simulation & Synthesis)

---

##  How to Run

1. Open project in Vivado
2. Add all `.v` files
3. Add `adder_tb.v` as simulation source
4. Run Behavioral Simulation
5. Observe waveform output

---

##  Future Improvements

* Compare delay between CLA and RCA
* Extend design to 32-bit / 64-bit
* Implement pipelined architecture
* Integrate into ALU design

---

##  Author

**Kaustav Kumar Kandukuri**
Electronics & Communication Engineering Student

---

##  Acknowledgment

This project demonstrates the implementation of high-speed arithmetic circuits using Verilog and digital design principles.
