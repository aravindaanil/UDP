`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2019 04:45:13 PM
// Design Name: 
// Module Name: UDP_receiver
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


module UDP_receiver(clk,rst,in,out );

input clk,rst;
input [63:0] in;

output reg out=0;

reg [2:0] ps,ns;
reg [31:0]p;
reg [15:0]q;
reg [15:0]s;

parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101,G=3'b110,H=3'b111;

always@(posedge clk or posedge rst)
 begin
 
  if(rst)
   ps<=A;
   
  
  else
   ps<=ns;
   
 end  
 
 
 always@(ps)
  begin
   
    case(ps)
    
     A: begin
         
          p=in[31:0] ;
          ns=B;
          s=0;
          
        end   
        
        
     B: begin
                 
                  q=in[15:0] ;
                  ns=C;
                  
                end   
   
     C: begin
                         
                 s=s+in[15:0] ;
                 ns=D;
                        
              end   
              
     D: begin
              
                s=s+in[31:16];
                ns=E;
              
              end
              
     E: begin
             
               s=s+in[47:32];
               ns=F;
               
              end
           
     F: begin
      
               s=s+in[63:48];
               ns=G;
              
              end
     G: begin
       
              s=~s;
              ns=H;
              
              end
              
     H: begin
        
             if(q==s)
              
               out=1;
               
              else
               
               out=0;
         end
         
     endcase
     
     
    
    end
    

 
    


 always@(in)
 
 begin
  
   ns=A;
   p=0;
   q=0;
   out=0;
end



endmodule
