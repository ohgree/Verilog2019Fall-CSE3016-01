`timescale 1ns / 1ps
module cmp(
    input a, b,
    output eq, neq, lg, le
    );
    assign eq = (~a&~b)|(a&b);
    assign neq = (~a&b)|(a&~b);
    assign lg = a&~b;
    assign le = ~a&b;
endmodule
