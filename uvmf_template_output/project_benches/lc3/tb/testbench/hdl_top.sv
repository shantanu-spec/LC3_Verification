// //----------------------------------------------------------------------
// // Created with uvmf_gen version 2023.4
// //----------------------------------------------------------------------
// // pragma uvmf custom header begin
// // pragma uvmf custom header end
// //----------------------------------------------------------------------
// //----------------------------------------------------------------------                     
// //               
// // Description: This top level module instantiates all synthesizable
// //    static content.  This and tb_top.sv are the two top level modules
// //    of the simulation.  
// //
// //    This module instantiates the following:
// //        DUT: The Design Under Test
// //        Interfaces:  Signal bundles that contain signals connected to DUT
// //        Driver BFM's: BFM's that actively drive interface signals
// //        Monitor BFM's: BFM's that passively monitor interface signals
// //
// //----------------------------------------------------------------------

// //----------------------------------------------------------------------
// //

// module hdl_top;

// import lc3_parameters_pkg::*;
// import uvmf_base_pkg_hdl::*;

//   // pragma attribute hdl_top partition_module_xrtl                                            
// // pragma uvmf custom clock_generator begin
//   bit clk;
//   // Instantiate a clk driver 
//   // tbx clkgen
//   initial begin
//     clk = 0;
//     #9ns;
//     forever begin
//       clk = ~clk;
//       #5ns;
//     end
//   end
// // pragma uvmf custom clock_generator end

// // pragma uvmf custom reset_generator begin
//   bit rst;
//   // Instantiate a rst driver
//   // tbx clkgen
//   initial begin
//     rst = 1; 
//     #200ns;
//     rst =  0; 
//   end
// // pragma uvmf custom reset_generator end

//   // pragma uvmf custom module_item_additional begin
//    tri [15:0] pc;
//    tri instrmem_rd;
//    tri [15:0] instr_dout;
//    tri [15:0] Data_dout;
//    tri [15:0] DMem_addr;
//    tri  complete_instr;
//    tri  complete_data;
//    tri  DMem_rd;
//    tri [15:0] DMem_din;


//   // pragma uvmf custom module_item_additional end

//   // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
//   // The signal bundle, _if, contains signals to be connected to the DUT.
//   // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
//   // The driver, driver_bfm, drives transactions onto the bus, _if.
//   fetch_in_if  fetch_environment_fetch_agent_in_bus(
//      // pragma uvmf custom fetch_environment_fetch_agent_in_bus_connections begin
//      .clock(clk),
//      .reset(rst),
//      .enable_updatePC(dut.enable_updatePC), 
//      .enable_fetch(dut.enable_fetch), 
//      .taddr(dut.pcout), 
//      .br_taken(dut.br_taken)
//      // pragma uvmf custom fetch_environment_fetch_agent_in_bus_connections end
//      );
//   fetch_out_if  fetch_environment_fetch_agent_out_bus(
//      // pragma uvmf custom fetch_environment_fetch_agent_out_bus_connections begin
//      .clock(clk), 
//      .reset(rst), 
//      .pc(dut.pc), 
//      .npc(dut.npc_out_fetch),
//      .instrmem_rd(dut.instrmem_rd)
//      // pragma uvmf custom fetch_environment_fetch_agent_out_bus_connections end
//      );
//   decode_in_if  decode_environment_decode_agent_in_bus(
//      // pragma uvmf custom decode_environment_decode_agent_in_bus_connections begin
//      .clock(clk), 
//      .reset(rst), 
//      .enable_decode(dut.enable_decode), 
//      .instr_dout(dut.Instr_dout),
//      .npc_in(dut.npc_out_fetch)
//      // pragma uvmf custom decode_environment_decode_agent_in_bus_connections end
//      );
//   decode_out_if  decode_environment_decode_agent_out_bus(
//      // pragma uvmf custom decode_environment_decode_agent_out_bus_connections begin
//      .clock(clk), 
//      .reset(rst), 
//      .IR(dut.IR), 
//      .npc_out(dut.npc_out_dec), 
//      .E_Control(dut.E_Control), 
//      .W_Control(dut.W_Control), 
//      .Mem_Control(dut.Mem_Control)
//      // pragma uvmf custom decode_environment_decode_agent_out_bus_connections end
//      );
//   execute_in_if  execute_environment_execute_agent_in_bus(
//      // pragma uvmf custom execute_environment_execute_agent_in_bus_connections begin
//      .clock(clk), 
//      .reset(rst), 
//      .E_Control(dut.E_Control), 
//      .IR(dut.IR), 
//      .npc_in(dut.npc_out_dec), 
//      .bypass_alu_1(dut.bypass_alu_1), 
//      .bypass_alu_2(dut.bypass_alu_2),
//      .bypass_mem_1(dut.bypass_mem_1), 
//      .bypass_mem_2(dut.bypass_mem_2) , 
//      .VSR1(dut.VSR1) , 
//      .VSR2(dut.VSR2) , 
//      .W_Control_in(dut.W_Control) , 
//      .Mem_Control_in(dut.Mem_Control),
//      .enable_execute(dut.enable_execute), 
//      .Mem_Bypass_Val(dut.memout)
//      // pragma uvmf custom execute_environment_execute_agent_in_bus_connections end
//      );
//   execute_out_if  execute_environment_execute_agent_out_bus(
//      // pragma uvmf custom execute_environment_execute_agent_out_bus_connections begin
//      .clock(clk), 
//      .reset(rst) , 
//      .W_Control_out(dut.W_Control_out), 
//      .Mem_Control_out(dut.Mem_Control_out), 
//      .aluout(dut.aluout) , 
//      .pcout(dut.pcout), 
//      .dr(dut.dr),
//      .sr1(dut.sr1), 
//      .sr2(dut.sr2) , 
//      .IR_Exec(dut.IR_Exec), 
//      .NZP(dut.NZP), 
//      .M_Data(dut.M_Data),
//      .enable_execute_out(dut.enable_execute)

//      // pragma uvmf custom execute_environment_execute_agent_out_bus_connections end
//      );
//   writeback_in_if  writeback_environment_writeback_in_agent_bus(
//      // pragma uvmf custom writeback_environment_writeback_in_agent_bus_connections begin
//      .clock(clk), 
//      .reset(rst), 
//      .enable_writeback(dut.enable_writeback), 
//      .aluout(dut.aluout), 
//      .memout(dut.memout), 
//      .sr1(dut.sr1), 
//      .sr2(dut.sr2), 
//      .dr(dut.dr) , 
//      .npc(dut.npc_out_dec), 
//      .pcout(dut.npc_out_dec), 
//      .W_control(dut.W_Control_out)
//      // pragma uvmf custom writeback_environment_writeback_in_agent_bus_connections end
//      );
//   writeback_out_if  writeback_environment_writeback_out_agent_bus(
//      // pragma uvmf custom writeback_environment_writeback_out_agent_bus_connections begin
//      .clock(clk), 
//      .reset(rst), 
//      .writeback_en_out(dut.enable_writeback), 
//      .psr(dut.psr), 
//      .VSR1(dut.VSR1), 
//      .VSR2(dut.VSR2)
//      // pragma uvmf custom writeback_environment_writeback_out_agent_bus_connections end
//      );
//   control_in_if  control_environment_control_agent_in_bus(
//      // pragma uvmf custom control_environment_control_agent_in_bus_connections begin
//      .clock(clk), 
//      .reset(rst), 
//      .complete_data(dut.complete_data), 
//      .complete_instr(dut.complete_instr),
//      .IR(dut.IR), 
//      .NZP(dut.NZP), 
//      .psr(dut.psr), 
//      .IR_Exec(dut.IR_Exec), 
//      .IMem_dout(dut.Instr_dout)
//      // pragma uvmf custom control_environment_control_agent_in_bus_connections end
//      );
//   control_out_if  control_environment_control_agent_out_bus(
//      // pragma uvmf custom control_environment_control_agent_out_bus_connections begin
//      .clock(clk), 
//      .reset(rst), 
//      .enable_updatePC(dut.enable_updatePC),
//      .enable_fetch(dut.enable_fetch),
//      .enable_decode(dut.enable_decode),
//      .enable_execute(dut.enable_execute),
//      .enable_writeback(dut.enable_writeback),
//      .br_taken(dut.br_taken),
//      .bypass_alu_1(dut.bypass_alu_1),
//      .bypass_alu_2(dut.bypass_alu_2),
//      .bypass_mem_1(dut.bypass_mem_1),
//      .bypass_mem_2(dut.bypass_mem_2),
//      .mem_state(dut.mem_state)
//      // pragma uvmf custom control_environment_control_agent_out_bus_connections end
//      );
//   memaccess_in_if  memaccess_environment_memaccess_agent_in_bus(
//      // pragma uvmf custom memaccess_environment_memaccess_agent_in_bus_connections begin
//      .clock(clk), 
//      .reset(rst),
//      .mem_state(dut.mem_state),
//      .M_Control(dut.Mem_Control_out),
//      .M_Data(dut.M_Data),
//      .M_addr(dut.pcout),
//      .DMem_dout(dut.Data_dout)
//      // pragma uvmf custom memaccess_environment_memaccess_agent_in_bus_connections end
//      );
//   memaccess_out_if  memaccess_environment_memaccess_agent_out_bus(
//      // pragma uvmf custom memaccess_environment_memaccess_agent_out_bus_connections begin
//      .clock(clk), 
//      .reset(rst),
//      .DMem_addr(dut.Data_addr),
//      .DMem_rd(dut.Data_rd),
//      .DMem_din(dut.Data_din),
//      .memout(dut.memout)
//      // pragma uvmf custom memaccess_environment_memaccess_agent_out_bus_connections end
//      );
//   imem_if  imem_agent_bus(
//      // pragma uvmf custom imem_agent_bus_connections begin
//      .clock(clk), 
//      .reset(rst),
//      .instr_dout(dut.Instr_dout),
//      .complete_instr(dut.complete_instr),
//      .instrmem_rd(dut.instrmem_rd),
//      .PC(dut.pc)
//      // pragma uvmf custom imem_agent_bus_connections end
//      );
//   dmem_if  dmem_agent_bus(
//      // pragma uvmf custom dmem_agent_bus_connections begin
//      .clock(clk), 
//      .reset(rst),
//      .Data_din(dut.Data_din),
//      .Data_addr(dut.Data_addr),
//      .Data_rd(dut.Data_rd),
//      .Data_dout(dut.Data_dout),
//      .complete_data(dut.complete_data)
//      // pragma uvmf custom dmem_agent_bus_connections end
//      );
//   fetch_in_monitor_bfm  fetch_environment_fetch_agent_in_mon_bfm(fetch_environment_fetch_agent_in_bus);
//   fetch_out_monitor_bfm  fetch_environment_fetch_agent_out_mon_bfm(fetch_environment_fetch_agent_out_bus);
//   decode_in_monitor_bfm  decode_environment_decode_agent_in_mon_bfm(decode_environment_decode_agent_in_bus);
//   decode_out_monitor_bfm  decode_environment_decode_agent_out_mon_bfm(decode_environment_decode_agent_out_bus);
//   execute_in_monitor_bfm  execute_environment_execute_agent_in_mon_bfm(execute_environment_execute_agent_in_bus);
//   execute_out_monitor_bfm  execute_environment_execute_agent_out_mon_bfm(execute_environment_execute_agent_out_bus);
//   writeback_in_monitor_bfm  writeback_environment_writeback_in_agent_mon_bfm(writeback_environment_writeback_in_agent_bus);
//   writeback_out_monitor_bfm  writeback_environment_writeback_out_agent_mon_bfm(writeback_environment_writeback_out_agent_bus);
//   control_in_monitor_bfm  control_environment_control_agent_in_mon_bfm(control_environment_control_agent_in_bus);
//   control_out_monitor_bfm  control_environment_control_agent_out_mon_bfm(control_environment_control_agent_out_bus);
//   memaccess_in_monitor_bfm  memaccess_environment_memaccess_agent_in_mon_bfm(memaccess_environment_memaccess_agent_in_bus);
//   memaccess_out_monitor_bfm  memaccess_environment_memaccess_agent_out_mon_bfm(memaccess_environment_memaccess_agent_out_bus);
//   imem_monitor_bfm  imem_agent_mon_bfm(imem_agent_bus);
//   dmem_monitor_bfm  dmem_agent_mon_bfm(dmem_agent_bus);
//   imem_driver_bfm  imem_agent_drv_bfm(imem_agent_bus);
//   dmem_driver_bfm  dmem_agent_drv_bfm(dmem_agent_bus);

//   // pragma uvmf custom dut_instantiation begin
//   // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
//   // Instantiate your DUT here
//   // These DUT's instantiated to show verilog and vhdl instantiation
// //   verilog_dut         dut_verilog(   .clk(clk), .rst(rst), .in_signal(vhdl_to_verilog_signal), .out_signal(verilog_to_vhdl_signal));
// //   vhdl_dut            dut_vhdl   (   .clk(clk), .rst(rst), .in_signal(verilog_to_vhdl_signal), .out_signal(vhdl_to_verilog_signal));
//    LC3 dut(.clock(clk),
//    .reset(rst),
//    .pc(pc),
//    .instrmem_rd(instrmem_rd),
//    .Instr_dout(instr_dout),
//    .Data_addr(DMem_addr),
//    .complete_instr(complete_instr),
//    .complete_data(complete_data),
//    .Data_din(DMem_din),
//    .Data_dout(Data_dout),
//    .Data_rd(DMem_rd));
//   // pragma uvmf custom dut_instantiation end

//   initial begin      // tbx vif_binding_block 
//     import uvm_pkg::uvm_config_db;
//     // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
//     // They are placed into the uvm_config_db using the string names defined in the parameters package.
//     // The string names are passed to the agent configurations by test_top through the top level configuration.
//     // They are retrieved by the agents configuration class for use by the agent.
//     uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_environment_fetch_agent_in_BFM , fetch_environment_fetch_agent_in_mon_bfm ); 
//     uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_environment_fetch_agent_out_BFM , fetch_environment_fetch_agent_out_mon_bfm ); 
//     uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_environment_decode_agent_in_BFM , decode_environment_decode_agent_in_mon_bfm ); 
//     uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_environment_decode_agent_out_BFM , decode_environment_decode_agent_out_mon_bfm ); 
//     uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_environment_execute_agent_in_BFM , execute_environment_execute_agent_in_mon_bfm ); 
//     uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_environment_execute_agent_out_BFM , execute_environment_execute_agent_out_mon_bfm ); 
//     uvm_config_db #( virtual writeback_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_environment_writeback_in_agent_BFM , writeback_environment_writeback_in_agent_mon_bfm ); 
//     uvm_config_db #( virtual writeback_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_environment_writeback_out_agent_BFM , writeback_environment_writeback_out_agent_mon_bfm ); 
//     uvm_config_db #( virtual control_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_environment_control_agent_in_BFM , control_environment_control_agent_in_mon_bfm ); 
//     uvm_config_db #( virtual control_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_environment_control_agent_out_BFM , control_environment_control_agent_out_mon_bfm ); 
//     uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_environment_memaccess_agent_in_BFM , memaccess_environment_memaccess_agent_in_mon_bfm ); 
//     uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_environment_memaccess_agent_out_BFM , memaccess_environment_memaccess_agent_out_mon_bfm ); 
//     uvm_config_db #( virtual imem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imem_agent_BFM , imem_agent_mon_bfm ); 
//     uvm_config_db #( virtual dmem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmem_agent_BFM , dmem_agent_mon_bfm ); 
//     uvm_config_db #( virtual imem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imem_agent_BFM , imem_agent_drv_bfm  );
//     uvm_config_db #( virtual dmem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmem_agent_BFM , dmem_agent_drv_bfm  );
//   end

// endmodule

// // pragma uvmf custom external begin
// // pragma uvmf custom external end
//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------                     
//               
// Description: This top level module instantiates all synthesizable
//    static content.  This and tb_top.sv are the two top level modules
//    of the simulation.  
//
//    This module instantiates the following:
//        DUT: The Design Under Test
//        Interfaces:  Signal bundles that contain signals connected to DUT
//        Driver BFM's: BFM's that actively drive interface signals
//        Monitor BFM's: BFM's that passively monitor interface signals
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//

module hdl_top;

import lc3_parameters_pkg::*;
import uvmf_base_pkg_hdl::*;

  // pragma attribute hdl_top partition_module_xrtl                                            
// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  // tbx clkgen
  initial begin
    clk = 0;
    #9ns;
    forever begin
      clk = ~clk;
      #5ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit rst;
  // Instantiate a rst driver
  // tbx clkgen
  initial begin
    rst = 1; 
    #200ns;
    rst =  0; 
  end
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
   // tri [15:0] pc;
   // tri instrmem_rd;
   // tri [15:0] instr_dout;
   // tri [15:0] Data_dout;
   // tri [15:0] DMem_addr;
   // tri  complete_instr;
   // tri  complete_data;
   // tri  DMem_rd;
   // tri [15:0] DMem_din;


  // pragma uvmf custom module_item_additional end

  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  fetch_in_if  fetch_environment_fetch_agent_in_bus(
     // pragma uvmf custom fetch_environment_fetch_agent_in_bus_connections begin
     .clock(clk),
     .reset(rst),
     .enable_updatePC(dut.enable_updatePC), 
     .enable_fetch(dut.enable_fetch), 
     .taddr(dut.pcout), 
     .br_taken(dut.br_taken)
     // pragma uvmf custom fetch_environment_fetch_agent_in_bus_connections end
     );

     wire new_instrmem_rd;
  assign new_instrmem_rd = dut.instrmem_rd;
  fetch_out_if  fetch_environment_fetch_agent_out_bus(
     // pragma uvmf custom fetch_environment_fetch_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst), 
     .pc(dut.pc), 
     .npc(dut.npc_out_fetch),
     .instrmem_rd(new_instrmem_rd)
     // pragma uvmf custom fetch_environment_fetch_agent_out_bus_connections end
     );
  decode_in_if  decode_environment_decode_agent_in_bus(
     // pragma uvmf custom decode_environment_decode_agent_in_bus_connections begin
     .clock(clk), 
     .reset(rst), 
     .enable_decode(dut.enable_decode), 
     .instr_dout(dut.Instr_dout),
     .npc_in(dut.npc_out_fetch)
     // pragma uvmf custom decode_environment_decode_agent_in_bus_connections end
     );
  decode_out_if  decode_environment_decode_agent_out_bus(
     // pragma uvmf custom decode_environment_decode_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst), 
     .IR(dut.IR), 
     .npc_out(dut.npc_out_dec), 
     .E_Control(dut.E_Control), 
     .W_Control(dut.W_Control), 
     .Mem_Control(dut.Mem_Control)
     // pragma uvmf custom decode_environment_decode_agent_out_bus_connections end
     );
   writeback_in_if  writeback_environment_writeback_in_agent_bus(
     // pragma uvmf custom writeback_environment_writeback_in_agent_bus_connections begin
     .clock(clk), 
     .reset(rst), 
     .enable_writeback(dut.enable_writeback), 
     .aluout(dut.aluout), 
     .memout(dut.memout), 
     .sr1(dut.sr1), 
     .sr2(dut.sr2), 
     .dr(dut.dr) , 
     .npc(dut.npc_out_dec), 
     .pcout(dut.npc_out_dec), 
     .W_control(dut.W_Control_out)
     // pragma uvmf custom writeback_environment_writeback_in_agent_bus_connections end
     );
  writeback_out_if  writeback_environment_writeback_out_agent_bus(
     // pragma uvmf custom writeback_environment_writeback_out_agent_bus_connections begin
     .clock(clk), 
     .reset(rst), 
     .writeback_en_out(dut.enable_writeback), 
     .psr(dut.psr), 
     .VSR1(dut.VSR1), 
     .VSR2(dut.VSR2)
     // pragma uvmf custom writeback_environment_writeback_out_agent_bus_connections end
     );

  memaccess_in_if  memaccess_environment_memaccess_agent_in_bus(
     // pragma uvmf custom memaccess_environment_memaccess_agent_in_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .mem_state(dut.mem_state),
     .M_Control(dut.Mem_Control_out),
     .M_Data(dut.M_Data),
     .M_addr(dut.pcout),
     .DMem_dout(dut.Data_dout)
     // pragma uvmf custom memaccess_environment_memaccess_agent_in_bus_connections end
     );
  memaccess_out_if  memaccess_environment_memaccess_agent_out_bus(
     // pragma uvmf custom memaccess_environment_memaccess_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .DMem_addr(dut.Data_addr),
     .DMem_rd(dut.Data_rd),
     .DMem_din(dut.Data_din),
     .memout(dut.memout)
     // pragma uvmf custom memaccess_environment_memaccess_agent_out_bus_connections end
     );
  control_in_if  control_environment_control_agent_in_bus(
     // pragma uvmf custom control_environment_control_agent_in_bus_connections begin
     .clock(clk), 
     .reset(rst), 
     .complete_data(dut.complete_data), 
     .complete_instr(dut.complete_instr),
     .IR(dut.IR), 
     .NZP(dut.NZP), 
     .psr(dut.psr), 
     .IR_Exec(dut.IR_Exec), 
     .IMem_dout(dut.Instr_dout)
     // pragma uvmf custom control_environment_control_agent_in_bus_connections end
     );
  control_out_if  control_environment_control_agent_out_bus(
     // pragma uvmf custom control_environment_control_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst), 
     .enable_updatePC(dut.enable_updatePC),
     .enable_fetch(dut.enable_fetch),
     .enable_decode(dut.enable_decode),
     .enable_execute(dut.enable_execute),
     .enable_writeback(dut.enable_writeback),
     .br_taken(dut.br_taken),
     .bypass_alu_1(dut.bypass_alu_1),
     .bypass_alu_2(dut.bypass_alu_2),
     .bypass_mem_1(dut.bypass_mem_1),
     .bypass_mem_2(dut.bypass_mem_2),
     .mem_state(dut.mem_state)
     // pragma uvmf custom control_environment_control_agent_out_bus_connections end
     );
  execute_in_if  execute_environment_execute_agent_in_bus(
     // pragma uvmf custom execute_environment_execute_agent_in_bus_connections begin
     .clock(clk), 
     .reset(rst), 
     .E_Control(dut.E_Control), 
     .IR(dut.IR), 
     .npc_in(dut.npc_out_dec), 
     .bypass_alu_1(dut.bypass_alu_1), 
     .bypass_alu_2(dut.bypass_alu_2),
     .bypass_mem_1(dut.bypass_mem_1), 
     .bypass_mem_2(dut.bypass_mem_2) , 
     .VSR1(dut.VSR1) , 
     .VSR2(dut.VSR2) , 
     .W_Control_in(dut.W_Control) , 
     .Mem_Control_in(dut.Mem_Control),
     .enable_execute(dut.enable_execute), 
     .Mem_Bypass_Val(dut.memout)
     // pragma uvmf custom execute_environment_execute_agent_in_bus_connections end
     );
  execute_out_if  execute_environment_execute_agent_out_bus(
     // pragma uvmf custom execute_environment_execute_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst) , 
     .W_Control_out(dut.W_Control_out), 
     .Mem_Control_out(dut.Mem_Control_out), 
     .aluout(dut.aluout) , 
     .pcout(dut.pcout), 
     .dr(dut.dr),
     .sr1(dut.sr1), 
     .sr2(dut.sr2) , 
     .IR_Exec(dut.IR_Exec), 
     .NZP(dut.NZP), 
     .M_Data(dut.M_Data),
     .enable_execute_out(dut.enable_execute)

     // pragma uvmf custom execute_environment_execute_agent_out_bus_connections end
     );
  imem_if  imem_agent_bus(
     // pragma uvmf custom imem_agent_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .instr_dout(),
     .complete_instr(),
     .instrmem_rd(),
     .PC()
     // pragma uvmf custom imem_agent_bus_connections end
     );
  dmem_if  dmem_agent_bus(
     // pragma uvmf custom dmem_agent_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .Data_din(),
     .Data_addr(),
     .Data_rd(),
     .Data_dout(),
     .complete_data()
     // pragma uvmf custom dmem_agent_bus_connections end
     );
  fetch_in_monitor_bfm  fetch_environment_fetch_agent_in_mon_bfm(fetch_environment_fetch_agent_in_bus.monitor_port);
  fetch_out_monitor_bfm  fetch_environment_fetch_agent_out_mon_bfm(fetch_environment_fetch_agent_out_bus.monitor_port);
  decode_in_monitor_bfm  decode_environment_decode_agent_in_mon_bfm(decode_environment_decode_agent_in_bus.monitor_port);
  decode_out_monitor_bfm  decode_environment_decode_agent_out_mon_bfm(decode_environment_decode_agent_out_bus.monitor_port);
  writeback_in_monitor_bfm  writeback_environment_writeback_in_agent_mon_bfm(writeback_environment_writeback_in_agent_bus.monitor_port);
  writeback_out_monitor_bfm  writeback_environment_writeback_out_agent_mon_bfm(writeback_environment_writeback_out_agent_bus.monitor_port);
  memaccess_in_monitor_bfm  memaccess_environment_memaccess_agent_in_mon_bfm(memaccess_environment_memaccess_agent_in_bus.monitor_port);
  memaccess_out_monitor_bfm  memaccess_environment_memaccess_agent_out_mon_bfm(memaccess_environment_memaccess_agent_out_bus.monitor_port);
  control_in_monitor_bfm  control_environment_control_agent_in_mon_bfm(control_environment_control_agent_in_bus.monitor_port);
  control_out_monitor_bfm  control_environment_control_agent_out_mon_bfm(control_environment_control_agent_out_bus.monitor_port);
  execute_in_monitor_bfm  execute_environment_execute_agent_in_mon_bfm(execute_environment_execute_agent_in_bus.monitor_port);
  execute_out_monitor_bfm  execute_environment_execute_agent_out_mon_bfm(execute_environment_execute_agent_out_bus.monitor_port);

  
  imem_monitor_bfm  imem_agent_mon_bfm(imem_agent_bus.monitor_port);
  dmem_monitor_bfm  dmem_agent_mon_bfm(dmem_agent_bus.monitor_port);
  imem_driver_bfm  imem_agent_drv_bfm(imem_agent_bus.responder_port);
  dmem_driver_bfm  dmem_agent_drv_bfm(dmem_agent_bus.responder_port);

  // pragma uvmf custom dut_instantiation begin
  // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
  // Instantiate your DUT here
  // These DUT's instantiated to show verilog and vhdl instantiation
//   verilog_dut         dut_verilog(   .clk(clk), .rst(rst), .in_signal(vhdl_to_verilog_signal), .out_signal(verilog_to_vhdl_signal));
//   vhdl_dut            dut_vhdl   (   .clk(clk), .rst(rst), .in_signal(verilog_to_vhdl_signal), .out_signal(vhdl_to_verilog_signal));
   LC3 dut(.clock(clk),
   .reset(rst),
   .pc(imem_agent_bus.PC),
   .instrmem_rd(imem_agent_bus.instrmem_rd),
   .Instr_dout(imem_agent_bus.instr_dout),
   .Data_addr(dmem_agent_bus.Data_addr),
   .complete_instr(imem_agent_bus.complete_instr),
   .complete_data(dmem_agent_bus.complete_data),
   .Data_din(dmem_agent_bus.Data_din),
   .Data_dout(dmem_agent_bus.Data_dout),
   .Data_rd(dmem_agent_bus.Data_rd));
  // pragma uvmf custom dut_instantiation end

  initial begin      // tbx vif_binding_block 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_environment_fetch_agent_in_BFM , fetch_environment_fetch_agent_in_mon_bfm ); 
    uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_environment_fetch_agent_out_BFM , fetch_environment_fetch_agent_out_mon_bfm ); 
    uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_environment_decode_agent_in_BFM , decode_environment_decode_agent_in_mon_bfm ); 
    uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_environment_decode_agent_out_BFM , decode_environment_decode_agent_out_mon_bfm ); 
    uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_environment_execute_agent_in_BFM , execute_environment_execute_agent_in_mon_bfm ); 
    uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_environment_execute_agent_out_BFM , execute_environment_execute_agent_out_mon_bfm ); 
    uvm_config_db #( virtual writeback_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_environment_writeback_in_agent_BFM , writeback_environment_writeback_in_agent_mon_bfm ); 
    uvm_config_db #( virtual writeback_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_environment_writeback_out_agent_BFM , writeback_environment_writeback_out_agent_mon_bfm ); 
    uvm_config_db #( virtual control_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_environment_control_agent_in_BFM , control_environment_control_agent_in_mon_bfm ); 
    uvm_config_db #( virtual control_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_environment_control_agent_out_BFM , control_environment_control_agent_out_mon_bfm ); 
    uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_environment_memaccess_agent_in_BFM , memaccess_environment_memaccess_agent_in_mon_bfm ); 
    uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_environment_memaccess_agent_out_BFM , memaccess_environment_memaccess_agent_out_mon_bfm ); 
    uvm_config_db #( virtual imem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imem_agent_BFM , imem_agent_mon_bfm ); 
    uvm_config_db #( virtual dmem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmem_agent_BFM , dmem_agent_mon_bfm ); 
    uvm_config_db #( virtual imem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imem_agent_BFM , imem_agent_drv_bfm  );
    uvm_config_db #( virtual dmem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmem_agent_BFM , dmem_agent_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end


