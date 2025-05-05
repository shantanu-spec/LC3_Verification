//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This file contains the top level sequence used in register_test.
// It uses the UVM built in register test.  Specific UVM built-in tests can be
// selected in the body task.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class register_test_sequence extends lc3_bench_sequence_base;

  `uvm_object_utils( register_test_sequence );


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "" );
    super.new(name);
  endfunction

  // ****************************************************************************
  virtual task body();

    // Reset the DUT
    fork
      // pragma uvmf custom register_test_reset begin
      // UVMF_CHANGE_ME 
      // Select the desired wait_for_reset or provide custom mechanism.
      // fork-join for this code block may be unnecessary based on your situation.
      fetch_environment_fetch_agent_in_config.wait_for_reset();
      fetch_environment_fetch_agent_out_config.wait_for_reset();
      decode_environment_decode_agent_in_config.wait_for_reset();
      decode_environment_decode_agent_out_config.wait_for_reset();
      execute_environment_execute_agent_in_config.wait_for_reset();
      execute_environment_execute_agent_out_config.wait_for_reset();
      writeback_environment_writeback_in_agent_config.wait_for_reset();
      writeback_environment_writeback_out_agent_config.wait_for_reset();
      control_environment_control_agent_in_config.wait_for_reset();
      control_environment_control_agent_out_config.wait_for_reset();
      memaccess_environment_memaccess_agent_in_config.wait_for_reset();
      memaccess_environment_memaccess_agent_out_config.wait_for_reset();
      imem_agent_config.wait_for_reset();
      dmem_agent_config.wait_for_reset();
      // pragma uvmf custom register_test_reset end
    join

      // pragma uvmf custom register_test_setup begin
      // UVMF_CHANGE_ME perform potentially necessary operations before running the sequence.
      // pragma uvmf custom register_test_setup end

    // pragma uvmf custom register_test_operation begin
    // UVMF_CHANGE_ME Perform your custom register test
    // pragma uvmf custom register_test_operation end

  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

