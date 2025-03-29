class transaction;
  
  rand bit data;
  
  bit q;
  
  bit q_bar;
  
  bit rst_n;
  
  function void display(string str);
  
    $display($time,str,"data = %b q = %b q_bar = %b",data, q, q_bar);
  
  endfunction

endclass
