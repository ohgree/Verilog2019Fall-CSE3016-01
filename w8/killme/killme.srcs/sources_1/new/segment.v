`timescale 1ns / 1ps
module segment(
    input a, b, c, d,
    output ao, bo, co, do, eo, fo, go, dp, digit
    );
    assign ao = (~b&~d)|(a&~d)|(a&~b&~c)|(~a&b&d)|(~a&c)|(b&c);
    assign bo = (~b&~c)|(~b&~d)|(~a&~c&~d)|(~a&c&d)|(a&~c&d);
    assign co = (~a&b)|(a&~b)|(~c&d)|(~a&~c)|(~a&d);
    assign do = (~b&~c&~d)|(~b&c&d)|(~a&c&~d)|(b&~c&d)|(a&b&~d);
    assign eo = (~b&~d)|(c&~d)|(a&b)|(a&c);
    assign fo = (~c&~d)|(b&~d)|(~a&b&~c)|(a&c)|(a&~b);
    assign go = (~a&~b&c)|(c&~d)|(~a&b&~c)|(a&d)|(a&~b);
    assign dp = 1;
    assign digit = 1;
endmodule
