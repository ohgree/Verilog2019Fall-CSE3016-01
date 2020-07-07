`timescale 1ns / 1ps

module xorga(
    input a, b, c, d,
    output e
    );
    assign e = a^b^c^d;
endmodule

module xorgb(
    input a, b, c, d,
    output e, f, g
    );
    assign e = a^b;
    assign f = e^c;
    assign g = f^d;
endmodule