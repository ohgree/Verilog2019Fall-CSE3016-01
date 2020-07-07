`timescale 1ns / 1ps
module srlatchsim;
  reg clk, s, r;
  wire q, qbar;
  
  SRLatch srlatch(clk, s, r, q, qbar);
  
  initial clk=1'b0;
  initial s=1'b1;
  initial r=1'b0;
  
  always clk = #5 ~clk;
  always s = #7 ~s;
  always r = #14 ~r;
  
  initial begin
    #1600
    $finish;
  end
endmodule

module srffsim;
  reg clk, s, r;
  wire q, qbar;
  
  SRFlipFlop srflipflop(clk, s, r, q, qbar);
  
  initial clk=1'b0;
  initial s=1'b1;
  initial r=1'b0;
  
  always clk = #5 ~clk;
  always s = #7 ~s;
  always r = #14 ~r;
  
  initial begin
    #1600
    $finish;
  end
endmodule

module dlatchsim;
  reg clk, d;
  wire q, qbar;
  
  DLatch dlatch(clk, d, q, qbar);
  
  initial clk=1'b0;
  initial d=1'b1;
  
  always clk = #5 ~clk;
  always d = #7 ~d;
  
  initial begin
    #1600
    $finish;
  end
endmodule
module dffsim;
  reg clk, d;
  wire q, qbar;
  
  DFlipFlop dff(clk, d, q, qbar);
  
  initial clk=1'b0;
  initial d=1'b1;
  
  always clk = #5 ~clk;
  always d = #7 ~d;
  
  initial begin
    #1600
    $finish;
  end
endmodule

module jkffsim;
  reg clk, j, k;
  wire q, qbar;
  
  JKFlipFlop jkflipflop(clk, j, k, q, qbar);
  
  initial clk=1'b0;
  initial j=1'b1;
  initial k=1'b0;
  
  always clk = #5 ~clk;
  always j = #7 ~j;
  always k = #14 ~k;
  
  initial begin
    #1600
    $finish;
  end
endmodule