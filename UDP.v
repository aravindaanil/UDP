`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 12:32:35 PM
// Design Name: 
// Module Name: samp1
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


module UDP(a,b,c,d,out,clk,rst );

parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101,G=3'b110,add1=16'b1010,des1=16'b0011,len=16'h0040;
input [15:0] a,b,c,d;
input rst,clk;
output reg[63:0] out=0;



reg [15:0] s=0;


reg [2:0] ps,ns;

always@(posedge clk)
begin

if(rst)
 ps<=A;

else
 ps<=ns;
 
end 

always@(ps)
begin

case(ps)



A : begin
    s=s+a;
  //  s=s+p;
    ns=B;
   end

B : begin
    {s}=s+b;
  //  s=s+p;
    ns=C;
   end

C :  begin
    {s}=s+c;
  //  s=s+p;
    ns=D;
   end

D : begin
    {s}=s+d;
  //  s=s+p;
   
    ns=E;
   end

E : begin
      
     s=~s; 
     out={add1,des1};
     ns=F;
    
    end 
      
 F : begin
          
      out={len,s};
      ns=G;
        
     end 
     
 G : begin
      
      out={d,c,b,a};  
      s=0;
      
        
   
     end

endcase

end



always@(a or b or c or d)
begin
 ns=A;
 s=0;
end

endmodule
