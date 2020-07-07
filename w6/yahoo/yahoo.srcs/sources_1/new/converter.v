`timescale 1ns / 1ps
module converter(
    input a, b, c, d,
    output e, f, g, h
    );
    assign e = a|(b&d)|(b&c);
    assign f = a|(b&c)|(b&~d);
    assign g = (b&~c&d)|a|(~b&c);
    assign h = d;
endmodule

module converterPOS(
    input a, b, c, d,
    output e, f, g, h
    );
    assign e = (a|c|d)&(a|b);
    assign f = (a|b)&(a|c|~d);
    assign g = (a|b|c)&(a|c|d)&(~b|~c);
    assign h = d;
endmodule