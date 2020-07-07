`timescale 1ns / 1ps
module parity_sim;
    reg [3:0] in;
    wire p;
    ParityGen pg(in[3], in[2], in[1], in[0], p);
    initial in = 4'b0000;
    always in = #100 in+1;
    initial begin
        #1600
        $finish;
    end
endmodule
module pc_sim;
    reg [4:0] in;
    wire pec;
    ParityCheck pc(in[4], in[3], in[2], in[1], in[0], pec);
    initial in = 4'b0000;
    always in = #100 in+1;
    initial begin
        #1600
        $finish;
    end
endmodule
module cmp_sim;
    reg [1:0] a, b;
    wire lg, eq, le;
    cmp cs(a[1], a[0], b[1], b[0], lg, eq, le);
    initial a = 2'b00;
    initial b = 2'b00;
    always a = #400 a+1;
    always b = #100 b+1;
    initial begin
        #1600
        $finish;
    end
endmodule