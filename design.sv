//Name: Haiyi Zhang
//Assignment:Zhang Final Project
//Purpose:Implement the traffic signal controller
//Module Names:Signals

module dff (clk,set, reset,d, q, qn); // D-Flip Flop
  input      clk,set,reset,d; //declare inputs clk, reset and d
  output     q,qn;        //declare outputs q and qn
  reg        q;           //declare q is reg
  assign qn = ~q;		  //assign qn equal not q

  always @(posedge clk or posedge reset)
  begin
    if (reset) begin  // asynchronous reset when reset goes high
      
      q <= 0;    //non-blocking
    end else begin    // assign D to Q on positive clock edge
      
      q <= d;    //non-blcking
    end
  end
endmodule

module Signals(clk,S,SH,SC,set,reset);
  input clk, S,set,reset; // declare input clk, S, set and reset
  output reg SH, SC;      // declare output reg SH and SC
  

  reg Q1, Q0;  //declare reg Q1 and Q0

  
  wire D1,D0,nS,nQ1,nQ0;  //create wires for gates
  not #1(nS,S);    // NOT gate for S
  not #1(nQ1, Q1); // NOT gate for Q1
  not #1(nQ0,Q0);  // NOT gate for Q0
  
  and #2(D1,nQ0,nS);  // and gate for nQ0 and nS
  and #2(D0,nQ1,S);   // and gate for nQ1 and S



  wire nSH,nSC,n1,n2;  //Create wires
  dff t1(.clk(clk),.d(D1),.q(Q1),.qn(nQ1),.set(set),.reset(reset)); //Q1<=D1
  //instantiate clk with clk, d with D1, q with Q1, qn with nQ1, set with set, reset with reset
  dff t2(.clk(clk),.d(D0),.q(Q0),.qn(nQ0),.set(set),.reset(reset)); //Q0<=D0
  //instantiate clk with clk, d with D0, q with Q0, qn with nQ0, set with set, reset with reset
  dff t3(.clk(clk),.d(Q1),.q(SH),.qn(nSH),.set(set),.reset(reset)); //SH<=Q1
  //instantiate clk with clk, d with Q1, q with SH, qn with nSH, set with set, reset with reset
  dff t4(.clk(clk),.d(Q0),.q(SC),.qn(nSC),.set(set),.reset(reset)); //SC<=Q0
  //instantiate clk with clk, d with Q0, q with SC, qn with nSC, set with set, reset with reset
  
endmodule

