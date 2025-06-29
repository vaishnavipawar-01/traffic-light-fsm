`timescale 1ns / 1ps

module traffic_light_fsm_tb;

    reg clk;
    reg rst;
    wire [2:0] light;

    // Instantiate the FSM
    traffic_light_fsm uut (
        .clk(clk),
        .rst(rst),
        .light(light)
    );

    // Clock generation: 10ns period (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Dump VCD waveform
        $dumpfile("traffic_light_fsm.vcd");
        $dumpvars(0, traffic_light_fsm_tb);

        // Apply reset
        rst = 1;
        #10;
        rst = 0;

        // Run long enough to observe several cycles
        #200;

        $finish;
    end

    // Monitor state transitions
    initial begin
        $display("Time\tclk\trst\tlight");
        $monitor("%g\t%b\t%b\t%b", $time, clk, rst, light);
    end

endmodule
