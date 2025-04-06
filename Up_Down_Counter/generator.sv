class generator;
  
  event my_event;
  
  transaction trans;
  
  mailbox grtodr;
  
  function new(mailbox grtodr);
    
    this.grtodr = grtodr;
    
  endfunction
  
  task main();
    
    trans = new();
    
    repeat(50) begin
      
      trans.randomize();
      
      trans.display("[GENERATOR]");
      
      grtodr.put(trans);
      
      @ my_event;
      
    end
    
  endtask
  
endclass
