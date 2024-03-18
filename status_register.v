module status_register (
    input clock,
    input trap_instruction,
    output reg zero,
    output reg sign,
    output reg overflow,
    output reg underflow,
    output reg carry_flag
    output reg division_by_zero,
    output reg half_word_mode,
    output reg same_register_flag,
    output reg memory_violation,
    output reg memory_corruption,
    output reg trap_mode
);
    always @(posedge clock) begin
        
        // finish the rest of the outputs

        if (trap_instruction) begin
            trap_mode <= 1;
        end
    end    
        
        
endmodule