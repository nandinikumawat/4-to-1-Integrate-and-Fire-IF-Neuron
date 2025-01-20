# 4-to-1 Integrate-and-Fire (IF) Neuron

This repository contains the implementation of a 4-to-1 Integrate-and-Fire (IF) neuron designed as part of the EE5323 Master's Project at the University of Minnesota. The project involves designing, simulating, and analyzing the circuit's performance with a focus on achieving optimized timing, area, and functionality.

## Circuit Overview

The 4-to-1 IF Neuron computes a weighted sum of four 4-bit inputs (`x0, x1, x2, x3`) and determines if the sum exceeds a threshold value of 16. Here's a breakdown of its architecture:

- **Inputs and Weighting:** Each input bit is synchronized using D flip-flops and is multiplied by a 1-bit synapse weight (`w0, w1, w2, w3`) using AND gates.
- **Hierarchical Summation:** The weighted inputs are summed hierarchically through a network of 1-bit adders to generate a total sum (`Z`).
- **Threshold Comparison:** The total sum is compared to the threshold using OR gates.
- **Output Latching:** The firing decision (`F`) is latched using a D flip-flop to ensure synchronized output.

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

### Stages

1. **Input Synchronization:** D flip-flops align input bits to the clock signal.
2. **Weighted Summation:** Input bits are weighted and summed using a tree-like adder structure.
3. **Threshold Comparison:** The summed value is compared with the predefined threshold.
4. **Output Decision:** The firing signal is latched in a D flip-flop for output stability.

## Clock Period Calculation

The clock period (`Tclk`) is derived from the critical path analysis and is given by:

