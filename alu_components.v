module mux (
   input [19:0] a,
   input [19:0] b,
   input sel,
   output reg [19:0] c
   
);

   always @(a or b or sel) begin
      if (sel)
      // sel = 1, output b
        c = b; 
      else
      //sel = 0, output a
        c = a; 
    
   end  

endmodule

module not_word (
   input [19:0] a,
   output reg [19:0] c
   
);

   always @(a) begin
    // not operation on a,b
        c = ~a;
    
   end  

endmodule


module and_word (
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] c
   
);

   always @(a or b) begin
    // and operation on a,b
        c = a & b ;
    
   end  

endmodule

module or_word (
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] c
   
);

   always @(a or b) begin
    // or operation on a,b
        c = a | b ;
    
   end  

endmodule

module shift_left(
    input [19:0] a,
    input [3:0] shift_num,
    output reg [19:0] res
   
);

   always @(a or shift_num) begin
    // perform a basic shift left
        res = a << shift_num; 
    
   end  

endmodule

module shift_right(
    input [19:0] a,
    input [3:0] shift_num,
    output reg [19:0] res
   
);

   always @(a or shift_num) begin
    // perform a basic shift right
        res = a >> shift_num; 
    
   end  

endmodule


module ADDER (

    input [19:0] a,
    input [19:0] b,
    input c_in,
    output reg c_out,
    output reg [19:0] res
   
);

   always @(a or b or c_in) begin
    // add a, b, and carry in
        {c_out,res} = a + b + c_in;
    
   end  

endmodule
