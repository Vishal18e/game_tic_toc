`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2020 15:28:09
// Design Name: 
// Module Name: no_space_detector
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

// this module is created to check if there are still the positions left to mark or not.

module no_space_detector(input[1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,output no_space);
//if no_space = 1=> there are no positions left 
// if no_space=0=>there are still postions left to mark;
wire[8:0] temp;
assign temp[0]= pos1[0]| pos1[1];
assign temp[1]= pos2[0]| pos2[1];
assign temp[2]= pos3[0]| pos3[1];
assign temp[3]= pos4[0]| pos4[1];
assign temp[4]= pos5[0]| pos5[1];
assign temp[5]= pos6[0]| pos6[1];
assign temp[6]= pos7[0]| pos7[1];
assign temp[7]= pos8[0]| pos8[1];
assign temp[8]= pos9[0]| pos9[1];

assign no_space =temp[0] & temp[1] & temp[2] & temp[3] & temp[4] & temp[5] & temp[6] & temp[7] & temp[8];
endmodule
