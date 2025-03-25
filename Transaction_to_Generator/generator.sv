class generator;						//generator class						
  
  transaction trans;					//handle for transaction class
  
  mailbox grtodr;						//mailbox handle
  
  function new(mailbox grtodr);			//mailbox memory allocation
    this.grtodr = grtodr;
  endfunction
  
  task main;
    			
    trans = new();						//creating memory
    repeat(20) begin
      trans.randomize();					//randomize
    trans.display("call from generator");	
      grtodr.put(trans);						//putting values to mailbox
    end
  endtask
endclass

// # KERNEL: call from generator
// # KERNEL: the values of a ,b = -60 = -24
// # KERNEL: call from generator
// # KERNEL: the values of a ,b = -93 = -37
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =  22 =  91
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =  88 = -17
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =-107 = 101
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =-127 = -45
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =-114 =  49
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =  39 = -65
// # KERNEL: call from generator
// # KERNEL: the values of a ,b = -90 = -46
// # KERNEL: call from generator
// # KERNEL: the values of a ,b = -42 = -70
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =  65 = -33
// # KERNEL: call from generator
// # KERNEL: the values of a ,b = -94 =  78
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =  39 =  68
// # KERNEL: call from generator
// # KERNEL: the values of a ,b = 110 = 126
// # KERNEL: call from generator
// # KERNEL: the values of a ,b = 101 =  87
// # KERNEL: call from generator
// # KERNEL: the values of a ,b = 107 =  -8
// # KERNEL: call from generator
// # KERNEL: the values of a ,b = 113 =  41
// # KERNEL: call from generator
// # KERNEL: the values of a ,b = -33 =-122
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =-112 =  30
// # KERNEL: call from generator
// # KERNEL: the values of a ,b =  39 = -54
