local M = {}

local has_words_before = function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    if col == 0 then
        return false
    end
    local line = vim.api.nvim_get_current_line()
    return line:sub(col, col):match("%s") == nil
end

M.keymap = {
    preset = 'none',

    ['<Tab>'] = {
        function(cmp)
            if has_words_before() then
                return cmp.insert_next()
            end
        end,
        'fallback',
    },
    ['<S-Tab>'] = { 'insert_prev' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-e>'] = { 'cancel', 'fallback' }
}

M.appearance = {
    nerd_font_variant = 'mono'
}

M.completion = {
    documentation = { auto_show = false },
    accept = { auto_brackets = { enabled = true } }
}

M.sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' }
}

M.fuzzy = { implementation = "prefer_rust_with_warning" }

return M
