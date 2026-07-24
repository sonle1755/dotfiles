return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    local neotree_command = require("neo-tree.command")

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
      neotree_command.execute({ toggle = true })
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
      neotree_command.execute({ toggle = true })
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
      neotree_command.execute({ toggle = true })
    end
  end
}
