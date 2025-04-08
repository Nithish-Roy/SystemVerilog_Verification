class driver;
  
  mailbox grtodr;
  
  transaction trans;
  
  virtual counter c_vif_drv;
  
  function new(virtual counter c_vif_drv, mailbox grtodr);
    
    this.c_vif_drv = c_vif_drv;
    
    this.grtodr = grtodr;
    
  endfunction
  
    task main();
    
    trans = new();
    
      repeat(50) begin
        
      @(posedge c_vif_drv.clk)
      
      grtodr.get(trans);      
    	
      c_vif_drv.up_down <= trans.up_down;
        
//       c_vif_drv.rst_n <= trans.rst_n;
      
      trans.display("[DRIVER]");
      
    end
    
  endtask
  

  

  
endclass
