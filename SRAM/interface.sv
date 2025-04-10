interface sr;
	logic clk;      
	logic rst;     
  	logic [7:0] data_in;
  logic [2:0] addr;  
	logic cs = 1;        
	logic re;       
	logic we;        
 	logic [7:0] data_out; 
  
  clocking cb_drv @(posedge clk);
    
    default output #1;
    
    output rst;
    output data_in;
    output addr;
    output re;
    output we;

  endclocking
  
    
  clocking cb_mon @(posedge clk);
    
    default input #2;
    
    input rst;
    input data_in;
    input addr;
    input re;
    input we;
    input data_out;
    
  endclocking

endinterface
