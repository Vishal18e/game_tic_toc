`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2020 16:00:23
// Design Name: 
// Module Name: result
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


module result(input[1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,input no_space,output reg player_win,computer_win,drawn);
//computer marks 10 so if three consecutive computer marks are there so 101010 represents the sequence through which computer wins.
//player marks 01 so if three consecutive players marks are there so 010101 represents the sequence through which player wins.
parameter player =6'b010101,computer=6'b101010;// 
//there are 8 possiblities of winning
// win_chance1=(1,2,3);win_chance2= (4,5,6);win_chance3=(7,8,9); win_chance4=(1,4,7);
//win_chance5= (2,5,8);win_chance6=(3,6,9);win_chance7= (1,5,9);win_chance8=(3,5,7).
//we are trying to create all possible combinations of positions of the tic toc toe table.
wire [5:0] win_chance1={pos1,pos2,pos3},win_chance2={pos4,pos5,pos6},win_chance3={pos7,pos8,pos9};
wire [5:0] win_chance4={pos1,pos4,pos7}, win_chance5={pos2,pos5,pos8},win_chance6={pos1,pos5,pos9};
wire [5:0] win_chance7={pos1,pos5,pos9},win_chance8={pos3,pos5,pos7};
wire temp1,temp2;// variables to store the values
assign temp1 =(win_chance1==player)|(win_chance2==player)|(win_chance3==player)|(win_chance4==player)|(win_chance5==player)|(win_chance6==player)|(win_chance7==player)|(win_chance8==player);
// temp1 represents players chance of winning.
assign temp2=(win_chance1==computer)|(win_chance2==computer)|(win_chance3==computer)|(win_chance4==computer)|(win_chance5==computer)|(win_chance6==computer)|(win_chance7==computer)|(win_chance8==computer);
// temp2 represents players chance of winning.
always@(*)
begin
if(temp1)
begin//all the possible combinations of winning and drawing of the game.
player_win=1;
computer_win=0;
drawn=0;
end
else if(temp2)
begin
player_win=0;
computer_win=1;
drawn=0;
end
else if(no_space)
begin
player_win=0;
computer_win=0;
drawn=1;
end
else
begin
player_win=0;
computer_win=0;
drawn=0;
end
end
endmodule
