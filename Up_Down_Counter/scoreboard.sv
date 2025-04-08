class scoreboard;
  
  event my_event;
  
  bit [3:0] reference_count;
  
 transaction trans;
  
  mailbox montoscr;
  
  function new(mailbox montoscr);
    
    this.montoscr = montoscr;
    
  endfunction
  
  task main;
    
    trans = new();
    
    forever begin

      montoscr.get(trans);
      
      cal();
      
      trans.display("[SCOREBOARD]");
      
      if((reference_count == trans.count_ud) || (!trans.rst_n))  
        
        $display("PASSED");
        
        else
          
          $display("FAILED");
          
      -> my_event;
      
      $display("------------------------------------------------------------------------------------------");

    end
    
      endtask
  
      task cal();
      
        if(trans.rst_n == 0) begin
        
        reference_count <= 0;

		$display("reset is executed");

          
        end
      
      else if(trans.up_down)
        
        reference_count <= reference_count + 1'b1;
      
      else
        
        reference_count <= reference_count - 1'b1;
        
        $display(reference_count);
        
    endtask

     
      endclass
      
