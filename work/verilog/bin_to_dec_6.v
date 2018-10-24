/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     DIGITS = 4
     LEADING_ZEROS = 0
*/
module bin_to_dec_6 (
    input [13:0] value,
    output reg [15:0] digits
  );
  
  localparam DIGITS = 3'h4;
  localparam LEADING_ZEROS = 1'h0;
  
  
  integer i;
  integer j;
  integer scale;
  
  reg [13:0] remainder;
  
  reg [13:0] sub_value;
  
  reg blank;
  
  always @* begin
    for (i = 1'h0; i < 3'h4; i = i + 1) begin
      digits[(i)*4+3-:4] = 4'hb;
    end
    remainder = value;
    blank = 1'h1;
    if (value < 14'h2710) begin
      for (j = 4'h3; j >= $signed(1'h0); j = j - 1) begin
        scale = $pow(4'ha, j);
        if (remainder < scale) begin
          if (j != 1'h0 && blank) begin
            digits[(j)*4+3-:4] = 4'ha;
          end else begin
            digits[(j)*4+3-:4] = 1'h0;
          end
        end else begin
          blank = 1'h0;
          sub_value = 1'h0;
          for (i = 4'h9; i >= 1'h1; i = i - 1) begin
            if (remainder < (i + 1'h1) * scale) begin
              digits[(j)*4+3-:4] = i;
              sub_value = i * scale;
            end
          end
          remainder = remainder - sub_value;
        end
      end
    end
  end
endmodule
