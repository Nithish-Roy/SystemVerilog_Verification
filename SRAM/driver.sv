class driver;
  
  transaction tr;
  
  mailbox grtodr;
  
  virtual sr vif_sr_dr;
  
  function new(mailbox grtodr);
    
    this.grtodr = grtodr;
        
  endfunction
  
  task main;
    
    tr = new();
    
    repeat(tr.repeater) begin
    
    grtodr.get(tr);
      
      @(vif_sr_dr.cb_drv);       
      
	    vif_sr_dr.cb_drv.re <= tr.re;
    
  	    vif_sr_dr.cb_drv.we <= tr.we;

        vif_sr_dr.cb_drv.data_in <= tr.data_in;	
      
		vif_sr_dr.cb_drv.addr <= tr.addr;
      	
      	vif_sr_dr.cb_drv.rst <= tr.rst;
              
      tr.display("[DRIVER]");
      
    end
    
  endtask
  
endclass
