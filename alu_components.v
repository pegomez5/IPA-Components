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
module dmux(
   input [19:0] I,
   input [3:0] sel,
   output reg [19:0] o0,
   output reg [19:0] o1,
   output reg [19:0] o2,
   output reg [19:0] o3,
   output reg [19:0] o4,
   output reg [19:0] o5,
   output reg [19:0] o6,
   output reg [19:0] o7,
   output reg [19:0] o8,
   output reg [19:0] o9,
   output reg [19:0] o10,
   output reg [19:0] o11,
   output reg [19:0] o12,
   output reg [19:0] o13,
   output reg [19:0] o14,
   output reg [19:0] o15
);

always @(*) begin
   o0= 0;
   o1= 0;
   o2= 0;
   o3= 0;
   o4= 0;
   o5= 0;
   o6= 0;
   o7= 0;
   o8= 0;
   o9= 0;
   o10= 0;
   o11= 0;
   o12= 0;
   o13= 0;
   o14= 0;
   o15= 0;
   case(sel)
      4'b0000: o0= I;
      4'b0001: o1= I;
      4'b0010: o2= I;
      4'b0011: o3= I;
      4'b0100: o4= I;
      4'b0101: o5= I;
      4'b0110: o6= I;
      4'b0111: o7= I;
      4'b1000: o8= I;
      4'b1001: o9= I;
      4'b1010: o10= I;
      4'b1011: o11= I;
      4'b1100: o12= I;
      4'b1101: o13= I;
      4'b1110: o14= I;
      4'b1111: o15= I;
   endcase
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

module xor_word(
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] c,
   output reg zero
);

   always @(a or b) begin
        c = a ^ b;
        zero = !(|c);
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

module incrementer (
    input [19:0] a,
    output reg [19:0] b
);

    always @(a) begin
        b = a + 1;
    end
    
endmodule

module swap (
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] swap_a,
   output reg [19:0] swap_b
);


   always @(a, b) begin
      swap_a = b;
      swap_b = a;
   end  

endmodule
module sub_word(
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] out
);

always @(a or b) begin
   out = a-b;
end
endmodule
