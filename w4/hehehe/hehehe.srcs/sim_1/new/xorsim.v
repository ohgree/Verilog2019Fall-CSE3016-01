`timescale 1ns / 1ps

module xorsim;
    reg [3:0] in;
    wire out, e, f, g;
    xorga gateA(in[0], in[1], in[2], in[3], out);
    xorgb gateB(in[0], in[1], in[2], in[3], e, f, g);
    
    initial in = 4'b0000;
    always in = #50 in + 1;
    initial begin
        #20000
        $finish;
    end
endmodule

module aoisim;
    reg [3:0] in;
    wire out;
    aoi gateA(in[0], in[1], in[2], in[3], out);
    
    initial in = 4'b0000;
    always in = #50 in + 1;
    initial begin
        #20000
        $finish;
    end
endmodule