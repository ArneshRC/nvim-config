local opt = vim.opt
local utils = require 'utils'

-- Table of BufEnter autocmds
local bufenter_autocmds = {
    {
        pattern = {'*.tex', '*.txt', '*.md'},
        callback = function ()
            opt.wrap = true
            opt.linebreak = true
        end
    },
    {
        pattern = {'*.vert', '*.frag'},
        callback = function ()
            opt.filetype = 'glsl'
        end
    },
    {
        pattern = {'tsconfig.json'},
        callback = function ()
            opt.filetype = 'jsonc'
        end
    }

}

-- Apply BufEnter autocmds
for _, config in pairs(bufenter_autocmds) do
    vim.api.nvim_create_autocmd({'BufEnter'}, {
        pattern = config.pattern,
        callback = config.callback
    })
end

-- Automatically show diagnostics
-- after `updatetime` ms
vim.api.nvim_create_autocmd({'CursorHold'}, {
    pattern = {'*'},
    callback = utils.show_diagnostics_window
})

