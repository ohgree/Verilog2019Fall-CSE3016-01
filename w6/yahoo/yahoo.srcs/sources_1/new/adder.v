`timescale 1ns / 1ps
module half_adder(
    input a, b,
    output s, c
    );
    assign s = a^b;
    assign c = a&b;
endmodule
module full_adder(
    input a, b, cin,
    output s, cout
    );
    assign s = a^b^cin;
    assign cout = (a&b)|((a^b)&cin);
endmodule