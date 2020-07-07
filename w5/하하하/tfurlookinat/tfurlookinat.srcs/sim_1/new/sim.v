`timescale 1ns / 1ps
module sim;
    reg [1:0] in;
    wire outA, outB;
    //dm1A testA(in[0], in[1], outA);
    //dm1B testB(in[0], in[1], outB);
    dm2A testA(in[0], in[1], outA);
    dm2B testB(in[0], in[1], outB);
    
    initial in = 2'b00;
    always in = #200 in + 1;
    initial begin
        #20000
        $finish;
    end
endmodule

module boolsim;
    reg [2:0] in;
    wire outA, outB;
    //boolf1A testA(in[0], in[1], in[2], outA);
    //boolf1B testB(in[0], in[1], in[2], outB);
    boolf2A testA(in[0], in[1], in[2], outA);
    boolf2B testB(in[0], in[1], in[2], outB);
    
    initial in = 3'b000;
    always in = #200 in + 1;
    initial begin
        #20000
        $finish;
    end
endmodule
module cmpsim;
    reg [1:0] in;
    wire eq, neq, lg, le;
    cmp testA(in[0], in[1], eq, neq, lg, le);
    
    initial in = 2'b00;
    always in = #200 in + 1;
    initial begin
        #20000
        $finish;
    end
endmodule
