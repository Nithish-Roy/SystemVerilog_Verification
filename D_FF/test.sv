`include "environment.sv"

class test;
  
  virtual flip_flop ff_vif_test;
  
  environment env;
  
  function new(virtual flip_flop ff_vif_test);
    
    this.ff_vif_test = ff_vif_test;
    
    env = new(ff_vif_test);
    
  endfunction
  
  task main;
    
    env.main();
    
  endtask
  
endclass
