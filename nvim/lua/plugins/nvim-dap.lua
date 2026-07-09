return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    dap.adapters.coreclr = {
      type = 'executable',
      command = '/usr/bin/netcoredbg',
      args = { '--interpreter=vscode' }
    }

    -- -- find solution file
    -- local function find_sln()
    --   -- get all .sln and .slnx files
    --   local files = vim.fn.glob("*.sln", false, true)
    --   local slnx = vim.fn.glob("*.slnx", false, true)
    --
    --   vim.list_extend(files, slnx)
    --
    --   if #files == 0 then
    --     return nil
    --   end
    --
    --   -- if only one, just return it
    --   if #files == 1 then
    --     return files[1]
    --   end
    --
    --   -- multiple solutions → let user pick
    --   local choice = vim.fn.inputlist(
    --     vim.list_extend({ "Select solution:" }, files)
    --   )
    --
    --   if choice < 1 or choice > #files then
    --     return nil
    --   end
    --
    --   return files[choice]
    -- end
    --
    -- -- extract projects from .sln
    -- local function get_projects_from_sln(sln)
    --   local projects = {}
    --
    --   for line in io.lines(sln) do
    --     local path = line:match('"(.-%.csproj)"')
    --     if path then
    --       table.insert(projects, path)
    --     end
    --   end
    --
    --   -- 🔥 fallback if nothing found (likely .slnx)
    --   if #projects == 0 then
    --     print("Falling back to scanning for .csproj...")
    --     projects = vim.fn.glob("**/*.csproj", false, true)
    --   end
    --
    --   return projects
    -- end
    --
    -- -- heuristic: prefer non-test project
    -- local function pick_startup_project(projects)
    --   for _, p in ipairs(projects) do
    --     if not p:lower():match("test") then
    --       return p
    --     end
    --   end
    --   return projects[1]
    -- end
    --
    -- -- get TargetFramework(s)
    -- local function get_target_framework(csproj)
    --   for line in io.lines(csproj) do
    --     local tf = line:match("<TargetFramework>(.-)</TargetFramework>")
    --     if tf then return tf end
    --
    --     local tfs = line:match("<TargetFrameworks>(.-)</TargetFrameworks>")
    --     if tfs then return vim.split(tfs, ";")[1] end
    --   end
    -- end
    --
    -- -- get project name
    -- local function get_project_name(csproj)
    --   return vim.fn.fnamemodify(csproj, ":t:r")
    -- end
    --
    -- -- build project
    -- local function build_project(csproj)
    --   vim.notify("Building project...", vim.log.levels.INFO)
    --
    --   local output = vim.fn.systemlist(
    --     "dotnet build " .. vim.fn.shellescape(csproj)
    --   )
    --
    --   local exit = vim.v.shell_error
    --
    --   if exit ~= 0 then
    --     vim.notify("Build failed", vim.log.levels.ERROR)
    --
    --     vim.fn.setqflist({}, "r", {
    --       title = "dotnet build",
    --       lines = output,
    --       efm = table.concat({
    --         "%f(%l\\,%c): %t%*[^:]: %m",
    --         "%f(%l,%c): %t%*[^:]: %m",
    --         "%f:%l:%c: %t%*[^:]: %m",
    --       }, ","),
    --     })
    --
    --     vim.cmd("copen")
    --
    --     print(table.concat(output, "\n"))
    --     error("Build failed")
    --   end
    --
    --   vim.notify("Build succeeded", vim.log.levels.INFO)
    -- end

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

      -- {
      --   type = "coreclr",
      --   name = "Launch (VS-like auto)",
      --   request = "launch",
      --   program = function()
      --     local sln = find_sln()
      --
      --     if not sln then
      --       print("No solution file found")
      --       return vim.fn.input("Path to dll: ", "./bin/Debug/", "file")
      --     end
      --
      --     local projects = get_projects_from_sln(sln)
      --
      --     if not projects or #projects == 0 then
      --       print("No projects found in solution (maybe .slnx unsupported?)")
      --       return vim.fn.input("Path to dll: ", "./bin/Debug/", "file")
      --     end
      --
      --     local csproj = pick_startup_project(projects)
      --
      --     if not csproj then
      --       print("No startup project detected")
      --       return vim.fn.input("Path to dll: ", "./bin/Debug/", "file")
      --     end
      --
      --     local project_dir = vim.fn.fnamemodify(csproj, ":h")
      --     local project_name = get_project_name(csproj)
      --     local framework = get_target_framework(csproj)
      --
      --     if not framework then
      --       return vim.fn.input("Path to dll: ", project_dir .. "/bin/Debug/", "file")
      --     end
      --
      --     -- 🔨 build
      --     build_project(csproj)
      --
      --     local dll = string.format(
      --       "%s/bin/Debug/%s/%s.dll",
      --       project_dir,
      --       framework,
      --       project_name
      --     )
      --
      --     return dll
      --   end,
      -- },
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
