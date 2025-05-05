 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { fetch_environment_fetch_agent_in }
wave add uvm_test_top.environment.fetch_environment.fetch_agent_in.fetch_agent_in_monitor.txn_stream -radix string -tag F0
wave group fetch_environment_fetch_agent_in_bus
wave add -group fetch_environment_fetch_agent_in_bus hdl_top.fetch_environment_fetch_agent_in_bus.* -radix hexadecimal -tag F0
wave group fetch_environment_fetch_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { fetch_environment_fetch_agent_out }
wave add uvm_test_top.environment.fetch_environment.fetch_agent_out.fetch_agent_out_monitor.txn_stream -radix string -tag F0
wave group fetch_environment_fetch_agent_out_bus
wave add -group fetch_environment_fetch_agent_out_bus hdl_top.fetch_environment_fetch_agent_out_bus.* -radix hexadecimal -tag F0
wave group fetch_environment_fetch_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_environment_decode_agent_in }
wave add uvm_test_top.environment.decode_environment.decode_agent_in.decode_agent_in_monitor.txn_stream -radix string -tag F0
wave group decode_environment_decode_agent_in_bus
wave add -group decode_environment_decode_agent_in_bus hdl_top.decode_environment_decode_agent_in_bus.* -radix hexadecimal -tag F0
wave group decode_environment_decode_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_environment_decode_agent_out }
wave add uvm_test_top.environment.decode_environment.decode_agent_out.decode_agent_out_monitor.txn_stream -radix string -tag F0
wave group decode_environment_decode_agent_out_bus
wave add -group decode_environment_decode_agent_out_bus hdl_top.decode_environment_decode_agent_out_bus.* -radix hexadecimal -tag F0
wave group decode_environment_decode_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_environment_execute_agent_in }
wave add uvm_test_top.environment.execute_environment.execute_agent_in.execute_agent_in_monitor.txn_stream -radix string -tag F0
wave group execute_environment_execute_agent_in_bus
wave add -group execute_environment_execute_agent_in_bus hdl_top.execute_environment_execute_agent_in_bus.* -radix hexadecimal -tag F0
wave group execute_environment_execute_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_environment_execute_agent_out }
wave add uvm_test_top.environment.execute_environment.execute_agent_out.execute_agent_out_monitor.txn_stream -radix string -tag F0
wave group execute_environment_execute_agent_out_bus
wave add -group execute_environment_execute_agent_out_bus hdl_top.execute_environment_execute_agent_out_bus.* -radix hexadecimal -tag F0
wave group execute_environment_execute_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_environment_writeback_in_agent }
wave add uvm_test_top.environment.writeback_environment.writeback_in_agent.writeback_in_agent_monitor.txn_stream -radix string -tag F0
wave group writeback_environment_writeback_in_agent_bus
wave add -group writeback_environment_writeback_in_agent_bus hdl_top.writeback_environment_writeback_in_agent_bus.* -radix hexadecimal -tag F0
wave group writeback_environment_writeback_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_environment_writeback_out_agent }
wave add uvm_test_top.environment.writeback_environment.writeback_out_agent.writeback_out_agent_monitor.txn_stream -radix string -tag F0
wave group writeback_environment_writeback_out_agent_bus
wave add -group writeback_environment_writeback_out_agent_bus hdl_top.writeback_environment_writeback_out_agent_bus.* -radix hexadecimal -tag F0
wave group writeback_environment_writeback_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_environment_control_agent_in }
wave add uvm_test_top.environment.control_environment.control_agent_in.control_agent_in_monitor.txn_stream -radix string -tag F0
wave group control_environment_control_agent_in_bus
wave add -group control_environment_control_agent_in_bus hdl_top.control_environment_control_agent_in_bus.* -radix hexadecimal -tag F0
wave group control_environment_control_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_environment_control_agent_out }
wave add uvm_test_top.environment.control_environment.control_agent_out.control_agent_out_monitor.txn_stream -radix string -tag F0
wave group control_environment_control_agent_out_bus
wave add -group control_environment_control_agent_out_bus hdl_top.control_environment_control_agent_out_bus.* -radix hexadecimal -tag F0
wave group control_environment_control_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_environment_memaccess_agent_in }
wave add uvm_test_top.environment.memaccess_environment.memaccess_agent_in.memaccess_agent_in_monitor.txn_stream -radix string -tag F0
wave group memaccess_environment_memaccess_agent_in_bus
wave add -group memaccess_environment_memaccess_agent_in_bus hdl_top.memaccess_environment_memaccess_agent_in_bus.* -radix hexadecimal -tag F0
wave group memaccess_environment_memaccess_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_environment_memaccess_agent_out }
wave add uvm_test_top.environment.memaccess_environment.memaccess_agent_out.memaccess_agent_out_monitor.txn_stream -radix string -tag F0
wave group memaccess_environment_memaccess_agent_out_bus
wave add -group memaccess_environment_memaccess_agent_out_bus hdl_top.memaccess_environment_memaccess_agent_out_bus.* -radix hexadecimal -tag F0
wave group memaccess_environment_memaccess_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { imem_agent }
wave add uvm_test_top.environment.imem_agent.imem_agent_monitor.txn_stream -radix string -tag F0
wave group imem_agent_bus
wave add -group imem_agent_bus hdl_top.imem_agent_bus.* -radix hexadecimal -tag F0
wave group imem_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { dmem_agent }
wave add uvm_test_top.environment.dmem_agent.dmem_agent_monitor.txn_stream -radix string -tag F0
wave group dmem_agent_bus
wave add -group dmem_agent_bus hdl_top.dmem_agent_bus.* -radix hexadecimal -tag F0
wave group dmem_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

