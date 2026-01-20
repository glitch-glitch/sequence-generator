Design the following sequence generator module:

0 → 1 → 1 → 1 → 2 → 2 → 3 → 4 → 5 → 7 → 9 → 12 → 16 → 21 → 28 → 37 → ...


Create the history: Declare three 32-bit registers (S0, S1, S2) to act as a sliding window for previous values.
Define the math: Write the combinational logic that calculates the next value by summing the two oldest registers (S_n = S2 + S1).
Inside the reset block, initialize the registers to non-zero values (like 1 and 0) so the math doesn't get stuck at zero.
Shift on clock: On every clock edge, push the values down the line (S0 to S1 to S2) and load the calculated sum (s_n) into the front (S0).
Drive the output: Continuously assign the oldest register (S2) to the module output seq_o.
