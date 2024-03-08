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


module tb_dmux;
    // Set inputs and outputs
    reg [19:0] I;
    reg [3:0] sel;
    wire [19:0] o0;
    wire [19:0] o1;
    wire [19:0] o2;
    wire [19:0] o3;
    wire [19:0] o4;
    wire [19:0] o5;
    wire [19:0] o6;
    wire [19:0] o7;
    wire [19:0] o8;
    wire [19:0] o9;
    wire [19:0] o10;
    wire [19:0] o11;
    wire [19:0] o12;
    wire [19:0] o13;
    wire [19:0] o14;
    wire [19:0] o15;
    

    integer i;
    integer MAX_ITERS = 25;
    integer SEED = 10531;

    // Instantiate the dmux
    dmux x0 (
        .I (I),
        .sel (sel),
        .o0 (o0),
        .o1 (o1),
        .o2 (o2),
        .o3 (o3),
        .o4 (o4),
        .o5 (o5),
        .o6 (o6),
        .o7 (o7),
        .o8 (o8),
        .o9 (o9),
        .o10 (o10),
        .o11 (o11),
        .o12 (o12),
        .o13 (o13),
        .o14 (o14),
        .o15 (o15)
    );

    initial begin
        $dumpfile("testbench_dmux.vcd");
        $dumpvars(1,x0);
        $monitor ("I: 0b%0b - sel: 0b%0b - o0: 0b%0b - o1: 0b%0b - o2: 0b%0b - o3: 0b%0b - o4: 0b%0b - o5: 0b%0b - o6: 0b%0b - o7: 0b%0b - o8: 0b%0b - o9: 0b%0b - o10: 0b%0b - o11: 0b%0b - o12: 0b%0b - o13: 0b%0b - o14: 0b%0b - o15: 0b%0b", I, sel, o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 I <= $urandom(SEED);
                sel <= $urandom(SEED);  
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

module testbench_xor;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] c;
    wire zero;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the XOR
    xor_word x0 (
        .a (a),
        .b (b),
        .c (c),
        .zero (zero)
    );

    initial begin
        a <= 0;
        b <= 0;

        $dumpfile("testbench_xor.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - c: 0b%0b - zero: 0b%0b", a, b, c, zero);

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


module tb_rshift;
    // Set inputs and outputs
    reg [19:0] data_in;
    reg [3:0] amount;
    wire [19:0] out;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the lshift
    shift_right x0 (
        .data_in (data_in),
        .amount (amount),
        .out (out)
    );

    initial begin
        $dumpfile("testbench_lshift.vcd");
        $dumpvars(1,x0);
        $monitor ("data_in: 0b%0b - amount: 0b%0b - out: 0b%0b", data_in, amount, out);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 data_in <= $urandom(SEED);
                amount <= $urandom(SEED);
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


module tb_subtractor;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] out;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the SUB
    sub_word x0 (
        .a (a),
        .b (b),
        .out (out)
    );

    initial begin
        $dumpfile("testbench_subtractor.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - out: 0b%0b", a, b, out);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule