class monitor;
  
  mailbox montoscr;
  
  transaction trans;
  
  virtual flip_flop ff_vif_mon;
  
  function new(virtual flip_flop ff_vif_mon ,mailbox montoscr);
    
    this.montoscr = montoscr;
    
    this.ff_vif_mon = ff_vif_mon;
    
  endfunction
  
  task main();
    
    trans = new();
    
    repeat(10) begin
    
      @(posedge ff_vif_mon.clk)
      
      #1;
    
    trans.data <= ff_vif_mon.data;
    
    trans.q <= ff_vif_mon.q;
    
    trans.q_bar <= ff_vif_mon.q_bar;
      
    trans.rst_n <= ff_vif_mon.rst_n;
      
    trans.display("[MONITOR]");
    
    montoscr.put(trans);
      
    end
    
  endtask
  
endclass
