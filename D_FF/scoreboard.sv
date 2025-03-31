class scoreboard;
  
  mailbox montoscr;
  
  event my_event;
  
  function new(mailbox montoscr);
    
    this.montoscr = montoscr;
    
  endfunction
  
  task main();
    
    transaction trans;
    
    trans = new();
    
    repeat(10) begin
      
      #10;
      
      montoscr.get(trans);

      trans.display("[SCOREBOARD]");
      
      if((trans.data == trans.q) && ((!trans.q) == trans.q_bar)||((!trans.rst_n) && (!trans.q) && (trans.q_bar))) begin
      
        $display($time,"PASSED");
      
      end
    
    else begin
     
      $display($time,"FAILED");
      
    end
      
    -> my_event;
    
    end
    
  endtask
  
endclass
