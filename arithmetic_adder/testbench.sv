`include "interface.sv"

`include "transaction.sv"

`include "generator.sv"

`include "driver.sv"

`include "monitor.sv"
  
`include "scoreboard.sv"

module testbench;
  
  event trigger;
    
  mailbox gtod  = new();
  
  mailbox mtos  = new();
  
  generator gen = new(gtod);
  
  driver drv = new(gtod);
  
  monitor mon = new(mtos);
  
  scoreboard scr = new(mtos);
  
  adder inf();
  
  adder_module DUT(.a(inf.a),
                   
                   .b(inf.b),
                   
                   .c(inf.c));
  
  initial begin 
     
    fork    
  	
            drv.vinf = inf;
    
  	     mon.mon_inf = inf;
      
    gen.my_event = trigger;
  
    scr.my_event = trigger;
    
     join
    
    #1;
    
    fork 
      
      gen.main;
      
      drv.main;
      
      mon.main;

      scr.main;
      
    join   
      
  end
  
endmodule
  
