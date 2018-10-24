/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     DIGITS = 4
*/
module multi_dec_ctr_8 (
    input clk,
    input rst,
    input inc,
    output reg [2:0] bit_count
  );
  
  localparam DIGITS = 3'h4;
  
  
  wire [3-1:0] M_dct_bit_value;
  reg [1-1:0] M_dct_inc;
  decimal_counter_16 dct (
    .clk(clk),
    .rst(rst),
    .inc(M_dct_inc),
    .bit_value(M_dct_bit_value)
  );
  
  always @* begin
    M_dct_inc[0+0-:1] = inc;
    bit_count = M_dct_bit_value;
  end
endmodule
