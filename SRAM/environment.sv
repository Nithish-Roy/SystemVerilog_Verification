class environment;
  
  generator gen;
  
  driver drv;
  
  monitor mon;
  
  scoreboard scr;
  
  mailbox grtodr = new();
  
  mailbox montoscr = new();
  
  event all;
  
  virtual sr vif_sr_env;
  
  function new(virtual sr vif_sr_env);

    this.vif_sr_env = vif_sr_env;
    
    gen = new(grtodr);
    
    drv = new(grtodr);
    
    mon = new(montoscr);
    
    scr = new(montoscr);
    
    drv.vif_sr_dr = vif_sr_env;
    
    mon.vif_sr_mon = vif_sr_env;

    gen.waiting = all;
    
    scr.trigger = all;
    
  endfunction
  
  task main ();
    
    fork
      
      gen.main();
      
      drv.main();
      
      mon.main();
      
      scr.main();
      
    join
    
  endtask
  
endclass
