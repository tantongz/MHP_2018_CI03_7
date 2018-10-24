/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module state_machine_5 (
    input clk,
    input rst,
    output reg [15:0] value,
    input input_sum,
    input input_carry,
    input input_mode,
    output reg [2:0] modee
  );
  
  
  
  localparam MANUAL_state = 1'd0;
  localparam AUTO_state = 1'd1;
  
  reg M_state_d, M_state_q = MANUAL_state;
  reg [15:0] M_display_value_d, M_display_value_q = 1'h0;
  reg [2:0] M_mode_d, M_mode_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_display_value_d = M_display_value_q;
    M_mode_d = M_mode_q;
    
    value = M_display_value_q;
    modee = M_mode_q;
    
    case (M_state_q)
      MANUAL_state: begin
        M_mode_d = 1'h0;
        if (input_mode) begin
          M_state_d = AUTO_state;
        end else begin
          if (input_sum & input_carry) begin
            M_display_value_d = 16'h1911;
          end else begin
            if (input_sum) begin
              M_display_value_d = 16'h1901;
            end else begin
              if (input_carry) begin
                M_display_value_d = 16'h1910;
              end else begin
                M_display_value_d = 16'h1900;
              end
            end
          end
        end
      end
      AUTO_state: begin
        M_mode_d = 1'h1;
        if (!input_mode) begin
          M_state_d = MANUAL_state;
        end
        if (input_sum & input_carry) begin
          M_display_value_d = 16'h2911;
        end else begin
          if (input_sum) begin
            M_display_value_d = 16'h2901;
          end else begin
            if (input_carry) begin
              M_display_value_d = 16'h2910;
            end else begin
              M_display_value_d = 16'h2900;
            end
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_display_value_q <= M_display_value_d;
    M_mode_q <= M_mode_d;
    
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule