local M = {}

M.on_attach = function(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    api.config.mappings.default_on_attach(bufnr)

    local map = vim.keymap.set

    map('n', 'l', api.node.open.edit, opts('edit'))
    map('n', 'h', api.tree.change_root_to_parent, opts('up'))
    map('n', 'L', api.tree.change_root_to_node, opts('cd'))

end

M.update_focused_file = {
    enable = true,
    update_root = false
}

return M
