`timescale 1ns / 1ps

module nandsim;
    reg [3:0] in;
    wire out, e, f, g;
    nandga gateA(in[0], in[1], in[2], in[3], out);
    nandgb gateB(in[0], in[1], in[2], in[3], e, f, g);
    
    initial in = 4'b0000;
    always in = #50 in + 1;
    initial begin
        #20000
        $finish;
    end
endmodule

module norsim;
    reg [3:0] in;
    wire out, e, f, g;
    norga gateA(in[0], in[1], in[2], in[3], out);
    norgb gateB(in[0], in[1], in[2], in[3], e, f, g);
    
    initial in = 4'b0000;
    always in = #50 in + 1;
    initial begin
        #20000
        $finish;
    end
endmodule