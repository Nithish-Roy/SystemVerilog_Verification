`include "test.sv"

module tb;
  
  test tst;
  
  flip_flop ff();
  
  dff DUT(.clk(ff.clk),
          .rst_n(ff.rst_n),
          .data(ff.data),
          .q(ff.q),
          .q_bar(ff.q_bar));
  
  always #5 ff.clk = ~ff.clk;
  
  initial begin
    
    $dumpfile("dump.vcd");
    
    $dumpvars;
    
  end
  
  initial begin
 
    ff.clk = 0;
    
    #5;
    
    ff.rst_n =0;
    
    $display("RESET CONDITON EXECUTED");
    
    #5;
    
    ff.rst_n = 1;

    #200;
    
    $finish;
    
  end
  
  
  initial begin
    
    tst = new(ff);
    
    fork 
   
      tst.main();     
    
    join
    
    #600;
    
    $finish;
    
  end
  
endmodule
