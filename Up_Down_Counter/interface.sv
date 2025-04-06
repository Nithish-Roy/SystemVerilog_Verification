interface counter #(parameter N = 4);
  
  logic clk;
  
  logic rst_n;
  
  logic up_down;
  
  logic [N-1:0] count_ud;
  
endinterface
