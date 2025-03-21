vim.filetype.add {
    pattern = {
        ['.*'] = {
            function (path, bufnr)
                local content = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ''
                if vim.regex([[wpexec]]):match_str(content) ~= nil then
                  return 'lua'
                end
            end
        }
    }
}
