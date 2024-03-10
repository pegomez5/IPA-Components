`include "alu_components.v"

`default_nettype none

module TB_MUX;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    reg  sel;
    wire [19:0] c;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the MUX
    MUX x0 (
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


module TB_DMUX;
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

    // Instantiate the DMUX
    DMUX x0 (
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
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("I: 0b%0b - sel: 0b%0b - o0: 0b%0b - o1: 0b%0b - o2: 0b%0b - o3: 0b%0b - o4: 0b%0b - o5: 0b%0b - o6: 0b%0b - o7: 0b%0b - o8: 0b%0b - o9: 0b%0b - o10: 0b%0b - o11: 0b%0b - o12: 0b%0b - o13: 0b%0b - o14: 0b%0b - o15: 0b%0b", I, sel, o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 I <= $urandom(SEED);
                sel <= $urandom(SEED);  
        end
    end

endmodule

module TB_NOT;
    reg [19:0] a;
    wire [19:0] b;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the NOT
    NOT x0 (
        .a (a),
        .b (b)
        
    );

    initial begin
        a <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b ", a,b);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
              
        end
    end

endmodule

module TB_AND;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] c;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the AND
    AND x0 (
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

module TB_OR;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] c;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the OR
    OR x0 (
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

module TB_XOR;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] c;
    wire zero;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the XOR
    XOR x0 (
        .a (a),
        .b (b),
        .c (c),
        .zero (zero)
    );

    initial begin
        a <= 0;
        b <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - c: 0b%0b - zero: 0b%0b", a, b, c, zero);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule

module TB_SHFTL;
    // Set inputs and outputs
    reg [19:0] a;
    reg  [3:0] shift_num;
    wire [19:0] b;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the SHFTL
    SHFTL x0 (
        .a (a),
        .shift_num (shift_num),
        .b (b)
        
    );

    initial begin
        a <= 0;
        shift_num <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - shift_num: 0b%0b - b: 0b%0b ", a,shift_num,b);
        
        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                shift_num <= $urandom_range(1,5);
        end
        
    end

endmodule


module TB_SHFTR;
    // Set inputs and outputs
    reg [19:0] a;
    reg [3:0] shift_num;
    wire [19:0] b;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the SHFTR
    SHFTR x0 (
        .a (a),
        .shift_num (shift_num),
        .b (b)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - shift_num: 0b%0b - b: 0b%0b", a, shift_num, b);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                shift_num <= $urandom(SEED);
        end
    end

endmodule

module TB_ROTL;
    // Set inputs and outputs
    reg [19:0] a;
    wire [19:0] b;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the ROTL
    ROTL x0 (
        .a (a),
        .b (b)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b", a, b);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
        
        end
    end

endmodule

module TB_ROTR;
    // Set inputs and outputs
    reg [19:0] a;
    wire [19:0] b;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the ROTR
    ROTR x0 (
        .a (a),
        .b (b)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b", a, b);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
            
        end
    end

endmodule

module TB_SWAP;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] swap_a;
    wire [19:0] swap_b;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the SWAP
    SWAP x0 (
        .a (a),
        .b (b),
        .swap_a (swap_a),
        .swap_b (swap_b)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - swap_a: 0b%0b - swap_b: 0b%0b", a, b, swap_a,swap_b);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule

module TB_INC;
    reg [19:0] a;
    wire [19:0] b;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the INC
    INC x0 (
        .a (a),
        .b (b)
        
    );

    initial begin
        a <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b ", a,b);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
              
        end
    end

endmodule

module TB_DEC;
    reg [19:0] a;
    wire [19:0] b;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the DEC
    DEC x0 (
        .a (a),
        .b (b)
        
    );

    initial begin
        a <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b ", a,b);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
              
        end
    end

endmodule

module TB_ADD;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] c;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the SUB
    ADD x0 (
        .a (a),
        .b (b),
        .c (c)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - c: 0b%0b", a, b, c);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule

module TB_ADDC;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    reg c_in;
    wire c_out;
    wire [19:0] c;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the ADDC
    ADDC x0 (
        .a (a),
        .b (b),
        .c_in (c_in),
        .c_out (c_out),
        .c (c)
    );

    initial begin
        a <= 0;
        b <= 0;
        c_in <= 0;

        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - c_in: 0b%0b  - c_out: 0b%0b  - c: 0b%0b ", a, b,c_in,c_out,c);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
                c_in <= $urandom(SEED);
        end
    end

endmodule


module TB_SUB;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire [19:0] c;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the SUB
    SUB x0 (
        .a (a),
        .b (b),
        .c (c)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - c: 0b%0b", a, b, c);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule

module TB_EQ;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire zero;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the EQ
    EQ x0 (
        .a (a),
        .b (b),
        .zero (zero)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - zero: 0b%0b", a, b, zero);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule

module TB_GT;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire sign;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the GT
    GT x0 (
        .a (a),
        .b (b),
        .sign (sign)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - sign: 0b%0b", a, b, sign);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule

module TB_LT;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire sign;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the LT
    LT x0 (
        .a (a),
        .b (b),
        .sign (sign)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - sign: 0b%0b", a, b, sign);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule

module TB_GET;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire sign;
    wire zero;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the EQ
    GET x0 (
        .a (a),
        .b (b),
        .sign (sign),
        .zero (zero)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - sign: 0b%0b - zero: 0b%0b", a, b, sign,zero);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule

module TB_LET;
    // Set inputs and outputs
    reg [19:0] a;
    reg [19:0] b;
    wire sign;
    wire zero;

    integer i;
    integer MAX_ITERS = 10;
    integer SEED = 10531;

    // Instantiate the EQ
    LET x0 (
        .a (a),
        .b (b),
        .sign (sign),
        .zero (zero)
    );

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1,x0);
        $monitor ("a: 0b%0b - b: 0b%0b - sign: 0b%0b - zero: 0b%0b", a, b,sign, zero);

        for (i = 0; i < MAX_ITERS; i++) begin
            #10 a <= $urandom(SEED);
                b <= $urandom(SEED);
        end
    end

endmodule