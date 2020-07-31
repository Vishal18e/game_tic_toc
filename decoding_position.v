`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2020 15:02:21
// Design Name: 
// Module Name: decoding_position
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// this  module to detect the position that the concerned player wants to mark.
// if temp =1 => wants to mark at position 1.
// if temp =2 => wants to mark at position 2.
// if temp =4 => wants to mark at position 3.
// if temp =8 => wants to mark at position 4.
// if temp =16 => wants to mark at position 5.
// if temp =32 => wants to mark at position 6.
// if temp =64=> wants to mark at position 7.
// if temp =128 => wants to mark at position 8.
// if temp =256 => wants to mark at position 9.
module decoding_position(input[3:0] in,input enable ,output [15:0] position_write);
reg[15:0] temp;
assign position_write=temp?(temp):(0);
always@(*)
begin
case(in)// one hot assignments.
0: temp = 16'd1;
1: temp = 16'd2;
2: temp = 16'd4;
3: temp = 16'd8;
4: temp = 16'd16;
5: temp = 16'd32;
6: temp = 16'd64;
7: temp = 16'd128;
8: temp = 16'd256;
9: temp = 16'd512;// the values onward are worthless.
10: temp = 16'd1024;
11: temp = 16'd2048;
12: temp = 16'd4096;
13: temp = 16'd8192;
14: temp = 16'd16384;
15: temp = 16'd32768;
default: temp=0;
endcase
end
endmodule
