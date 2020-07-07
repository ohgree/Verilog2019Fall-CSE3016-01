`timescale 1ns / 1ps
module rcasim;
    reg [3:0] a, b;
    reg sign;
    wire [3:0] s;
    wire cout;
    initial a = 4'b0101;
    initial b = 4'b0001;
    initial sign = 1'b0;
    // 5+1
    rca_4bit rca4(a, b, sign, s, cout);
    
    initial begin
        #500
        assign sign = 1'b1;
        // 5-1
        #500
        assign sign = 1'b0;
        assign a=4'b0011;
        assign b=4'b0101;
        //3+5
        #500
        assign sign = 1'b1;
        //3-5
        #500
        assign sign = 1'b0;
        assign a=4'b1101;
        assign b=4'b0111;
        //13+7
        #500
        assign sign = 1'b1;
        //13-7
        #500
        $finish;
    end
endmodule

module bcdsim;
    reg [3:0] a, b;
    wire [3:0] s, cout;
    bcd_adder bcd(a, b, s, cout);
    initial a = 4'b0101; //BCD 5
    initial b = 4'b0001; //BCD 1
    // 5+1 = 6
    initial begin
        #500
        assign a=4'b1001; //BCD 9
        assign b=4'b0101; //BCD 5
        // 9+5 = 14
        #500
        assign a=4'b0111; //BCD 7
        assign b=4'b0011; //BCD 3
        // 7+3 = 10
        #500
        $finish;
    end
endmodule