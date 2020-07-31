`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2020 17:05:17
// Design Name: 
// Module Name: tic_toc_toe_main
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
// we will take the input plyr_play =1 and comp_play=0 or vise versa.
//output is the 9 positions of the tic toc toe table.
//winner walue decleare the four different states of the game throughout the continuation.
module tic_toc_toe_main(input[3:0] player,computer,//these values can be at max of 8 and min of 0.
input reset,clk,plyr_play,comp_play,output reg[1:0] winner,
output [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9);
 //winner=0 =>draw
 //winner=1 =>player wins
 //winner=2 =>computer wins.
 //winner=3 => game continuing.
 wire [15:0] plyr,comp;// one hot assignment. we raelly don't want it to be 10 to 16.
wire invalid_move;// is 1 when you want to overwrite the slot of tic toc toe.
wire no_space;// is 1 when all the 9 slots of are marked.
wire player_win,computer_win,drawn;
wire plyr_play_out,comp_play_out;//reg variables used in Tic_Toc_transition .

Tic_Toc_transition tic_tic(plyr[8:0],comp[8:0],no_space,plyr_play,comp_play,reset,invalid_move,clk,pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,plyr_play_out,comp_play_out);

result winners(pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,no_space, player_win,computer_win,drawn);

decoding_position Decoding_player(player,plyr_play_out,plyr);
decoding_position Decoding_computer(computer,comp_play_out,comp);

illegal_detector     fault_detect( pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,comp[8:0],plyr[8:0],invalid_move);

no_space_detector  space_detect(pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,no_space);



always@(posedge clk)
begin
if(player_win)
winner =1;// player win the match
else if(computer_win)
winner=2;//computer wins the match.
else if(drawn)
winner=0;// amtch is drawn.
else
winner=3;// match is conituing.
end
endmodule
