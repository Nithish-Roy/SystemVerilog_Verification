// `include "transaction.sv"

class generator;

    event my_event;
  
  mailbox gentodrv;
  
  function new (mailbox gentodrv);
    
    this.gentodrv = gentodrv;
    
  endfunction
  
  task main;
      
    transaction trans;
    
    trans = new();
    
    repeat(3) begin
      
      trans.randomize();
      
      trans.display("call from generator");
      
      gentodrv.put(trans);
      
      $display($time,"[generator]a = %0d b = %0d", trans.a, trans.b);
      
//       #1;
      
      @(my_event);
      
    end
    
  endtask
  
endclass
    
    
