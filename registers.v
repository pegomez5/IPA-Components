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
    input zero_flag,
    input sign_flag,
    input overflow_flag,
    input underflow_flag,
    input carry_flag_fw,
    input carry_flag_hwl,
    input carry_flag_hwh,
    input division_by_zero_flag,
    input half_word_mode,
    input same_register_flag,
    input memory_violation_flag,
    input memory_corruption_flag,
    input trap_mode,
    output reg [14:0]status_register
);
    always @(*) begin
        //concatenate flags to be represented
        //in status register
        status_register = {zero_flag,sign_flag,overflow_flag
        ,underflow_flag,carry_flag_fw,carry_flag_hwl
        ,carry_flag_hwh,division_by_zero_flag,half_word_mode
        ,same_register_flag,memory_violation_flag,memory_corruption_flag
        ,trap_mode}
    end    
        
        
endmodule

module increment_registers (
    input clock,
    input instruction_complete, //instruction complete signal
    input memory_access, // signal for accessing memory
    input memory_correction, //signal for memory correction
    output reg [19:0]instruction_count,
    output reg [19:0] memory_access_count,
    output reg [19:0] memory_correction_count
);
    
reg[19:0]  instruction_count_register; 
reg[19:0]  memory_access_register;
reg[19:0] memory_correction_register;
always @(*) begin
    if (instruction_complete) begin
        instruction_count_register <= instruction_count_register + 1;
    end
    if(memory_access): begin
        memory_access_register <= memory_access_register + 1;
    end
    if (memory_correction): begin
        memory_correction_register <= memory_correction_register + 1;
    end
end

assign instruction_count = instruction_count_register;
assign memory_access_count = memory_access_register;
assign memory_correction_count = memory_correction_register;
    
endmodule