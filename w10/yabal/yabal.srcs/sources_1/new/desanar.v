`timescale 1ns / 1ps
module full_adder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    assign cout = a&b|cin&(a^b);
    assign sum = (a^b)^cin;
endmodule
module rca_4bit(a, b, sign, s, c4);
    input [3:0] a, b;
    output [3:0] s;
    input sign;
    output c4;
    wire c1, c2, c3;
    full_adder fa0(a[0], b[0]^sign, sign, s[0], c1);
    full_adder fa1(a[1], b[1]^sign, c1, s[1], c2);
    full_adder fa2(a[2], b[2]^sign, c2, s[2], c3);
    full_adder fa3(a[3], b[3]^sign, c3, s[3], c4);
endmodule
module bcd_adder(a, b, sum, cout);
    input [3:0] a, b;
    output [3:0] sum, cout;
    wire carryOut;
    wire [3:0] binarySum;
    rca_4bit rca0(a, b, 0, binarySum, carryOut);
    assign cout = carryOut|(binarySum[3]&binarySum[2])|(binarySum[3]&binarySum[1]);
    rca_4bit rca1(binarySum, 4'b0110 & {4{cout[0]}}, 0, sum);
endmodule