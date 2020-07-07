`timescale 1ns / 1ps
module sim;
    reg [2:0] in;
    wire borrow, d;
    half_adder u_half_adder(in[1], in[0], s, c);
    full_adder u_full_adder(in[0], in[1], in[2], s, c);
    half_sub u_half_sub(in[1], in[0], borrow, d);
    full_sub u_full_sub(in[2], in[1], in[0], bout, d);
    initial in = 3'b000;
    
    always in = #100 in+1;
    initial begin
        #1000
        $finish;
    end
endmodule
module convsim;
    reg [3:0] in;
    wire e, f, g, h;
    //converter u_converter(in[3], in[2], in[1], in[0], e, f, g, h);
    converterPOS u_converter(in[3], in[2], in[1], in[0], e, f, g, h);
    initial in = 4'b0000;
    
    always in = #100 in+1;
    initial begin
        #2000
        $finish;
    end
endmodule
