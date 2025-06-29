module traffic_light_fsm (
    input clk,
    input rst,
    output reg [2:0] light  // [Red Yellow Green]
);

    // State encoding using localparams
    localparam RED    = 2'b00;
    localparam GREEN  = 2'b01;
    localparam YELLOW = 2'b10;

    reg [1:0] state, next_state;
    reg [3:0] counter;

    // State register and counter
    always @(posedge clk) begin
        if (rst) begin
            state <= RED;
            counter <= 0;
        end else begin
            state <= next_state;

            if (counter == 0) begin
                if (state == RED) counter <= 5;
                else if (state == GREEN) counter <= 5;
                else if (state == YELLOW) counter <= 2;
            end else begin
                counter <= counter - 1;
            end
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            RED:    next_state = (counter == 0) ? GREEN : RED;
            GREEN:  next_state = (counter == 0) ? YELLOW : GREEN;
            YELLOW: next_state = (counter == 0) ? RED : YELLOW;
            default: next_state = RED;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            RED:    light = 3'b100;  // Red ON
            GREEN:  light = 3'b001;  // Green ON
            YELLOW: light = 3'b010;  // Yellow ON
            default: light = 3'b000;
        endcase
    end

endmodule
