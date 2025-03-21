local M = {
    options = {
        theme = 'base16',
        component_separators = ' '
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    extensions = {
        'nvim-tree'
    }
}

require('lualine').setup(M)
