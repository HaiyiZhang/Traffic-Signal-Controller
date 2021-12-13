//Name: Haiyi Zhang
//Assignment:Zhang Final Project
//Purpose:Test Implement of the traffic signal controller
//Module Names:Signals_tb


module Signals_tb;
  wire SH,SC;  // declare outputs SH and SC for test
  reg clk, S,set,reset; // declare inputs clk,S,set and reset for test

  
  initial
    begin
      S=0;clk=0;reset=0; //Q1=1 Q0=0 SH=1 SC=0
    end
  
  always
    #1 clk=!clk; // A clock Signal

  
   always  //code for all the test cases
    begin
      
      #20 S=1;reset=0; //Q1=1 Q0=0 SH=0 SC=1
      #20 S=1;reset=0; //Q1=0 Q0=1 SH=0 SC=1
      #20 S=0;reset=0; //Q1=0 Q0=1 SH=1 SC=0
      
      #20 S=0;reset=1; //Q1=1 Q0=0 SH=0 SC=0
      #20 S=0;reset=0; //Q1=0 Q0=0 SH=0 SC=1
      
      #20 S=0;reset=1; //Q1=0 Q0=1 SH=0 SC=0
      #20 S=1;reset=0; //Q1=0 Q1=0 SH=0 SC=1
      
      #20 S=1;reset=1; //Q1=0 Q0=1 SH=0 SH=0
      #20 S=0;reset=1; //Q1=0 Q0=0 SH=0 SH=0
      #20 S=1;reset=1; //Q1=0 Q0=0 SH=0 SH=0
      
      #20 S=0;reset=0; //Q1=0 Q0=0 SH=1 SH=0
      #20 S=1;reset=1; //Q1=1 Q0=0 SH=0 SH=0
      
      
      


      
    end
  
  Signals t(.clk(clk),.S(S),.SH(SH),.SC(SC),.set(set),.reset(reset));
  //instantiate clk with clk, S with S, SH with SH, SC with SC, set with set, reset with reset
  initial
    begin // Create EPWave
      $dumpfile("test.vcd");
      $dumpvars;
    end
  
  initial
    begin
      $display("S\tSH\tSC"); // code for header row
      $monitor("%d\t%d\t%d",S,SH,SC);  //code for monitor
    end
  
  
  initial //run time
    #260 $finish;

    
endmodule
      
      
      
      