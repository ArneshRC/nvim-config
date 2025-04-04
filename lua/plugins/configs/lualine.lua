local M = {}

M.options = {
    theme = 'base16',
    component_separators = ' '
}

M.sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
}

M.extensions = {
    'nvim-tree'
}

return M
