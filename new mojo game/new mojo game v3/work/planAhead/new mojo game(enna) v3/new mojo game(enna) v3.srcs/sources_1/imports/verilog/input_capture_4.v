/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module input_capture_4 (
    input clk,
    input rst,
    output reg [5:0] button_col,
    input [4:0] button_row,
    output reg [1:0] guessled,
    output reg [4:0] somechar
  );
  
  
  
  reg [4:0] M_button_col_cycler_d, M_button_col_cycler_q = 1'h0;
  reg [23:0] M_counter_d, M_counter_q = 1'h0;
  
  wire [5-1:0] M_bm_char;
  reg [6-1:0] M_bm_button_col;
  reg [5-1:0] M_bm_button_row;
  buttonmapping_8 bm (
    .button_col(M_bm_button_col),
    .button_row(M_bm_button_row),
    .char(M_bm_char)
  );
  
  always @* begin
    M_button_col_cycler_d = M_button_col_cycler_q;
    M_counter_d = M_counter_q;
    
    somechar = M_bm_char;
    guessled = 2'h3;
    M_bm_button_col = M_button_col_cycler_q;
    M_bm_button_row = button_row;
    if (M_button_col_cycler_q == 1'h0) begin
      M_button_col_cycler_d = 1'h1;
    end
    if (button_row != 1'h0) begin
      guessled = 2'h0;
    end
    button_col = M_button_col_cycler_q;
    M_counter_d = M_counter_q + 1'h1;
    if (button_row == 1'h0 && M_counter_q[20+0-:1] == 1'h1) begin
      M_button_col_cycler_d = M_button_col_cycler_q << 1'h1;
      M_counter_d = 1'h0;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_button_col_cycler_q <= 1'h0;
      M_counter_q <= 1'h0;
    end else begin
      M_button_col_cycler_q <= M_button_col_cycler_d;
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule
