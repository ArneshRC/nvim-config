local opt = vim.opt

-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

-- Mouse
opt.mouse = 'a'

-- 24 bit colors
opt.termguicolors = true

-- Clean line numbering
opt.number = true
opt.relativenumber = true
opt.fillchars = {
    fold = ' ',
    vert = '│',
    eob = ' ',
    msgsep = '‾'
}

-- Persistent undo history
opt.undofile = true

-- Highlight current line
opt.cursorline = true

-- Always split to the right and bottom
opt.splitright = true
opt.splitbelow = true

-- This configures the time after
-- which the CursorHold event is fired
opt.updatetime = 500

-- Disable line wrapping
opt.wrap = false

-- Case insensitive search
opt.smartcase = true
opt.ignorecase = true

opt.signcolumn = 'yes'

-- Use system clipboard for
-- yank operations
opt.clipboard = 'unnamedplus'

-- Custom cursor
opt.guicursor = {
    'n-v:block',
    'i-ci-ve:ver25',
    'r-c-cr:hor20',
    'o:hor50',
    'a:blinkwait250-blinkoff500-blinkon500'
}

opt.shortmess:append {
    I = true
}

opt.nrformats:append { "alpha" }

-- "n-v:block,i-ci-ve:ver25,r-c-cr:hor20,o:hor50,a:blinkwait250-blinkoff500-blinkon500"}

vim.g.tex_flavor = "latex"

-- Neovide-specific configuration
if vim.g.neovide == true then
    opt.guifont = 'JetBrainsMono_NFM:h11'
    vim.g.neovide_cursor_trail_size = 0.2
    vim.g.neovide_padding_top = 20
    vim.g.neovide_padding_right = 15
    vim.g.neovide_padding_left = 15
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_remember_window_position = true
    vim.g.neovide_remember_window_size = false
end
