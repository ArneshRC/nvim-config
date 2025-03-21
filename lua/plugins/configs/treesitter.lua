local M = {}

M.ensure_installed = {
    'lua', 'vim', 'c', 'cpp', 'rust', 'vimdoc', 'json', 'jsonc',
    'html', 'css', 'typescript', 'javascript'
}

M.highlight = {
    enable = true,
    use_languagetree = true,
    disable = function(_, bufnr)
        local buf_name = vim.api.nvim_buf_get_name(bufnr)
        local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
        return file_size > 256 * 1024
    end,
}

M.indent = {
    enable = true,
}

require('nvim-treesitter.configs').setup(M)
