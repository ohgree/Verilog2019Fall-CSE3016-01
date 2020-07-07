`timescale 1ns / 1ps

module aoi(
    input a, b, c, d,
    output e
    );
    assign e = ~((a&b)|(c&d));
endmodule
