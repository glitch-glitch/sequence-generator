module seq_generator (
  input   logic        clk,
  input   logic        reset,

  output  logic [31:0] seq_o
); 
  logic [31:0] S0;
  logic [31:0] S1;
  logic [31:0] S2;
  logic [31:0] S_n;
  
  always_ff@(posedge clk or posedge reset)begin
    if (reset) begin
      S0 <= 32'h1;
      S1 <= 32'h1;
      S2 <= 32'h0;
    end
    else begin
      S1 <= S0;
      S2 <= S1;
      S0 <= S_n;
    end
  end
  assign S_n = S2+S1;
  assign seq_o = S2;

  // Write your logic here...

endmodule
