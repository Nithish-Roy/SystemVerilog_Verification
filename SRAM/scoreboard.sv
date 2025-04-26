class scoreboard;
  
  transaction tr;
  
  mailbox montoscr;
  
  reg [7:0] mem_mimic [7:0];
  
  reg [7:0] data_ref;
  
    event trigger;
  
  function new(mailbox montoscr);
    
    this.montoscr = montoscr;
    
  endfunction
  
  task main();
    
    tr = new();
    
    repeat(tr.repeater) begin
      
      montoscr.get(tr);
     
              
      if(tr.rst) begin
          
         $display("reset is executed");
        
          	data_ref <= 8'b0000_0000;

        for(int i= 0; i < 8; i++) begin
            
            mem_mimic[i] = 8'b0000_0000;
          
            end
        
      end
        
        else if(tr.re && !tr.we) begin
          
          data_ref <= mem_mimic[tr.addr];
          
          $display("data at address %0h = %0h",tr.addr, mem_mimic[tr.addr]);
        
        $display("data is read");
          
        end
        
        else if(tr.we && !tr.re) begin
          
          mem_mimic[tr.addr] <= tr.data_in;
      		
        $display("data is written");
          
        end
      
      scr_logic();
      
       tr.display("[SCR]");

      -> trigger;
      
      
            $display("-------------------------------------------------------------------------------------");

      
    end
    
      endtask
  
  task scr_logic;
    
    if((tr.re && !tr.we) && (data_ref == tr.data_out) && (data_ref != 0) && (tr.data_out != 0)) 	
      begin
        
        $display(" READ PASSED");
      
      end
 
      else if( (tr.rst) && (tr.re && !tr.we) && (data_ref == tr.data_out)) begin
        
        $display(" RESET_READ PASSED");
    
      end
    
    else if(tr.rst && !tr.data_out && !data_ref) begin
 
        $display("RESET PASSED");
      
      end
      
    else if(tr.we)
        
      $display("WRITING......CHECK READ TO VERIFY IF WRITE PASSED");      
    
    else
      
      $display("FAILED");
      
      #1;
    
  endtask
      
      endclass
      
