`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2020 12:26:38
// Design Name: 
// Module Name: illegal_detector
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


module illegal_detector(input[1:0] p1,p2,p3,p4,p5,p6,p7,p8,p9,input[8:0] comp,plyr, output illegal);
//in order to detect the wrong move.
// pi[0]& pi[1] will give me an idea if the position pi was filled initially or not.
//then and it with comp[i] or plyr[i];
wire t_p1,t_p2,t_p3,t_p4,t_p5,t_p6,t_p7,t_p8,t_p9;//pi[0]& pi[1]&plyr[i]
wire t_c1,t_c2,t_c3,t_c4,t_c5,t_c6,t_c7,t_c8,t_c9;//pi[0]& pi[1]& comp[i]
wire t_p,t_c;
// if computer or player had already marked a particular position say pi;
// then pi[1]| pi[0]=1 and if player or computer wants to mark at thet position only  then
// there and will become 1 and hence we will detect the illegal move.

//check where the player did the wrong .
assign t_p1= (p1[0]| p1[1])& plyr[0];
assign t_p2= (p2[0]| p2[1])& plyr[1];
assign t_p3= (p3[0]| p3[1])& plyr[2];
assign t_p4= (p4[0]| p4[1])& plyr[3];
assign t_p5= (p5[0]| p5[1])& plyr[4];
assign t_p6= (p6[0]| p6[1])& plyr[5];
assign t_p7= (p7[0]| p7[1])& plyr[6];
assign t_p8= (p8[0]| p8[1])& plyr[7];
assign t_p9= (p9[0]| p9[1])& plyr[8];


//check where the comp did the wrong .
assign t_p1= (p1[0]| p1[1])& comp[0];
assign t_p2= (p2[0]| p2[1])& comp[1];
assign t_p3= (p3[0]| p3[1])& comp[2];
assign t_p4= (p4[0]| p4[1])& comp[3];
assign t_p5= (p5[0]| p5[1])& comp[4];
assign t_p6= (p6[0]| p6[1])& comp[5];
assign t_p7= (p7[0]| p7[1])& comp[6];
assign t_p8= (p8[0]| p8[1])& comp[7];
assign t_p9= (p9[0]| p9[1])& comp[8];


assign t_p = t_p1|t_p2|t_p3|t_p4|t_p5|t_p6|t_p7|t_p8|t_p9;

assign t_c = t_c1|t_c2|t_c3|t_c4|t_c5|t_c6|t_c7|t_c8|t_c9;

assign illegal= t_p|t_c;

endmodule
