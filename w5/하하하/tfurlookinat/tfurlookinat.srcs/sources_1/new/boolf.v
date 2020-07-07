`timescale 1ns / 1ps
module boolf1A(
    input a, b, c,
    output out
    );
    assign out = (~a|~b)&~c;
endmodule
module boolf1B(
    input a, b, c,
    output out
    );
    assign out = ~((a&b)|c);
endmodule

module boolf2A(
    input a, b, c,
    output out
    );
    assign out = (~a&~b)|~c;
endmodule
module boolf2B(
    input a, b, c,
    output out
    );
    assign out = ~((a|b)&c);
endmodule
