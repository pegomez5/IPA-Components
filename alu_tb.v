`include "alu_components.v"

`default_nettype none

module tb_mux;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    reg  sel;
    wire [19:0] c;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the MUX
    mux x0 (
        .a (a),
        .b (b),
        .sel (sel),
        .c (c)
        
    );

    initial begin
        a <= 0;
        b <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - sel: 0b%0b - 0: 0b%0b", a, b, sel,c);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
                sel <= $urandom(SEED) % 2;
        end
    end

endmodule

module tb_or_word;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] c;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the OR
    or_word x0 (
        .a (a),
        .b (b),
        .c (c)
        
    );

    initial begin
        a <= 0;
        b <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - c: 0b%0b ", a, b,c);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule

module tb_shift_left;
    // Set inputs and outputs
    reg [19:0] a;
    reg  [3:0] shift_num;
    wire [19:0] res;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the SHIFT LEFT
    shift_left x0 (
        .a (a),
        .shift_num (shift_num),
        .res (res)
        
    );

    initial begin
        a <= 0;
        shift_num <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - shift_num: 0b%0b - res: 0b%0b ", a,shift_num,res);
        
        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                shift_num <= $urandom_range(1,5);
        end
        
    end

endmodule

module tb_ADDER;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    reg c_in;
    wire c_out;
    wire [19:0] res;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the ADDER
    ADDER x0 (
        .a (a),
        .b (b),
        .c_in (c_in),
        .c_out (c_out),
        .res (res)
    );

    initial begin
        a <= 0;
        b <= 0;
        c_in <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - c_in: 0b%0b  - c_out: 0b%0b  - res: 0b%0b ", a, b,c_in,c_out,res);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
                c_in <= $urandom(SEED);
        end
    end

endmodule
