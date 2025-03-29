class generator;
  
  transaction trans;
  
  mailbox grtodr;
  
  event my_event;
  
  function new(mailbox grtodr);
    
    this.grtodr = grtodr;
  
  endfunction
  
  task main();
    
    trans = new();
    
    repeat(10)
      
      begin
        
        #1;
    
        trans.randomize();
    
        trans.display("[generator]");
    
        grtodr.put(trans);
  
        @(my_event);
        
    end
  
  endtask
  
endclass
