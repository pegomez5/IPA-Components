TESTBENCH=testbench

all:
	iverilog -o $(TESTBENCH).vvp $(TESTBENCH).v
	vvp $(TESTBENCH).vvp -vcd
	gtkwave $(TESTBENCH).vcd

clean:
	rm -f *.vcd *.vvp