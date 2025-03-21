local M = {}

local noice = require('noice')

M.presets = { inc_rename = true }

M.lsp = {
    signature = {
        enabled = false
    }
}

M.routes = {}

local exclude_messages = {
    '-- INSERT --',
    '-- VISUAL --',
    '-- VISUAL LINE --',
    '-- VISUAL BLOCK --'
}

for k, message in pairs(exclude_messages) do
    table.insert(M.routes, {
        filter = { event = 'msg_showmode', find = message },
        opts = { skip = true }
    })
end

table.insert(M.routes, {
    view = 'notify',
    filter = { event = 'msg_showmode' }
})

M.messages = {
    enabled = false,
    view = 'notify',
    view_error = 'notify',
    view_warn = 'notify',
    view_history = 'notify',
    view_search = 'virtualtext'
}

noice.setup(M)
