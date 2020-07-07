`timescale 1ns / 1ps
module two_bit_counter(
    clk, rst, out
  );
  input clk, rst;
  output[1:0] out;
  reg[1:0] out;
  
  initial out = 2'b00;
  always @(posedge clk) begin
    if(rst) begin
      out <= 2'b00;
    end
    else begin
      out <= out + 1;
    end
  end  
endmodule
module decade_counter(
    clk, rst, out
  );
  input clk, rst;
  output[3:0] out;
  reg[3:0] out;
  
  initial out = 4'b0000;
  always @(posedge clk) begin
    if(rst) begin
      out <= 4'b0000;
    end
    else if(out >= 4'b1001) begin
      out <= 4'b0000;
    end
    else begin
      out <= out + 1;
    end
  end  
endmodule
module bcd_to_2421(
    in, out
  );
  input[3:0] in;
  output[3:0] out;
  
  assign out[3] = in[3]|(in[2]&in[0])|(in[2]&in[1]);
  assign out[2] = in[3]|(in[2]&in[1])|(in[2]&~in[0]);
  assign out[1] = (in[2]&~in[1]&in[0])|in[3]|(~in[2]&in[1]);
  assign out[0] = in[0];
endmodule

module code2421_counter(
    clk, rst, out
  );
  input clk, rst;
  output[3:0] out;
  
  wire[3:0] connecter;
  
  decade_counter dc(
    .clk(clk), 
    .rst(rst),
    .out(connecter)
  );
  
  bcd_to_2421 bt2(
    .in(connecter),
    .out(out)
  );
    
endmodule