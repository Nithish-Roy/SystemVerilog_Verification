class monitor;
  
  transaction trans;
  
  virtual counter c_vif_mon;
  
  mailbox montoscr;
  
  function new(mailbox montoscr, virtual counter c_vif_mon);
    
    this.montoscr = montoscr;
    
    this.c_vif_mon = c_vif_mon;
    
  endfunction
  
  
  task main();
    
    trans = new();
    
    repeat(50) begin
      
      @ (posedge c_vif_mon.clk) 
      
      	trans.up_down <= c_vif_mon.up_down;
    
      	trans.rst_n <= c_vif_mon.rst_n;

      	trans.count_ud <= c_vif_mon.count_ud;

      	montoscr.put(trans);
      
      	trans.display("[MONITOR]");
      
    end
    
  endtask
  
endclass
    
