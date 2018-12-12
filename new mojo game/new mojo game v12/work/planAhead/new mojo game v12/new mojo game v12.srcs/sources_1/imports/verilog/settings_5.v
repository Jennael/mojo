/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module settings_5 (
    input clk,
    input [1:0] speed,
    output reg [1:0] newspeed,
    output reg [25:0] increment
  );
  
  
  
  reg [25:0] M_incr_d, M_incr_q = 1'h1;
  
  wire [16-1:0] M_aluspeed_alu_output;
  reg [6-1:0] M_aluspeed_alufn;
  reg [16-1:0] M_aluspeed_a;
  reg [16-1:0] M_aluspeed_b;
  alu_20 aluspeed (
    .alufn(M_aluspeed_alufn),
    .a(M_aluspeed_a),
    .b(M_aluspeed_b),
    .alu_output(M_aluspeed_alu_output)
  );
  
  always @* begin
    M_incr_d = M_incr_q;
    
    M_aluspeed_a = M_incr_q[0+15-:16];
    M_aluspeed_b = 1'h1;
    M_aluspeed_alufn = 6'h22;
    increment = M_incr_q;
    newspeed = speed;
    
    case (speed[0+1-:2])
      2'h2: begin
        M_aluspeed_a = M_incr_q[0+15-:16];
        M_aluspeed_b = 1'h1;
        M_aluspeed_alufn = 6'h20;
        if (M_incr_q < 6'h20) begin
          M_incr_d[0+15-:16] = M_aluspeed_alu_output;
          newspeed = 1'h0;
        end
      end
      2'h1: begin
        M_aluspeed_a = M_incr_q[0+15-:16];
        M_aluspeed_b = 1'h1;
        M_aluspeed_alufn = 6'h21;
        if (M_incr_q > 1'h1) begin
          M_incr_d[0+15-:16] = M_aluspeed_alu_output;
          newspeed = 1'h0;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_incr_q <= M_incr_d;
  end
  
endmodule
