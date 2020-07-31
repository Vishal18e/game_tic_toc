`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2020 11:16:39
// Design Name: 
// Module Name: Tic_Toc_transition
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


module Tic_Toc_transition(input[8:0] plyr,comp,// Computer and player enable signals 
input no_space,//to detect the space still left in the tic tac toe table.
 plyr_play,comp_play,// these variables are complement of each other at the  start of the game
 // just like tossing in order to find out who is going to mark first.
 // other has to wait.
  reset,// used to reset the game.
  invalid_move, // disable writing when an illegal move is detected
  clk,// used to synchronize the circuit.
output reg[1:0] p1,p2,p3,p4,p5,p6,p7,p8,p9, // used to define the correspoding states of the positions.
output plyr_reg,comp_reg// this variables are created to automatically and systematically advancethe game.
);

reg comp_reg,plyr_reg;// this variables are created to automatically and systematically advancethe game.
initial 
begin
// initilling these variables . 
//these reg values helps to automatically advance enable fro computer to player and vis a vis.
#2 comp_reg<= comp_play;// to avoid running of variables in undetermined states.
#2 plyr_reg<= plyr_play;// to avoid running of variables in undetermined states.
end 

//use of no_space 
// if no_space==1 => no more space left.
// if no_space==0 => place left for marking.

always@(no_space)// once no_space==1 is detected,both computer and player wont be able to mark.
// hence both  becomes zero. 
begin
if(no_space)
begin
comp_reg<=0;
plyr_reg<=0;
end
else
begin
comp_reg<=comp_reg;
plyr_reg<=comp_reg;
end
end
//for the position p1;

always @(posedge clk or posedge reset)// gets triggered at posedge of clock and reset.
 begin
  if(reset) 
   p1 <= 2'b00;// position 1 is assigned 0 state.
  else
   begin
   if(invalid_move==1'b1)
   begin
    p1 <= p1;// keep previous position
    comp_reg<=comp_reg;//we want computer not to lose its eligiblity to mark. 
    plyr_reg<=plyr_reg;//we want player not to lose its eligiblity to mark. 
   end
   else if(comp_reg)// computer is eligible to mark.
   begin
   plyr_reg<=1;//since computer marked and hence player gets the chance to mark then after.
   comp_reg<=0; // now eligibility to mark is reduced to 0 for the computer.
   if(comp[0]==1'b1)// one hot assignment represents that cpmuter wants to mark at position 1.
    p1 <= 2'b10; // store computer data 
   else
    p1 <= p1;// one hot assignment represents that cpmuter don't want to mark at position 1.
    // hence leave it as it is.
   end
   else if (plyr_reg==1'b1)// player is eligible to mark.
   begin
   plyr_reg<=0;//since player marked and hence computer gets the chance to mark then after.
   comp_reg<=1;  
   if(plyr[0]==1'b1) // one hot assignment represents that player wants to mark at position 1.
   p1 <= 2'b01;// store player data 
   else 
   p1 <= p1;// keep previous position
    end
    else
    p1<=p1;// keep previous position
  end 
 end 
 
 
 // same commands go for the position p2,p3,p4,p5,p6,p7,p8,p9.
 //for the position p2;
 
 
 always @(posedge clk or posedge reset)
  begin
   if(reset) 
    p2 <= 2'b00;
   else
    begin
    if(invalid_move==1'b1)
    begin
     p2 <= p2;// keep previous position
     comp_reg<=comp_reg;
     plyr_reg<=plyr_reg;
    end
    else if(comp_reg)
    begin
    plyr_reg<=1;
    comp_reg<=0; 
    if(comp[1]==1'b1)
     p2 <= 2'b10; // store computer data 
    else
     p2 <= p2;
    end
    else if (plyr_reg==1'b1)
    begin
    plyr_reg<=0;
    comp_reg<=1;  
    if(plyr[1]==1'b1) 
    p2 <= 2'b01;// store player data 
    else 
    p2 <= p2;// keep previous position
     end
     else
     p2<=p2;
   end 
  end 
 
 
 
  //for the position p3;
  always @(posedge clk or posedge reset)
   begin
    if(reset) 
     p3 <= 2'b00;
    else
     begin
     if(invalid_move==1'b1)
     begin
      p3 <= p3;// keep previous position
      comp_reg<=comp_reg;
      plyr_reg<=plyr_reg;
     end
     else if(comp_reg)
     begin
     plyr_reg<=1;
     comp_reg<=0; 
     if(comp[2]==1'b1)
      p3 <= 2'b10; // store computer data 
     else
      p3 <= p3;
     end
     else if (plyr_reg==1'b1)
     begin
     plyr_reg<=0;
     comp_reg<=1;  
     if(plyr[2]==1'b1) 
     p3 <= 2'b01;// store player data 
     else 
     p3 <= p3;// keep previous position
      end
      else
      p3<=p3;
    end 
   end 
   
   
 
    
     //for the position p4;
   always @(posedge clk or posedge reset)
    begin
     if(reset) 
      p4 <= 2'b00;
     else
      begin
      if(invalid_move==1'b1)
      begin
       p4 <= p4;// keep previous position
       comp_reg<=comp_reg;
       plyr_reg<=plyr_reg;
      end
      else if(comp_reg)
      begin
      plyr_reg<=1;
      comp_reg<=0; 
      if(comp[3]==1'b1)
       p4 <= 2'b10; // store computer data 
      else
       p4 <= p4;
      end
      else if (plyr_reg==1'b1)
      begin
      plyr_reg<=0;
      comp_reg<=1;  
      if(plyr[3]==1'b1) 
      p4 <= 2'b01;// store player data 
      else 
      p4 <= p4;// keep previous position
       end
       else
       p4<=p4;
     end 
    end   
   
  
     
      //for the position p5;
    always @(posedge clk or posedge reset)
     begin
      if(reset) 
       p5 <= 2'b00;
      else
       begin
       if(invalid_move==1'b1)
       begin
        p5 <= p5;// keep previous position
        comp_reg<=comp_reg;
        plyr_reg<=plyr_reg;
       end
       else if(comp_reg)
       begin
       plyr_reg<=1;
       comp_reg<=0; 
       if(comp[4]==1'b1)
        p5 <= 2'b10; // store computer data 
       else
        p5 <= p5;
       end
       else if (plyr_reg==1'b1)
       begin
       plyr_reg<=0;
       comp_reg<=1;  
       if(plyr[4]==1'b1) 
       p5 <= 2'b01;// store player data 
       else 
       p5 <= p5;// keep previous position
        end
        else
        p5<=p5;
      end 
     end 
     

      
       //for the position p6;
     always @(posedge clk or posedge reset)
      begin
       if(reset) 
        p6 <= 2'b00;
       else
        begin
        if(invalid_move==1'b1)
        begin
         p6 <= p6;// keep previous position
         comp_reg<=comp_reg;
         plyr_reg<=plyr_reg;
        end
        else if(comp_reg)
        begin
        plyr_reg<=1;
        comp_reg<=0; 
        if(comp[5]==1'b1)
         p6 <= 2'b10; // store computer data 
        else
         p6 <= p6;
        end
        else if (plyr_reg==1'b1)
        begin
        plyr_reg<=0;
        comp_reg<=1;  
        if(plyr[5]==1'b1) 
        p6 <= 2'b01;// store player data 
        else 
        p6 <= p6;// keep previous position
         end
         else
         p6<=p6;
       end 
      end      
     
 
       
        //for the position p7;
      always @(posedge clk or posedge reset)
       begin
        if(reset) 
         p7 <= 2'b00;
        else
         begin
         if(invalid_move==1'b1)
         begin
          p7 <= p7;// keep previous position
          comp_reg<=comp_reg;
          plyr_reg<=plyr_reg;
         end
         else if(comp_reg)
         begin
         plyr_reg<=1;
         comp_reg<=0; 
         if(comp[6]==1'b1)
          p7 <= 2'b10; // store computer data 
         else
          p7 <= p7;
         end
         else if (plyr_reg==1'b1)
         begin
         plyr_reg<=0;
         comp_reg<=1;  
         if(plyr[6]==1'b1) 
         p7 <= 2'b01;// store player data 
         else 
         p7 <= p7;// keep previous position
          end
          else
          p7<=p7;
        end 
       end 
       

        
         //for the position p8;
       always @(posedge clk or posedge reset)
        begin
         if(reset) 
          p8 <= 2'b00;
         else
          begin
          if(invalid_move==1'b1)
          begin
           p8 <= p8;// keep previous position
           comp_reg<=comp_reg;
           plyr_reg<=plyr_reg;
          end
          else if(comp_reg)
          begin
          plyr_reg<=1;
          comp_reg<=0; 
          if(comp[7]==1'b1)
           p8 <= 2'b10; // store computer data 
          else
           p8 <= p8;
          end
          else if (plyr_reg==1'b1)
          begin
          plyr_reg<=0;
          comp_reg<=1;  
          if(plyr[7]==1'b1) 
          p8 <= 2'b01;// store player data 
          else 
          p8 <= p8;// keep previous position
           end
           else
           p8<=p8;
         end 
        end 
        
              

          //for the position p9;
        always @(posedge clk or posedge reset)
         begin
          if(reset) 
           p9 <= 2'b00;
          else
           begin
           if(invalid_move==1'b1)
           begin
            p9 <= p9;// keep previous position
            comp_reg<=comp_reg;
            plyr_reg<=plyr_reg;
           end
           else if(comp_reg)
           begin
           plyr_reg<=1;
           comp_reg<=0; 
           if(comp[8]==1'b1)
            p9 <= 2'b10; // store computer data 
           else
            p9 <= p9;
           end
           else if (plyr_reg==1'b1)
           begin
           plyr_reg<=0;
           comp_reg<=1;  
           if(plyr[8]==1'b1) 
           p9 <= 2'b01;// store player data 
           else 
           p9 <= p9;// keep previous position
            end
            else
            p9<=p9;
          end 
         end             
endmodule
