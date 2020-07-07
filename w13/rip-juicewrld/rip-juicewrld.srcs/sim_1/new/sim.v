`timescale 1ns / 1ps
module shr_sim;
  reg clk, rst, in, en;
  wire[3:0] out;
  
  shift_register shr(
    .shr(en),
    .rst(rst),
    .shr_in(in),
    .clk(clk),
    .Q(out)
  );
  
  initial en = 1'b1;
  initial clk = 1'b0;
  initial rst = 1'b0;
  initial in  = 1'b1;
  
  always clk = #5 ~clk;
  always in = #4 ~in;
  
  initial begin
    #15
    assign rst = 1'b1;
    #5
    assign rst = 1'b0;
    #30
    assign en = 1'b0;
    #20
    assign en = 1'b1;
    
    $finish;
  end
endmodule
module rc_sim;
  reg clk, rst;
  wire[3:0] out;
  
  ring_counter rc(
    .clk(clk),
    .rst(rst),
    .Q(out)
  );
  
  initial clk = 1'b0;
  initial rst = 1'b0;
  
  always clk = #5 ~clk;
  
  initial begin
    #15
    assign rst = 1'b1;
    #5
    assign rst = 1'b0;
    
    #55
    assign rst = 1'b1;
    #5
    assign rst = 1'b0;
    
    #1600
    $finish;
  end
endmodule

module udc_sim;
  reg clk, up;
  wire[3:0] out;
  wire[6:0] ss;
  
  up_down_counter udc(
    .clk(clk),
    .up(up),
    .Q(out),
    .ss(ss)
  );
  
  initial clk = 1'b0;
  initial up = 1'b1;
  
  always clk = #5 ~clk;
  
  initial begin
    #35
    assign up = 1'b0;
    
    #75
    assign up = 1'b1;
    
    #1600
    $finish;
  end
endmodule