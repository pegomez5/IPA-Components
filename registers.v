module general_purpose_registers (
    input [19:0] data1,
    input [19:0] data2,
    input [19:0] data3,
    input [19:0] data4,
    input [19:0] data5,
    input [19:0] data6,
    output reg [19:0] general_purpose_register1,
    output reg [19:0] general_purpose_register2,
    output reg [19:0] general_purpose_register3,
    output reg [19:0] general_purpose_register4,
    output reg [19:0] general_purpose_register5,
    output reg [19:0] general_purpose_register6
);

assign general_purpose_register1 = data1;
assign general_purpose_register2 = data2;
assign general_purpose_register3 = data3;
assign general_purpose_register4 = data4;
assign general_purpose_register5 = data5;
assign general_purpose_register6 = data6;


endmodule

module pointer_registers (
    input [19:0] instruction_segment,
    input [19:0] static_segment,
    input [19:0] dynamic_segment,
    input [19:0] instruction_pointer,
    input [19:0] static_pointer,
    input [19:0] dynamic_pointer,
    output reg [19:0] instruction_segment_register,
    output reg [19:0] static_segment_register,
    output reg [19:0] dynamic_segment_register,
    output reg [19:0] instruction_pointer_register,
    output reg [19:0] static_pointer_register,
    output reg [19:0] dynamic_pointer_register

);
//assign registers their designated values
assign instruction_segment_register = instruction_segment;
assign static_segment_register = static_segment;
assign dynamic_segment_register = dynamic_segment;
assign instruction_pointer_register = instruction_pointer;
assign static_pointer_register = static_pointer;
assign dynamic_pointer_register = dynamic_pointer;

endmodule

module status_register (
    input trap_instruction,
    input memory_access_instruction,
    input zero,
    input sign,
    input overflow,
    input underflow,
    input carry_flag,
    input division_by_zero,
    input half_word_mode,
    input same_register_flag,
    input memory_violation,
    input memory_corruption,
    input trap_mode,
    output reg [19:0]status_register
);
    always @(*) begin
        
        // finish the rest of the outputs
        if (trap_instruction) begin
            trap_mode <= 1;
        end
    end    
        
        
endmodule

module increment_registers (
    ports
);
    
endmodule