`timescale 1ns / 1ps
module shift_register(shr, rst, shr_in, clk, Q);
  input clk, rst, shr_in, shr;
  output[3:0] Q;
  
  reg [3:0] Q;
  
  always @(posedge clk) begin
    if(rst) begin
      Q <= 4'b0000;
    end
    else if(shr) begin
      Q[0] <= Q[1];
      Q[1] <= Q[2];
      Q[2] <= Q[3];
      Q[3] <= shr_in;
    end
  end
endmodule
module ring_counter(clk, rst, Q);
  input clk, rst;
  output [3:0] Q;
  
  reg [3:0] Q;
  
  always @(posedge clk) begin
    if(rst)
      Q = 4'b1000;
    else begin
      Q[0] <= Q[1];
      Q[1] <= Q[2];
      Q[2] <= Q[3];
      Q[3] <= Q[0];
    end
  end
endmodule
module up_down_counter(up, clk, Q, ss, digit);
  input up, clk;
  output [3:0] Q;
  output [6:0] ss;
  output digit;
  
  assign digit = 1'b1;
  
  reg[3:0] Q;
  reg[6:0] ss;
  
  initial Q <= 4'b0000;
  always @(posedge clk) begin
    if(up) begin
      Q <= Q + 4'b0001;
      ss <= 7'b0111110;
    end
    else begin
      Q <= Q - 4'b0001;
      ss <= 7'b0111101;
    end
  end
endmodule