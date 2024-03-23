`include "opcodes.v"

module ControlUnit (
    input clock,
    input instruction_complete,
    output reg instruction_fetch,
    output reg instruction_decode
    output reg instruction_execute,
    output reg memory_access,
    output reg write_back,
    output reg trap_mode
);

reg [2:0] state = FETCH;

always @(posedge clock) begin
    case (state)
        FETCH: begin
            if(instruction_complete) begin
                //change state to DECODE
                state <= DECODE;
            end
        end
        DECODE: begin
            //change state to EXECUTE
            state <= EXECUTE;
        end
        EXECUTE: begin
            //change state to MEMORY ACCESS
            state <= MEMORY_ACCESS;
        end
        MEMORY_ACCESS: begin
            //change state to WRITE_BACK
            state <= WRITE_BACK;
        end
        WRITE_BACK: begin
            //change state back to FETCH
            state <= FETCH;
        end
    endcase
end 
//assign outputs to the state
assign instruction_fetch = (state == FETCH);
assign instruction_decode = (state == DECODE);
assign instruction_execute = (state == EXECUTE);
assign memory_access = (state == MEMORY_ACCESS);
assign write_back = (state == WRITE_BACK);
assign trap_mode = (state == TRAP);

endmodule