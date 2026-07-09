local M = {}

local function get_node_text(node, bufnr)
  return vim.treesitter.get_node_text(node, bufnr)
end

local function find_interface_at_cursor(root, row)
  local result = nil

  local function walk(node)
    local sr, _, er, _ = node:range()

    if row >= sr and row <= er then
      if node:type() == "interface_declaration" then
        result = node
      end

      for child in node:iter_children() do
        walk(child)
      end
    end
  end

  walk(root)

  return result
end

local function find_identifier(method_node, bufnr)
  for child in method_node:iter_children() do
    local t = child:type()

    if t == "identifier" then
      return get_node_text(child, bufnr)
    end

    if t == "generic_name" then
      for gc in child:iter_children() do
        if gc:type() == "identifier" then
          return get_node_text(gc, bufnr)
        end
      end
    end
  end

  return nil
end

function M.sort_interface_methods()
  local bufnr = vim.api.nvim_get_current_buf()

  local parser = vim.treesitter.get_parser(bufnr, "c_sharp")
  local tree = parser:parse()[1]
  local root = tree:root()

  local row = vim.api.nvim_win_get_cursor(0)[1] - 1

  local interface = find_interface_at_cursor(root, row)

  if not interface then
    vim.notify(
      "Cursor must be inside an interface",
      vim.log.levels.ERROR
    )
    return
  end

  local members = {}

  for child in interface:iter_children() do
    if child:type() == "declaration_list" then
      for member in child:iter_children() do
        if member:type() == "method_declaration" then
          local name = find_identifier(member, bufnr)

          if name then
            local sr, _, er, _ = member:range()

            table.insert(members, {
              name = name,
              start_row = sr,
              end_row = er,
              node = member,
            })
          end
        end
      end
    end
  end

  if #members < 2 then
    vim.notify("Nothing to sort")
    return
  end

  local original = {}

  for _, m in ipairs(members) do
    local lines = vim.api.nvim_buf_get_lines(
      bufnr,
      m.start_row,
      m.end_row + 1,
      false
    )

    table.insert(original, {
      name = m.name,
      lines = lines,
      start_row = m.start_row,
      end_row = m.end_row,
    })
  end

  table.sort(original, function(a, b)
    return a.name:lower() < b.name:lower()
  end)

  local replacement = {}

  for i, item in ipairs(original) do
    vim.list_extend(replacement, item.lines)

    if i < #original then
      table.insert(replacement, "")
    end
  end

  local start_row = members[1].start_row
  local end_row = members[#members].end_row

  vim.api.nvim_buf_set_lines(
    bufnr,
    start_row,
    end_row + 1,
    false,
    replacement
  )

  vim.notify(
    string.format("Sorted %d interface methods", #members)
  )
end

return M
