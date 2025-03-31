`include "interface.sv"

`include "transaction.sv"

`include "generator.sv"

`include "driver.sv"

`include "monitor.sv"

`include "scoreboard.sv"

class environment;
    
  generator gen;
  
  driver drv;
  
  monitor mon;
  
  scoreboard scr;
  
  mailbox drvtogen;
  
  mailbox montoscr;
  
  event my_event;
  
  virtual flip_flop ff_vif_env;
 
  function new(virtual flip_flop ff_vif_env);
    
    this.ff_vif_env = ff_vif_env;
       
    drvtogen = new();
    
    montoscr = new();
    
    gen = new(drvtogen);
    
    drv = new(ff_vif_env,drvtogen);
    
    mon = new(ff_vif_env,montoscr);
    
    scr = new(montoscr);
  
    scr.my_event = my_event;
    
    gen.my_event = my_event;
    
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


