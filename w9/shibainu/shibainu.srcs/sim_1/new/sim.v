`timescale 1ns / 1ps
module decodersim;
    reg [1:0] in;
    wire a1, b1, c1, d1, a2, b2, c2, d2;
    
    ah_decoder ah(in[1], in[0], a1, b1, c1, d1);
    al_decoder al(in[1], in[0], a2, b2, c2, d2);
    
    initial in = 2'b00;
    always in = #100 in+1;
    
    initial begin
        #1600
        $finish;
    end
endmodule
module encodersim;
    reg [3:0] in;
    wire e0, e1;
    
    encoder en(in[3], in[2], in[1], in[0], e0, e1);
    
    initial in = 4'b0001;
    always in = #100 in*2;
    
    initial begin
        #1600
        $finish;
    end
endmodule
module b2dsim;
    reg [3:0] in;
    wire o0, o1, o2, o3, o4, o5, o6, o7, o8, o9;
    
    bcd2dec b2d(in[3], in[2], in[1], in[0], o0, o1, o2, o3, o4, o5, o6, o7, o8, o9);
    
    initial in = 4'b0000;
    always in = #100 in+1;
    
    initial begin
        #1600
        $finish;
    end
endmodule
module muxsim;
    reg [3:0] in;
    reg [1:0] s;
    wire q;
    
    mux41 mux(in[3], in[2], in[1], in[0], s[1], s[0], q);
    
    initial in = 4'b0000;
    initial s = 2'b00;
    always in = #100 in+1;
    always s = #1600 s+1;
    
    initial begin
        #1600
        $finish;
    end
endmodule
module demuxsim;
    reg [2:0] in;
    wire o0, o1, o2, o3;
    
    demux14 dmux(in[2], in[1], in[0], o0, o1, o2, o3);
    
    initial in = 3'b000;
    always in = #100 in+1;
    
    initial begin
        #1600
        $finish;
    end
endmodule