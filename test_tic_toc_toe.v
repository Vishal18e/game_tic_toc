`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2020 10:19:38
// Design Name: 
// Module Name: test_tic_toc_toe
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

// this is the testbench used to check the modules.
module test_tic_toc_toe();
reg[3:0] player,computer;// here we initiallize the slot that player and computer wants to mark.
// they take the value from 0 to 8.
reg reset,clk,plyr_play,comp_play;// plyr_play if 1 then its the players cance to mark. 
wire[1:0] winner,pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9;//the 9 pos describes the 9 position of tic tac toe.
//module instantiation.
tic_toc_toe_main tik(player,computer,reset,clk,plyr_play,comp_play,winner,pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9);

/*
initial
begin

clk=0;
reset=1;
comp_play=0;
player=0;
computer=0;
plyr_play=1;


#20
reset=0;


#20
plyr_play=1;
computer=1;
player=4;



#20
computer=8;
player=8;

#20
player=3;
computer=3;


#20
player=6;
computer=6;


#20
player=5;
computer=5;

end
*/


initial
begin
// all the values initialled at t=0;
clk=0;
reset=1;
comp_play=0;
player=0;
computer=0;
plyr_play=1;// through this code we wnat that player to mark first. 
//unless and until player is able to mark , computer will not be able to mark. 

#20
reset=0;// now as the posedge of clk comes, it will assign the corresponging slot that the player wants to mark.
// since player was 0 already and hence when the posedge clock comes position 1 will be marked as 1.
// now its computer turn to mark.
//unless and until computer is able to mark , player will not be able to mark.
//computer since was initiallized to 0 so it wants to mark position 1 as 2 but the position 1 was alraedy marked.
//hence invalid_move becomes 1 and computer won't be able to mark position 1.
//so  computer has to wait till other value is assigned to it. 
#20
plyr_play=1;
computer=1;// now computer will mark position 2 as 2.
player=4;//now its player turn to mark.
// and when posedge of clk comes player marks position 5 as 1.
//now again its computer's chance to mark.


#20
computer=8;// now both computer and player wanyts to amrk position 9 , since its computer's chance
// and hence computer will only be able to mark at position 9.
// now it's players chance to mark.
// since player also wants to mark at position 9 and hence invalid_move turns to 1.
player=8;// player has to wait for another slot to be assigned.
//till that no one else would be able to mark. 

#20
player=3;//similarily as before player will only be able to markat position 4.
computer=3;
//now its computer's chance to mark.

#20
player=6;// as before posion 7 will be marked by computer and now player has to mark. 
computer=6;


#20
player=2;// player marks at position 3.
computer=5;// computer marks at position 6.

#20
player=7;// finally player marks position 8.
computer=6;//now no changes .
// now value of no_space=1 and also neither the computer nor the player is the winner.
// Hence its a draw and hence the value of winner would be 0.
end
initial
begin
forever
#5 clk=~clk;
end
endmodule
