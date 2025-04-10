class transaction;
  
  rand bit re;
  
  rand bit we;
  
  rand bit [7:0] data_in;
  
  randc bit [2:0] addr; 
  
  byte data_out;
  
  bit rst = 1;
  
  integer repeater = 50;
  
//   constraint for_sig { re == !we; }
  
  constraint for_write { re == 0 ; we == 1;}

  constraint for_read { re == 1 ; we == 0;}
  
  constraint for_data_in {data_in == 0;}
  		
  
  
  function void display(string str);
    
    $display($time ,str,"the values are re = %b we = %b data_in = %0d data_out = %0d addr = %0d rst = %b " ,re, we, data_in, data_out, addr,rst);
    
    endfunction
  
  function void write(string str);
    
//     for_sig.constraint_mode(0);
    rst = 0;
    
    for_write.constraint_mode(1);
    
    for_read.constraint_mode(0);
	
    for_data_in.constraint_mode(0);
    
      we.rand_mode(1);
      
      re.rand_mode(1);
      
      data_in.rand_mode(1);
      
      addr.rand_mode(1);
        
    $display("WRITING.....");
    
  endfunction
  
    function void read(string str);
      
      rst = 0;
    
      for_write.constraint_mode(0);
    
      for_read.constraint_mode(1);
      
      for_data_in.constraint_mode(1);
      
      we.rand_mode(1);
      
      re.rand_mode(1);
      
      data_in.rand_mode(1);
      
      addr.rand_mode(1);
          
      $display("READING.....");
    
  endfunction
  
      function void reset_read(string str);
    
      for_write.constraint_mode(0);
    
      for_read.constraint_mode(1);
      
      for_data_in.constraint_mode(1);
      
      we.rand_mode(1);
      
      re.rand_mode(1);
      
      data_in.rand_mode(1);
      
      addr.rand_mode(1);
      
      rst = 1;
    
        $display("RESETING.....    AND   READING.....");
    
  endfunction
  
//   function void reset(string str);
    
//       for_write.constraint_mode(0);

//     for_read.constraint_mode(0);

//     for_data_in.constraint_mode(0);
    
//     rst = 1;
    
//     $display("RESETING...");
    
//   endfunction

    
    
    
endclass
