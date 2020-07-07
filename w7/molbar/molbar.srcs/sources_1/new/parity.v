`timescale 1ns / 1ps
module ParityGen(
    input a, b, c, d,
    output p
    );
    assign p = (a^b)^(c^d);
endmodule
module ParityCheck(
    input a, b, c, d, p,
    output pec
    );
    assign pec = a^b^c^d^p;
endmodule
module cmp(
    input a, b, c, d,
    output lg, eq, le
    );
    assign lg = (a&~c)+(b&~c&~d)+(a&b&~d);
    assign eq = ~((b^d)|(a^c));
    assign le = (~a&c)+(~b&c&d)+(~a&~b&d);
endmodule