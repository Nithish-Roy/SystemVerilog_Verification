class scoreboard;
  
event my_event;
  
  mailbox scrfrommon;
  
  function new(mailbox scrfrommon);
    
    this.scrfrommon = scrfrommon;
    
  endfunction
  
  task main();
    
    transaction trans;
    
    generator gen;
    
    trans = new();
    
//     trans.display("call form scr");
    
    forever begin
    
      repeat(4) begin
    
   	 	scrfrommon.get(trans);
        
        trans.display("call from scoreboard");
    
   	 if(trans.a + trans.b == trans.c)
    
       begin
       
         $display($time," pass");
    
       end
         
      else
        
        begin
      
          $display($time," fail");
    
        end
        
    -> my_event;
    
     end
  
    end
    
  endtask

endclass

      
  
