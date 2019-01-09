module count(q,rst,clk);
input clk;
input rst;
output reg [2:0]q;
integer num=0;


always @ (posedge clk or rst)
begin  
case(num)  
     0: begin
         q<=2; 
         num<=num+1;
        end
     1: begin
          q<=4; 
          num<=num+1;
         end 
     
     2: begin
            q<=6; 
            num<=num+1;
          end
     3: begin
            q<=8; 
            num<=num+1;
           end
     
     4: begin
            q<=1; 
            num<=num+1;
           end 
     
     5: begin
            q<=3; 
            num<=num+1;
          end 
     
     6: begin
            q<=5; 
            num<=num+1;
          end 
     
     7: begin
            q<=7; 
            num<=0;
           end
     
        
    endcase   
    
end
endmodule
        
