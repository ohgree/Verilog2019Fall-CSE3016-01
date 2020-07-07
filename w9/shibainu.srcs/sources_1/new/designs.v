`timescale 1ns / 1ps
module ah_decoder(
    input in1, in2,
    output out1, out2, out3, out4
    );
    assign out1 = ~in1&~in2;
    assign out2 = ~in1&in2;
    assign out3 = in1&~in2;
    assign out4 = in1&in2;
endmodule
module al_decoder(
    input in1, in2,
    output out1, out2, out3, out4
    );
    assign out1 = ~(~in1&~in2);
    assign out2 = ~(~in1&in2);
    assign out3 = ~(in1&~in2);
    assign out4 = ~(in1&in2);
endmodule
module encoder (
    input a, b, c, d,
    output e0, e1
    );
    assign e0 = a|b;
    assign e1 = a|c;
endmodule
module bcd2dec(
    input a3, a2, a1, a0,
    output o0, o1, o2, o3, o4, o5, o6, o7, o8, o9
    );
    assign o0 = ~a3&~a2&~a1&~a0;
    assign o1 = ~a3&~a2&~a1&a0;
    assign o2 = ~a3&~a2&a1&~a0;
    assign o3 = ~a3&~a2&a1&a0;
    assign o4 = ~a3&a2&~a1&~a0;
    assign o5 = ~a3&a2&~a1&a0;
    assign o6 = ~a3&a2&a1&~a0;
    assign o7 = ~a3&a2&a1&a0;
    assign o8 = a3&~a2&~a1&~a0;
    assign o9 = a3&~a2&~a1&a0;
endmodule
module mux41(
    input a, b, c, d, s1, s0,
    output q
    );
    assign q = (a&~s0&~s1)|(b&s0&~s1)|(c&~s0&s1)|(d&s0&s1);
endmodule
module mux81(
    input a, b, c, d, e, f, g, h, s2, s1, s0,
    output q
    );
    assign q = (a&~s0&~s1&~s2)|(b&s0&~s1&~s2)|(c&~s0&s1&~s2)|(d&s0&s1&~s2)|(e&~s0&~s1&s2)|(f&s0&~s1&s2)|(g&~s0&s1&s2)|(h&s0&s1&s2);
endmodule
module demux14(
    input s1, s0, f,
    output a, b, c, d
    );
    assign a = f&(~s1&~s0);
    assign b = f&(~s1&s0);
    assign c = f&(s1&~s0);
    assign d = f&(s1&s0);
endmodule
module decoder416(
    input s3, s2, s1, s0,
    output o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15
    );
    wire en0, en1, en2, en3;
    demux14 dm(s3, s2, 1, en0, en1, en2, en3);
    demux14 dm0(s1, s0, en0, o0, o1, o2, o3);
    demux14 dm1(s1, s0, en1, o4, o5, o6, o7);
    demux14 dm2(s1, s0, en2, o8, o9, o10, o11);
    demux14 dm3(s1, s0, en3, o12, o13, o14, o15);
endmodule