/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    input cclk,
    output reg spi_miso,
    input [7:0] led,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input [2:0] io_input,
    output reg [2:0] auto_output
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_input_mode_out;
  reg [1-1:0] M_input_mode_in;
  button_conditioner_2 input_mode (
    .clk(clk),
    .in(M_input_mode_in),
    .out(M_input_mode_out)
  );
  wire [1-1:0] M_input_carry_out;
  reg [1-1:0] M_input_carry_in;
  button_conditioner_2 input_carry (
    .clk(clk),
    .in(M_input_carry_in),
    .out(M_input_carry_out)
  );
  wire [1-1:0] M_input_sum_out;
  reg [1-1:0] M_input_sum_in;
  button_conditioner_2 input_sum (
    .clk(clk),
    .in(M_input_sum_in),
    .out(M_input_sum_out)
  );
  wire [16-1:0] M_state_machine_value;
  wire [3-1:0] M_state_machine_modee;
  reg [1-1:0] M_state_machine_rst;
  reg [1-1:0] M_state_machine_input_sum;
  reg [1-1:0] M_state_machine_input_carry;
  reg [1-1:0] M_state_machine_input_mode;
  state_machine_5 state_machine (
    .clk(clk),
    .rst(M_state_machine_rst),
    .input_sum(M_state_machine_input_sum),
    .input_carry(M_state_machine_input_carry),
    .input_mode(M_state_machine_input_mode),
    .value(M_state_machine_value),
    .modee(M_state_machine_modee)
  );
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_6 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  wire [8-1:0] M_seg_display_seg;
  wire [4-1:0] M_seg_display_sel;
  reg [16-1:0] M_seg_display_values;
  reg [4-1:0] M_seg_display_decimal;
  multi_seven_seg_7 seg_display (
    .clk(clk),
    .rst(rst),
    .values(M_seg_display_values),
    .decimal(M_seg_display_decimal),
    .seg(M_seg_display_seg),
    .sel(M_seg_display_sel)
  );
  wire [3-1:0] M_dec_ctr_bit_count;
  reg [1-1:0] M_dec_ctr_inc;
  multi_dec_ctr_8 dec_ctr (
    .clk(clk),
    .rst(rst),
    .inc(M_dec_ctr_inc),
    .bit_count(M_dec_ctr_bit_count)
  );
  wire [1-1:0] M_ctr_value;
  counter_9 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  
  always @* begin
    io_led = io_dip;
    M_input_carry_in = io_input[0+0-:1];
    M_input_sum_in = io_input[1+0-:1];
    M_input_mode_in = io_input[2+0-:1];
    M_reset_cond_in = io_button[1+0-:1];
    M_state_machine_input_carry = M_input_carry_out;
    M_state_machine_input_sum = M_input_sum_out;
    M_state_machine_input_mode = M_input_mode_out;
    M_state_machine_rst = M_reset_cond_out;
    M_reset_cond_in = ~rst_n;
    M_state_machine_rst = M_reset_cond_out;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_edge_detector_in = M_ctr_value;
    M_dec_ctr_inc = M_edge_detector_out;
    M_seg_display_values = M_state_machine_value;
    if (M_state_machine_modee == 1'h0) begin
      auto_output = io_dip[0+0+2-:3];
    end else begin
      auto_output = M_dec_ctr_bit_count;
    end
    M_seg_display_decimal = 4'h0;
    io_seg = ~M_seg_display_seg;
    io_sel = ~M_seg_display_sel;
  end
endmodule
