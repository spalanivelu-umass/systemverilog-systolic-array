# SystemVerilog Systolic Array

This project implements a systolic array for matrix multiplication in SystemVerilog.

Files:

- `mac.sv` - signed multiply-accumulate block
- `pe.sv` - processing element built from one MAC
- `systolic_2x2.sv` - fixed 2x2 reference design
- `systolic_array.sv` - parameterized `N x N` systolic array
- `tb_mac.sv` - MAC testbench
- `tb_systolic_2x2.sv` - 2x2 testbench
- `tb_systolic_array.sv` - parameterized array testbench
- `tb_systolic_consistency.sv` - checks the fixed 2x2 design against `systolic_array` with `N=2`

Design flow:

- activations move left to right
- weights move top to bottom
- each PE stores its own partial sum
- one frame takes `2N - 1` input cycles

Current status:

- MAC module present
- PE module present
- fixed 2x2 array present
- parameterized array present
- self-checking testbenches present
- backpressure and frame-completion checks present

Simulation status already documented in the project:

- `tb_mac.sv` passed
- `tb_systolic_array.sv` passed
- `tb_systolic_consistency.sv` passed

Run notes:

Vivado xsim:

```powershell
cd SystolicAI.sim\sim_1\behav\xsim
cmd /c compile.bat
cmd /c elaborate.bat
cmd /c simulate.bat
```

Icarus Verilog for `tb_mac.sv`:

```powershell
& 'E:\iverilog\bin\iverilog.exe' -g2012 -o tb_mac.vvp `
  SystolicAI.srcs\sources_1\new\mac.sv `
  SystolicAI.srcs\sim_1\new\tb_mac.sv
& 'E:\iverilog\bin\vvp.exe' tb_mac.vvp
```

Limitations:

- no external memory system
- no DMA or tiling
- no AXI-Stream interface
- no synthesis or area study in this repo
