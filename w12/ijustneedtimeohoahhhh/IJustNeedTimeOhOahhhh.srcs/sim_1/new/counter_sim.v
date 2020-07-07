`timescale 1ns / 1ps
module twobit_sim;
  reg clk, rst;
  wire[1:0] out;
  
  two_bit_counter tbc(
    .clk(clk), 
    .rst(rst), 
    .out(out)
  );
  
  initial clk = 0;
  initial rst = 0;
  
  always clk = #5 clk + 1;
  
  initial begin
    #50
    assign rst = ~rst;
    #10
    assign rst = ~rst;
    #1600
    $finish;
  end
endmodule
module decade_sim;
  reg clk, rst;
  wire[3:0] out;
  
  decade_counter dc(
    .clk(clk), 
    .rst(rst), 
    .out(out)
  );
  
  initial clk = 0;
  initial rst = 0;
  
  always clk = #5 clk + 1;
  
  initial begin
    #50
    assign rst = ~rst;
    #10
    assign rst = ~rst;
    #1600
    $finish;
  end
endmodule
module code2421_sim;
  reg clk, rst;
  wire[3:0] out;
  
  code2421_counter cc(
    .clk(clk), 
    .rst(rst), 
    .out(out)
  );
  
  initial clk = 0;
  initial rst = 0;
  
  always clk = #5 clk + 1;
  
  initial begin
    #50
    assign rst = ~rst;
    #10
    assign rst = ~rst;
    #1600
    $finish;
  end
endmodule

