class driver;
  
mailbox drfromgr;
  
transaction trans;
  
 virtual adder vinf;
  
  function new(mailbox drvfromgen);
    
    this.drfromgr = drvfromgen;
    
  endfunction

  task main;

    repeat(3) begin

      drfromgr.get(trans);
    
      trans.display("call from driver");
      
      $display($time,"[driver]a = %0d b = %0d", trans.a, trans.b);   
      
      vinf.a = trans.a ;
      
      vinf.b = trans.b ;
     
//       #1;
      
    end
    
  endtask
  
endclass
