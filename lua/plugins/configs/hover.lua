local M = {}

M.init = function()
    require("hover.providers.lsp")
    require("hover.providers.diagnostic")
end

M.preview_opts = {
    border = 'rounded'
}

M.preview_window = false

M.title = true

return M
