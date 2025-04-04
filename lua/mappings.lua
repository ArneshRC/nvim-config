local map = vim.keymap.set
local utils = require('utils')

vim.g.mapleader = ' '

-- General mappings
map('n', '<C-s>', '<cmd> write <CR>')
map('i', '<C-s>', '<cmd> write <CR>')
map('n', '<Esc>', '<cmd> nohlsearch <CR>')
map('n', '<C-a>', '<cmd> %y+ <CR>')
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-f>', '<C-f>zz')
map('n', '<C-b>', '<C-b>zz')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', 'cd', function ()
    local tree = require('nvim-tree.api').tree
    vim.cmd('cd %:p:h')
    tree.change_root(vim.fn.getcwd())
end)
map('n', 'c.', function ()
    local tree = require('nvim-tree.api').tree
    vim.cmd('cd ..')
    tree.change_root(vim.fn.getcwd())
end)

-- Allow moving the cursor through wrapped lines with j, k
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- Manage buffers and tabs
map('n', '<Tab>', '<cmd> BufferLineCycleNext <CR>')
map('n', '<S-Tab>', '<cmd> BufferLineCyclePrev <CR>')
map('n', '<leader><Tab>', '<cmd> BufferLineMoveNext <CR>')
map('n', '<leader><S-Tab>', '<cmd> BufferLineMovePrev <CR>')
map('n', '<leader>x', function () require('mini.bufremove').delete() end)
map('n', '<leader>e', '<cmd> enew <CR>')
map('n', '<leader>te', '<cmd> tabnew <CR>')
map('n', '<leader>tx', '<cmd> tabclose <CR>')
map('n', '<leader>t<Tab>', '<cmd> tabnext <CR>')
map('n', '<leader>t<S-Tab>', '<cmd> tabprevious <CR>')

-- Nvim-tree keybinds
map('n', '<C-n>', '<cmd> NvimTreeToggle <CR>')

-- Line numbering
map('n', '<leader>nn', '<cmd> set number! <CR>')
map('n', '<leader>nr', '<cmd> set relativenumber! <CR>')

-- Line wrapping
map('n', '<leader>w', '<cmd> set wrap! lbr! <CR>')

-- Copy and paste
map('n', '<C-S-c>', '"+y')
map('v', '<C-S-c>', '"+y')
map('n', '<C-S-v>', '"+p')
map('i', '<C-S-v>', '<C-r>+')
map('c', '<C-S-v>', '<C-r>+')

-- Easy movement across splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- LSP keybinds
map('n', 'gd', function() vim.lsp.buf.definition() end)
map('n', 'K', function()
    utils.close_floating_window()
    vim.lsp.buf.hover()
end)
map('n', '<leader>rf', function()
    require('conform').format {
        async = true,
        lsp_fallback = true
    }
end)
map('n', '<leader>ra', ':IncRename ')

-- Syntax Tree Surfer
local sts_opts = {noremap = true, silent = true}

-- Normal Mode Swapping:
-- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
map("n", "<A-K>", function()
	vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

map("n", "<A-J>", function()
	vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

-- Visual Selection from Normal Mode
map("n", "vx", '<cmd>STSSelectMasterNode<cr>', sts_opts)
map("n", "vn", '<cmd>STSSelectCurrentNode<cr>', sts_opts)

-- Select Nodes in Visual Mode
map("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', sts_opts)
map("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', sts_opts)
map("x", "H", '<cmd>STSSelectParentNode<cr>', sts_opts)
map("x", "L", '<cmd>STSSelectChildNode<cr>', sts_opts)

-- Swapping Nodes in Visual Mode
map("x", "<A-J>", '<cmd>STSSwapNextVisual<cr>', sts_opts)
map("x", "<A-K>", '<cmd>STSSwapPrevVisual<cr>', sts_opts)

-- Telescope stuff
local telescope_opts = { noremap = true, silent = true }
map('n', '<leader>ff', "<cmd> Telescope find_files <CR>", telescope_opts)
map('n', '<leader>fg', "<cmd> Telescope live_grep <CR>", telescope_opts)
map('n', '<leader>fz', "<cmd> Telescope zoxide list <CR>", telescope_opts)
map('n', '<leader>fr', "<cmd> Telescope oldfiles <CR>", telescope_opts)
map('n', '<leader>fm', "<cmd> Telescope marks <CR>", telescope_opts)

-- NeoRunner integration
map('n', '<F9>', '<cmd> FloatermNew --autoclose=0 --title=NeoRunner nr % <CR>')

-- Toggle terminal
map('n', '<F4>', '<cmd> ToggleTerm name=terminal <CR>')
map('t', '<F4>', '<cmd> ToggleTerm name=terminal <CR>')

map('t', '<C-w>w', '<cmd> wincmd k <CR>')

if vim.g.neovide == true then
    map('n', '<C-S-d>', '<cmd> silent !zsh -c "dolphin \\\"%:p:h\\\" > /dev/null 2>&1 & disown" <CR> <CR>')
    map('n', '<C-Tab>', '<cmd> tabnext <CR>')
    map('n', '<C-S-Tab>', '<cmd> tabprevious <CR>')
end
