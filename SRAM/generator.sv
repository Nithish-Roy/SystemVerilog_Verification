class generator;
  
  transaction tr;
  
  mailbox grtodr;
  
  static int count;
  
  event waiting;
  
  function new(mailbox grtodr);
    
    this.grtodr = grtodr;
    
    endfunction
  
  task main ();
    
    tr = new();
    
    repeat(tr.repeater) begin
      
      rw();
      
      void'(tr.randomize());
      
      tr.display("[GENERATOR]");
      
      grtodr.put(tr);
      
      @ waiting;
      
      count++;
      
    end

      endtask

    task rw();
      
//       if(count == 0) begin
        
//         tr.rand_mode(0);
      
//         tr.reset("CALLING RESET FROM GEN");
        
//       end
      
      if( count >= 0 && count <= 7) begin
        
        tr.reset_read("CALLING READ FROM GEN");
        
      end
      
      else if(count >= 8 && count <= 15) begin
        
        tr.write("CALLING WRITE FROM GEN");

      end
      
      else if(count >= 16 && count <= 23) begin
        
      tr.read("CALLING READ FROM GEN");

      end
      
      else if(count == 24)
        
        count = 0;
        
    endtask
        
  
  endclass
