`include "alu"
`include "status_register"
module UrCPU (
    input clock,
);

    reg [19:0] general_purpose_register[5:0]; //6 general registers
    reg [19:0] program_segment_registers[5:0]; //6 program segment registers
    reg [19:0] increment_registers[2:0] //3 increment registers
endmodule
