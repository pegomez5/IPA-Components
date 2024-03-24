module MRR (
    input clock,
    input [19:0] Ro,
    input [19:0] Rd,
    input [19:0] data_in,
    output reg [19:0] data_out
);

always @(posedge clock) begin
    //more contents stored in register Ro into register Rd
    data_out[Rd] <= data_in[Ro];
end
endmodule

module LDC (
    input clock,
    input [19:0] R, //register R
    input  [19:0] C, //constant C
    output [19:0] data_out

);
    
    always @(posedge clock) begin
        //load numerical constant C directly into register R.
        data_out[R] <= C;
    end
endmodule

module LDD (
    input clock,
    input [19:0] Rd,
    input [19:0] Ro,
    input [19:0] mem_address,
    input [19:0] [19:0]data_in,
    output reg [19:0] data_out
);

always @(posedge clock) begin
    //load data contained in the origin address contained in Ro to destination register Rd.
    data_out[Rd] <= data_in [Ro][mem_address];
end
    
endmodule

module STD (
    input clock,
    input [19:0] Rd,
    input [19:0] Ro,
    input [19:0] mem_address,
    input [19:0] data_in,
    output reg [19:0] [19:0] data_out

);

always @(posedge clock) begin
    //store data contained in Ro to the destination in address Rd
    data_out[Rd][mem_address] <= data_in[Ro];
end

endmodule