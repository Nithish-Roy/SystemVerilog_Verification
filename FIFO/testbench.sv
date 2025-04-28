 `include  "interface.sv"

 `include  "transaction.sv"

 `include  "generator.sv"

 `include  "driver.sv"

 `include  "monitor.sv"

`include "scoreboard.sv"


module tb;
  
  generator gen;
  
  driver drv;
  
  monitor mon;
  
  scoreboard scr;
  
  fifo inf_f_tb();
  
  mailbox gentodrv = new();
  
  mailbox montoscr = new();
  
  event all;
  

  
  synchronous_fifo fifo_1(
    .clk(inf_f_tb.clk),
    .rst(inf_f_tb.rst),
    .w_en(inf_f_tb.w_en),
    .r_en(inf_f_tb.r_en),
    .data_in(inf_f_tb.data_in),
    .data_out(inf_f_tb.data_out),
    .full(inf_f_tb.full),
    .empty(inf_f_tb.empty)
);
  
  initial begin
    
    $dumpfile("dump.vcd");
    
    $dumpvars();
    
  end
  
    always #5 inf_f_tb.clk = ~inf_f_tb.clk;

  initial begin
    
    inf_f_tb.clk = 0;
    
    #200;
    
    $finish;
    
  end
    
  
  initial begin
    
    gen = new(gentodrv);
    
    drv = new(gentodrv, inf_f_tb);
    
    mon =  new(montoscr, inf_f_tb);
    
    scr = new(montoscr);
    
    gen.sync	= all;
    
    scr.got	= all;
    
  fork 
    
    gen.main();
    
    drv.main();
    
    mon.main();
    
    scr.main();
    
  join
    
  end
  
endmodule
