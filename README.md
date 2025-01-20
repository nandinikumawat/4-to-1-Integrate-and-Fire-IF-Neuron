# 4-to-1 Integrate-and-Fire (IF) Neuron

This repository contains the implementation of a 4-to-1 Integrate-and-Fire (IF) neuron designed as part of the EE5323 Master's Project at the University of Minnesota. The project involves designing, simulating, and analyzing the circuit's performance with a focus on achieving optimized timing, area, and functionality.

## Circuit Overview

The 4-to-1 IF Neuron computes a weighted sum of four 4-bit inputs (`x0, x1, x2, x3`) and determines if the sum exceeds a threshold value of 16. Here's a breakdown of its architecture:

- **Inputs and Weighting:** Each input bit is synchronized using D flip-flops and is multiplied by a 1-bit synapse weight (`w0, w1, w2, w3`) using AND gates.
- **Hierarchical Summation:** The weighted inputs are summed hierarchically through a network of 1-bit adders to generate a total sum (`Z`).
- **Threshold Comparison:** The total sum is compared to the threshold using OR gates.
- **Output Latching:** The firing decision (`F`) is latched using a D flip-flop to ensure synchronized output.

  ![image](https://github.com/user-attachments/assets/7dd4d3ec-3aa4-4092-be24-907c90615a4d)


The design employs pipelining with intermediate flip-flops for high-speed operation.

## Critical Path Analysis

### Identifying the Critical Path

The circuit's critical path is primarily determined by:
1. **Adder Chain Dependency:** The propagation of the carry signal from the least significant bit (LSB) to the most significant bit (MSB) in the hierarchical network of 1-bit adders.
2. **Threshold Comparison:** The comparison of the total sum (`Z`) with the threshold value involves OR gates.
3. **Output Latching:** The firing signal (`F`) is latched using a D flip-flop.

### Worst-Case Input Vectors

The worst-case delay scenario occurs when inputs are configured to maximize carry propagation and trigger threshold comparison:
- Inputs `x0` and `x1` are set to 8 (binary: `1000`).
- All synapse weights (`w0, w1, w2, w3`) are enabled (`1`).

  * Include the D Flip-Flop subcircuit
.INCLUDE fireNeuron.sp

* Power supplies
Vdd VDD 0 0.8V
Vss VSS 0 0V

* Inputs
* D toggles every 40ps

VW1 w1 0 0.8
VW2 w2 0 0.8
VW3 w3 0 0.8
VW4 w4 0 0.8

VX0_1 x0_1 0 DC 0
VX0_2 x0_2 0 DC 0
VX0_3 x0_3 0 DC 0
VX0_4 x0_4 0 PULSE(0 0.8 0 20p 20p 60p 150p)

VX1_1 x1_1 0 DC 0
VX1_2 x1_2 0 DC 0
VX1_3 x1_3 0 DC 0
VX1_4 x1_4 0 PULSE(0 0.8 0 20p 20p 60p 150p)

VX2_1 x2_1 0 DC 0
VX2_2 x2_2 0 DC 0
VX2_3 x2_3 0 DC 0
VX2_4 x2_4 0 DC 0

VX3_1 x3_1 0 DC 0
VX3_2 x3_2 0 DC 0
VX3_3 x3_3 0 DC 0
VX3_4 x3_4 0 DC 0

VCLK CLK 0 PULSE(0 0.8 0 20p 20p 40p 120p)

* Load capacitance for Q and Q'
*CloadQ Q 0 1fF

* Transient analysis for functionality verification
.TRAN 1ps 25ns

.END


This configuration ensures:
- Carry propagation across the entire adder chain.
- Threshold comparison is activated, testing the critical timing path.

## Detailed Circuit Working

### Components

1. **D Flip-Flops:** Synchronize inputs and latch the firing decision.
2. **AND Gates:** Apply synapse weights to the input bits.
3. **1-Bit Adders:** Sum the weighted inputs hierarchically.
4. **OR Gates:** Compare the total sum with the threshold.
5. **Pipeline Stages:** Maintain high-speed operation and reduce combinational delay.

![image](https://github.com/user-attachments/assets/f29b5db9-f742-4579-b0fa-c41686ea8076)

### Stages

1. **Input Synchronization:** D flip-flops align input bits to the clock signal.
2. **Weighted Summation:** Input bits are weighted and summed using a tree-like adder structure.
3. **Threshold Comparison:** The summed value is compared with the predefined threshold.
4. **Output Decision:** The firing signal is latched in a D flip-flop for output stability.

## Clock Period Calculation

The clock period (`Tclk`) is derived from the critical path analysis and is given by:
Tclk ≥ Tclk-Q + Tcomb + Tsetup


Where:
- **Tclk-Q:** Clock-to-Q delay of the D flip-flop (`14.216 ps`).
- **Tcomb:** Combinational delay in the critical path (`159.45 ps`).
- **Tsetup:** Setup time of the flip-flop (`1.439 ps`).

### Calculation:
Tclk = 14.216 ps + 159.45 ps + 1.439 ps Tclk = 175.116 ps Tclk = 0.175116 ns


The calculated clock period ensures reliable operation across all stages of the circuit.

## Simulation and Evaluation

### Simulation Environment
- Tools used: SPICE simulations for timing analysis, STA for delay verification.
- Inputs tested: Configurations to validate carry propagation, threshold comparison, and D flip-flop functionality.

### Results
- Achieved a clock period of **0.1751 ns**.
- Verified worst-case delays and critical path timing.

Feel free to explore the code and simulations included in this repository. Contributions and feedback are welcome to improve the design and documentation.






