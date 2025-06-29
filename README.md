# 🚦 Traffic Light Controller FSM (Verilog)

## 📌 Description
A simple 3-state **Traffic Light Controller** implemented as a **Finite State Machine (FSM)** in Verilog.  
The FSM cycles through **RED → GREEN → YELLOW → RED** with defined time durations.

This project demonstrates basic sequential design and FSM concepts, using:
- **RTL module (`traffic_light_fsm.v`)**
- **Testbench (`traffic_light_fsm_tb.v`)**
- **Simulation waveform (`traffic_light_fsm.vcd`)**

---

## 📌 State Machine Details

| State  | Light ON | Duration (Clock Cycles) | Next State |
|--------|----------|--------------------------|-------------|
| RED    | Red      | 5                        | GREEN       |
| GREEN  | Green    | 5                        | YELLOW      |
| YELLOW | Yellow   | 2                        | RED         |

- **Clock:** 10ns period (100MHz)
- **Reset:** Synchronous active high

---

## 📂 Files

- `traffic_light_fsm.v` → RTL FSM module  
- `traffic_light_fsm_tb.v` → Testbench  
- `traffic_light_fsm.vcd` → Simulation waveform dump

---

## ✅ How to Simulate

**Compile:**
```bash
iverilog -o traffic_light_fsm_tb.vvp traffic_light_fsm.v traffic_light_fsm_tb.v
