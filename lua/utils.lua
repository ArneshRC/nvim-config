local M = {}

-- Check if any diagnostic windows are open
-- in any buffer
local function diagnostic_window_open()
    local wins = vim.api.nvim_list_wins()
    for _, win in pairs(wins) do
        if pcall(vim.api.nvim_win_get_var, win, 'textDocument/hover') then
            return true
        end
    end
    return false
end

-- Shows diagnostic window if there's no other
-- diagnostic window open in any buffer
M.show_diagnostics_window = function()
    if diagnostic_window_open() then return end
    vim.diagnostic.open_float({focusable = false})
end

return M
