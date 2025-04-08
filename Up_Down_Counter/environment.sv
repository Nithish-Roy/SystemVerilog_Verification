`include "interface.sv"

`include "transaction.sv"

`include "generator.sv"

`include "driver.sv"

`include "monitor.sv"

`include "scoreboard.sv"

class environment;
  
  event my_event;
  
  generator gen;
  
  driver drv;
  
  monitor mon;
  
  scoreboard scr;
  
  mailbox drvtogen;
  
  mailbox montoscr;
  
  virtual counter vif_c_env;
  
  function new(virtual counter vif_c_env);
    
    this.vif_c_env = vif_c_env;
    
      drvtogen = new();
  
  	  montoscr = new();
    
    gen = new(drvtogen);
    
    drv = new(vif_c_env,drvtogen);
    
    mon = new(montoscr, vif_c_env);
    
    scr = new(montoscr);
    
    gen.my_event = my_event;
    
    scr.my_event = my_event;
    
  endfunction
  
    task main();
    
    fork
      
      gen.main();
      
      drv.main();
      
      mon.main();
      
      scr.main();
      
    join
    
  endtask
  
endclass
