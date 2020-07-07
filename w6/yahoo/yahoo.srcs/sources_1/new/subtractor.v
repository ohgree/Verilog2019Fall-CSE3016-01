`timescale 1ns / 1ps
module half_sub(
    input a, b,
    output borrow, d
    );
    assign borrow = ~a&b;
    assign d = a^b;
endmodule
module full_sub(
    input a, b, bin,
    output bout, d
    );
    assign bout = (bin&(~a|b))|(~a&b);
    assign d = a^b^bin;
endmodule
