/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module decimal_counter_22 (
    input clk,
    input rst,
    input inc,
    output reg [2:0] bit_value
  );
  
  
  
  reg [2:0] M_bit_count_d, M_bit_count_q = 1'h0;
  
  always @* begin
    M_bit_count_d = M_bit_count_q;
    
    bit_value = M_bit_count_q;
    if (inc) begin
      if (M_bit_count_q == 4'h8) begin
        M_bit_count_d = 1'h0;
      end else begin
        M_bit_count_d = M_bit_count_q + 1'h1;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_bit_count_q <= 1'h0;
    end else begin
      M_bit_count_q <= M_bit_count_d;
    end
  end
  
endmodule