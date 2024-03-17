
module TRAP (
   input trap_mode_input,
   input clock,
   input reset,
   output reg trap_mode_output
);

always @(posedge clock or posedge reset) begin
   if(reset) begin
      trap_mode_output <= 0;
   end 
   else begin
      trap_mode_output <= trap_mode_input;
   end
end
endmodule

module NOP (
   input clock,
   input reset,
   output reg res
);
   always @(posedge clock or posedge reset) begin
      if (reset)  begin
         res = 0;
      end
   end

endmodule

module JMP (
   input clock,
   input reset,
   input [19:0] target_address
   output reg pp //program pointer
);

always @(posedge clock or posedge reset) begin
   if(reset) begin
      pp = 0;
   end
   else begin
      pp = target_address; //set program pointer to target address
   end
end  

endmodule

module MUX (
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

module DMUX(
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

module NOT (
   input [19:0] a,
   output reg [19:0] b
   
);

   always @(a) begin
    // not operation on a
        b = ~a;
    
   end  

endmodule


module AND (
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] c
   
);

   always @(a or b) begin
    // and operation on a,b
        c = a & b ;
    
   end  

endmodule


module OR (
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] c
   
);

   always @(a or b) begin
    // or operation on a,b
        c = a | b ;
    
   end  

endmodule

module XOR(
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

module SHFTL(
    input [19:0] a,
    input [3:0] shift_num,
    output reg [19:0] b
   
);

   always @(a or shift_num) begin
    // perform a basic shift left
        b = a << shift_num; 
    
   end  

endmodule

module SHFTR(
    input [19:0] a,
    input [3:0] shift_num,
    output reg [19:0] b
   
);

   always @(a or shift_num) begin
    // perform a basic shift right
        b = a >> shift_num; 
    
   end  

endmodule

module ROTL(
   input [19:0] a,
   output reg [19:0] b
);

always @(a) begin
   b = {a[18:0],a[19]};
end

endmodule

module ROTR(
   input [19:0] a,
   output reg [19:0] b
);

always @(a) begin
   b = {a[0],a[19:1]};
end

endmodule

module SWAP (
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] swap_a,
   output reg [19:0] swap_b
);


   always @(a or b) begin
      swap_a = b;
      swap_b = a;
   end  

endmodule

module INC (
    input [19:0] a,
    output reg [19:0] b
);

    always @(a) begin
        b = a + 1;
    end
    
endmodule

module DEC (
    input [19:0] a,
    output reg [19:0] b
);

    always @(a) begin
        b = a - 1;
    end
    
endmodule

module ADD (

    input [19:0] a,
    input [19:0] b,
    output reg [19:0] c
);

   always @(a or b) begin
    // add a, b no carry
        c = a + b;
    
   end  

endmodule

module ADDC (

    input [19:0] a,
    input [19:0] b,
    input c_in,
    output reg c_out,
    output reg [19:0] c
   
);

   always @(a or b or c_in) begin
    // add a, b, and carry in
        {c_out,c} = a + b + c_in;
    
   end  

endmodule

module SUB(
   input [19:0] a,
   input [19:0] b,
   output reg [19:0] c
);

always @(a or b) begin
   c = a - b;
end
endmodule

module EQ(
   input [19:0] a,
   input [19:0] b,
   output reg zero
);

always @(a or b) begin
   if (a == b)
      zero = 1;
   else
      zero = 0;

end

endmodule

module GT(
   input [19:0] a,
   input [19:0] b,
   output reg sign
);

always @(a or b) begin
   if (a > b)
      sign = 0;
   else
      sign = 1;
end

endmodule

module LT(
   input [19:0] a,
   input [19:0] b,
   output reg sign
);

always @(a or b) begin
   if (a < b)
      sign = 1;
   else
      sign = 0;
end

endmodule

module GET(
   input [19:0] a,
   input [19:0] b,
   output reg sign,
   output reg zero
);

always @(a or b) begin
   if (a >= b) begin
      sign = 0;
      zero = 1;
   end
   else begin
      sign = 1;
      zero = 0;
   end
end

endmodule

module LET(
   input [19:0] a,
   input [19:0] b,
   output reg sign,
   output reg zero
);

always @(a or b) begin
   if (a <= b) begin
      sign = 1;
      zero = 1;
   end
   else begin
      sign = 0;
      zero = 0;
   end
end

endmodule