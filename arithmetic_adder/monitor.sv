class monitor;
  
   virtual adder mon_inf;
  
  	mailbox montoscr;
  
  function new (mailbox montoscr);
    
    this.montoscr = montoscr;
    
  endfunction
  
  task main;
    
    transaction trans;
    
    trans = new();
    
        
    repeat(3) begin
      
      #1;
      
      montoscr.put(trans);
      
      trans.a = mon_inf.a;
      
      trans.b = mon_inf.b;
      
      trans.c = mon_inf.c;
      
      trans.display("call form mon");
      
      $display($time," [monitor]a = %d b= %d c = %d",trans.a, trans.b, trans.c);
         
      #1;
      
    end
        
  endtask
  
endclass
    
    
    
