class transaction; //transaction class
  rand byte a;				//transaction random variables
  rand byte b;				//transaction random variables
  
   
  function void display (string str);										
    $display(str);
    $display("the values of a ,b =%d =%d", a, b);
  endfunction
endclass
