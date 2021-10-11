-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/bim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/bim/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/bim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/bim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/bim/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  CamelCaseMotion = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/CamelCaseMotion"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18sl.bufferline\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22sl.dashboard-nvim\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2+\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\16sl.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\0023\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\24sl.indent-blankline\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\2*\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\15sl.lualine\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22sl.nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\2&\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\vsl.lsp\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\2,\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\17sl.nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18sl.treesitter\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/bim/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23sl.symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2,\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\17sl.telescope\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-better-whitespace"] = {
    config = { "\27LJ\2\0028\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\29sl.vim-better-whitespace\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\2/\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\20sl.vim-fugitive\frequire\0" },
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/bim/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2,\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\17sl.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\2,\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\17sl.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\0023\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\24sl.indent-blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: vim-better-whitespace
time([[Config for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\0028\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\29sl.vim-better-whitespace\frequire\0", "config", "vim-better-whitespace")
time([[Config for vim-better-whitespace]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\2*\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\15sl.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23sl.symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\2/\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\20sl.vim-fugitive\frequire\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2+\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\16sl.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22sl.dashboard-nvim\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18sl.bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2-\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\18sl.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22sl.nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\2&\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\vsl.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
