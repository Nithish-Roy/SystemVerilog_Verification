class monitor;
  
  mailbox montoscr;
  
  transaction tr;
  
  virtual sr vif_sr_mon;
  
  function new(mailbox montoscr);
    
    this.montoscr = montoscr;
    
  endfunction
  
  task main;
    
    tr = new();
    
    repeat(tr.repeater) begin

	@(vif_sr_mon.cb_mon);       
      
      tr.data_in <= vif_sr_mon.cb_mon.data_in;
      
      tr.data_out <= vif_sr_mon.cb_mon.data_out;
      
      tr.we <= vif_sr_mon.cb_mon.we;
      
      tr.re <= vif_sr_mon.cb_mon.re;
      
      tr.rst <= vif_sr_mon.cb_mon.rst;
      
      tr.addr <= vif_sr_mon.cb_mon.addr;
      
      montoscr.put(tr);
      
      #1;
      
      tr.display("[MONITOR]");
            
    end
    
  endtask
  
endclass
    
