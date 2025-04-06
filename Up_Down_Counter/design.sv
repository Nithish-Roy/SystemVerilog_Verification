module up_counter#(N = 4)(input clk, input rst_n, input up_down, output reg [N-1:0] count_up_down);		//up counter
  
  always@(posedge clk)
    
    begin
      
      if(!rst_n)
        
        count_up_down <= 4'b0000;
      
      else if(up_down)
        
        count_up_down <= count_up_down + 1'b1;
      
      else 
        
        count_up_down <= count_up_down - 1'b1;

    end
  
endmodule



  
