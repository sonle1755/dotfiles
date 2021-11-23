-- local luafmt = require "lt.lsp.servers.efm.formatters.luafmt"
local prettier = require "sl.lsp.formatters.prettier"
local eslint_d = require "sl.lsp.linters.eslint_d"

local languages = {
  --lua = {luafmt},
  typescript = {prettier, eslint_d},
  javascript = {prettier, eslint_d},
  typescriptreact = {prettier, eslint_d},
  ['typescript.tsx'] = {prettier, eslint_d},
  javascriptreact = {prettier, eslint_d},
  ['javascript.jsx'] = {prettier, eslint_d},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
  vue = {prettier}
}

-- local function eslint_config_exists()
--   local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
--   local test = vim.fn.glob("package.json*")

--   functions.tprint(eslintrc)
--   functions.tprint(test)
--   if not vim.tbl_isempty(eslintrc) then
--     return true
--   end
--   -- print (vim.fn.getcwd())
--   -- functions.tprint (lsp.util.root_pattern("package.json", ".git", vim.fn.getcwd()))
--   local r = lsp.util.root_pattern(".eslintrc*")

--   -- print(lsp.util.find_git_root())
--   -- print(lsp.util.find_node_modules_root())
--   -- print(lsp.util.find_package_json_root())
--   functions.tprint (r)

--   print ('no rc found')

--   if vim.fn.filereadable("package.json") then
--     if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
--       return true
--     end
--   end

--   print ('not in json')
--   return false
-- end

return function()
    return {
        root_dir = function()
          --[[ if not eslint_config_exists() then
            print 'eslint configuration not found'
            return nil
          end]]
          -- check if eslint_d installed globally!
          -- return lsp.util.root_pattern("package.json", ".git", vim.fn.getcwd())
          return vim.fn.getcwd()
        end,
        filetypes = vim.tbl_keys(languages),
        init_options = {
          documentFormatting = true
        },
        settings = {
          rootMarkers = { "package.json", ".git" },
          lintDebounce = 500,
          languages = languages
        },
    }
end
