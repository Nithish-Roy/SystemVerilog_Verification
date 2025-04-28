class transaction #(parameter DATA_WIDTH = 8);
  
  bit rst;
  
  bit w_en;
  
  bit r_en;
  
  rand bit [DATA_WIDTH-1:0] data_in;
  
  bit [DATA_WIDTH-1:0] data_out;
  
  bit full;
  
  bit empty;
  
  function void display(string str);
    
    $write(str);
    
    $display("%t w_en=%b r_en = %b data_in = %0d data_out = %d full = %b empty = %b rst = %b", $time , w_en, r_en, data_in, data_out, full, empty, rst);
    
  endfunction
  
endclass
