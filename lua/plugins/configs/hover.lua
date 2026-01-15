local M = {}

M.providers = {
    {
      module = 'hover.providers.diagnostic',
      priority = 2000,
    },
    {
      module = 'hover.providers.lsp',
      priority = 1000,
    }
}

M.preview_opts = {
    border = 'rounded'
}

M.preview_window = false

M.title = true

M.mouse_providers = { 'LSP' }

return M
