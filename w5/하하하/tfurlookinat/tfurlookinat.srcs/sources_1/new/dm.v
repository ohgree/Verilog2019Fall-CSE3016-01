`timescale 1ns / 1ps
module dm1A(
    input a, b,
    output out
    );
    assign out = ~(a|b);
endmodule
module dm1B(
    input a, b,
    output out
    );
    assign out = (~a)&(~b);
endmodule

module dm2A(
    input a, b,
    output out
    );
    assign out = ~(a&b);
endmodule
module dm2B(
    input a, b,
    output out
    );
    assign out = (~a)|(~b);
endmodule