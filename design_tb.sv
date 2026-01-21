`timescale 1ns / 1ps

module tb_seq_generator;

  // 1. Signal Declaration
  logic        clk;
  logic        reset;
  logic [31:0] seq_o;

  // 2. Instantiate the DUT (Device Under Test)
  seq_generator dut (
    .clk   (clk),
    .reset (reset),
    .seq_o (seq_o)
  );

  // 3. Clock Generation (10ns period -> 100MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // 4. Stimulus and Monitoring
  initial begin
    // Set up monitoring to print to console whenever signals change
    $monitor("Time: %0t | Reset: %b | Output (seq_o): %0d", $time, reset, seq_o);

    // Initialize Inputs
    reset = 0;

    // Apply Reset (Active High as per design)
    // Hold reset for a few cycles to ensure signals settle
    #10 reset = 1;
    #20 reset = 0;
    
    // Wait and observe the sequence generation
    // Running for 20 clock cycles
    repeat (20) @(posedge clk);

    // End Simulation
    $display("Simulation Finished.");
    $finish;
  end
  
  // Optional: Dump waves for viewer (GTKWave/Verdi)
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_seq_generator);
  end

endmodule
