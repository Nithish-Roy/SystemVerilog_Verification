`include "transaction.sv"

`include "generator.sv"

module testbench;
  mailbox generatortodriver = new();				//need a mailbox object with memory
  generator gen = new(generatortodriver);			//need a generator object memory
  initial begin
    gen.main();
  end
endmodule
