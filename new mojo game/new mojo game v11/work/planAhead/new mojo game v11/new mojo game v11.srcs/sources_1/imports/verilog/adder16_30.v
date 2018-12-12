/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder16_30 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] out,
    output reg z,
    output reg n,
    output reg v
  );
  
  
  
  reg [15:0] sum;
  
  reg [15:0] xb;
  
  always @* begin
    xb = b ^ {5'h10{alufn[0+0-:1]}};
    
    case (alufn[0+1-:2])
      2'h0: begin
        sum = a + b;
      end
      2'h1: begin
        sum = a - b;
      end
      2'h2: begin
        sum = a * b;
      end
      default: begin
        sum = a - b;
      end
    endcase
    v = (a[15+0-:1] & xb[15+0-:1] & ~sum[15+0-:1]) | (~a[15+0-:1] & ~xb[15+0-:1] & sum[15+0-:1]);
    n = sum[15+0-:1];
    z = (~|sum);
    out = sum;
  end
endmodule
