class transaction #(parameter N = 4);
 
  bit rst_n;
  
  rand bit up_down;
  
  bit [N-1:0] count_ud;
  
  constraint for_up_down {up_down dist {1 := 80, 0:= 30};}
  
  function void display(string str);
    
    $display($time,str,"up_down = %b count_ud = %d ", up_down, count_ud);
  	   
  endfunction
  
endclass
