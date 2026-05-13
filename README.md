# Hexadecimal to 7-Segment Decoder

## Hardware Specifications

- **Target CPLD/FPGA**: Altera MAX II EPM240 Minimum System Development Board (Specifically EPM240T100C5N).
- **Display Type**: Common Cathode 7-Segment Displays (High = ON, Low = OFF).
- **Programmer**: Altera USB Blaster.

## 🛠 Software Stack & Dependencies Setup

To run the simulation and logic synthesis successfully, everyone needs the following tools installed:

1. **Icarus Verilog (iverilog)**
   - _Core compiler and simulation engine._
   - **CRITICAL WARNING**: During Windows installation, you **MUST** check the box that says **"Add executable folder(s) to the user PATH"**. Without this, the Digital GUI won't be able to find the compiler.
   - **VERSION NOTE**: Please install **v11**. _Do not_ install the newer v12, as it possesses a known VPI bug that causes a "process terminated unexpectedly" error inside Digital.
2. **GTKWave**
   - _Used to view `.vcd` waveform files._
   - This installs automatically alongside Icarus Verilog.
3. **Digital (by HNEEMANN)**
   - _Used for graphical circuit simulation._
4. **Intel Quartus Prime Lite (v25.1)**
   - _Used for logic synthesis, pin planning, and flashing the code to the MAX II board._
   - Install via Web Installer or Individual Files.

## Repository Structure

- `hex_decoder.v` : Our primary unified Verilog file containing the top-level module (Structural/Dataflow) and the sub-module (Behavioral modeling with hexadecimal logic case statements).
- `main_simulation.dig` : The Digital workspace file. Integrates `External File` components to visually test Verilog logic with interactive switches and 7-segment display components.
- `tb_hex_decoder.v` : The testbench script used to automate testing and generate the waveform data required for Deliverable 3.

## Simulation Workflows

Below are the two primary simulation workflows to help you verify the logic locally:

### Workflow 1: Visual Simulation via Digital GUI

Use this workflow to test the logic visually with interactive switches.

1. Ensure **Icarus Verilog (v11)** is installed and added to your system PATH.
2. Open `main_simulation.dig` using the Digital tool.
3. Click the green **Play (►)** button in the top toolbar.
4. Toggle the 4-bit `bin_in` switch component to observe and verify the dual 7-segment outputs from `00` through `FF`.

### Workflow 2: Waveform Generation via CLI (Deliverable 3)

Use this workflow to generate waveforms for our project deliverables.
Open the VS Code terminal and follow these steps:

1. **Compile the Verilog code** by running:
   ```bash
   iverilog -o my_sim hex_decoder.v tb_hex_decoder.v
   ```
2. **Run the simulation** (this silently creates `waveform.vcd`):
   ```bash
   vvp my_sim
   ```
3. **Open the waveform viewer**:
   ```bash
   gtkwave waveform.vcd
   ```
4. **Inspect the waveform via GTKWave**:
   - In the top-left pane under "**SST**", click the folder icon next to `tb_hex_decoder`.
   - The signals (`bin_in`, `reset`, `seg_tens`, `seg_ones`) will appear in the lower-left list.
   - Select all signals and click the "**Append**" button at the bottom left to add them to the main window.
   - Click "**Zoom Fit**" (magnifying glass with a dotted square inside) in the top toolbar to display the entire timeline and properly capture your screenshots.
