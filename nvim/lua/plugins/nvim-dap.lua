return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    dap.adapters.coreclr = {
      type = 'executable',
      command = '/usr/bin/netcoredbg',
      args = { '--interpreter=vscode' }
    }
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Launch .NET",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
      },
      {
        type = "coreclr",
        name = "Attach to .NET process",
        request = "attach",
        justMyCode = false,
        processId = function()
          local procs = vim.fn.systemlist("pgrep -af 'dotnet .*dll'")

          local filtered = {}

          for _, line in ipairs(procs) do
            -- keep only actual app runtimes
            if line:match("%.dll") and not line:match("watch") then
              table.insert(filtered, line)
            end
          end

          if #filtered == 0 then
            vim.notify("No runnable .NET apps found", vim.log.levels.ERROR)
            return nil
          end

          local choice = require("dap.utils").pick_process(filtered)

          if not choice then
            return nil
          end

          return tonumber(choice)
        end,
      },
    }

    -- Keymaps
    local opts = { silent = true }

    vim.keymap.set("n", "<F5>", dap.continue, opts)
    vim.keymap.set("n", "<F10>", dap.step_over, opts)
    vim.keymap.set("n", "<F11>", dap.step_into, opts)
    vim.keymap.set("n", "<F12>", dap.step_out, opts)

    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)

    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, opts)

    vim.keymap.set("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, opts)

    vim.keymap.set("n", "<leader>dr", dap.repl.open, opts)

    vim.keymap.set("n", "<leader>dl", dap.run_last, opts)
  end
}
