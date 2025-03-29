module dff( input clk, input rst_n, input data, output reg q, output q_bar);
  
  always @(posedge clk) begin
  
    if(!rst_n)
    
      q <= 1'b0;
  	
    else
    	
      q <= data;
  
  end
  
  assign q_bar = ~q;

endmodule
  
