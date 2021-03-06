local vim = vim

function map(type, input, output, opts)
  vim.api.nvim_set_keymap(type, input, output, opts)
end

function noremap(type, input, output)
  vim.api.nvim_set_keymap(type, input, output, { noremap = true })
end

function nnoremap(input, output)
  noremap('n', input, output)
end

function inoremap(input, output)
  noremap('i', input, output)
end

function vnoremap(input, output)
  noremap('v', input, output)
end

function xnoremap(input, output)
  noremap('x', input, output)
end

function onoremap(input, output)
  noremap('o', input, output)
end

function tnoremap(input, output)
    noremap('t', input, output)
end

function nmap(input, output)
	map('n', input, output, {})
end

function imap(input, output)
	map('i', input, output)
end

function vmap(input, output)
	map('v', input, output)
end

function xmap(input, output)
	map('x', input, output)
end

function omap(input, output)
	map('o', input, output)
end

function tmap(input, output)
	map('t', input, output)
end


