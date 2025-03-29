class driver;
  
  transaction trans;
  
  mailbox grtodr;
  
  virtual flip_flop ff_vif;
  
  function new(virtual flip_flop ff_vif,mailbox grtodr);
    
    this.grtodr = grtodr;
   
    this.ff_vif = ff_vif;
    
  endfunction
  
  task main();
    
    trans = new();
    
    fork
    
    repeat(10) begin
      
      #1;
      
      grtodr.get(trans);
      
       @(posedge ff_vif.clk) 
      
      #1;
      
          ff_vif.data <= trans.data;
          
          trans.display("[Driver]");
          
        end
      
    join
      
      endtask
      
      endclass
          
