local M = {}

local function get_floating_window()
    local base_win_id = vim.api.nvim_get_current_win()
    local windows = vim.api.nvim_tabpage_list_wins(0)
    for _, win_id in ipairs(windows) do
        if win_id ~= base_win_id then
            local win_cfg = vim.api.nvim_win_get_config(win_id)
            -- workaround for detecting floating windows
            -- TODO: improve logic
            if win_cfg.relative == "win" and win_cfg.width > 5 and win_cfg.win == base_win_id then
                return win_id
            end
        end
    end
    return nil
end

M.floating_window_open = function()
    return get_floating_window() ~= nil
end

M.close_floating_window = function()
    local win_id = get_floating_window()
    if win_id then
        vim.api.nvim_win_close(win_id, true)
    end
end

-- Shows diagnostic window if there's no 
-- floating window open in any buffer
M.show_diagnostics_window = function()
    if M.floating_window_open() then return end
    vim.diagnostic.open_float({focusable = false})
end

return M
