`timescale 1ns / 1ps
module SRLatch(
  en, s, r, q, qbar
  );
  input en, s, r;
  output q, qbar;
  reg q;
  assign qbar = ~q;
  always @(en or s or r) begin
  if(en) begin
    if((s==1)&&(r==1))
      q <= 1'bx;
    else if((s==1)&&(r==0))
      q <= 1'b1;
    else if((s==0)&&(r==1))
      q <= 1'b0;
    else
      q <= q;
    end
  end
endmodule
module srlatch ( 
  input S,
  input R,
  input En,
  output reg Q,
  output reg Qc
  );
always @(*) begin
  if (En) begin
    Q  =  ~(R | Qc); 
    Qc =  ~(S | Q); 
  end
end
endmodule : srlatch

module SRFlipFlop(
    clk, s, r, q, qbar
    );
    input clk, s, r;
    output q, qbar;
    reg q;
    assign qbar = ~q;
    always @(posedge clk) begin
        if((s==1)&&(r==1))
            q <= 1'bx;
        else if((s==1)&&(r==0))
            q <= 1'b1;
        else if((s==0)&&(r==1))
            q <= 1'b0;
        else
            q <= q;
    end
endmodule

module DLatch(
  en, d, q, qbar
  );
  input en, d;
  output q, qbar;
  reg q;
  assign qbar = ~q;
  always @(en or d) begin
    if(en)
      q <= d;
  end
endmodule

module DFlipFlop(
  clk, d, q, qbar
  );
  input clk, d;
  output q, qbar;
  reg q;
  assign qbar = ~q;
  always @(posedge clk) begin
      q <= d;
  end
endmodule


module JKFlipFlop(
    clk, j, k, q, qbar
    );
    input clk, j, k;
    output q, qbar;
    reg q;
    assign qbar = ~q;
    always @(posedge clk) begin
        if((j==1)&&(k==1))
            q <= ~q;
        else if((j==1)&&(k==0))
            q <= 1'b1;
        else if((j==0)&&(k==1))
            q <= 1'b0;
        else
            q <= q;
    end
endmodule