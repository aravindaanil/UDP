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

reg [3:0] ps,ns;
reg [31:0]p;
reg [15:0]q;
reg [15:0]s=0;
reg k=0;

parameter A=4'b0000,B=4'b0001,C=4'b0010,D=4'b0011,E=4'b0100,F=4'b0101,G=4'b0110,H=4'b0111,I=4'b1000;

always@(posedge clk or posedge rst)
 begin
 
  if(rst)
   ps<=I;
   
  
  else
   ps<=ns;
   
 end  
 
 
 
 always@(ps)
  begin
   
    case(ps)
    
     I:
        begin
         
         ns=A;
         s=0;
         k=0;
         
        end 
             
     A:
          begin
         
          p=in[31:0] ;
          ns=B;
          
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
     
             k=1;
        
             if(q==s)
              
               out=1;
               
              else
               
               out=0;
               
           
               
         end 
         
     endcase
     
     
    
    end
    
    always@(in)
  
     begin
     
      if(k==1)
       ps<=I;
       out=0;
    
     end  
      
    

 
    






endmodule
