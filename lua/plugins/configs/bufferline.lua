local M = {}

local colors = require('plugins.configs.colors')
local bl_colors = colors.bufferline

M.options = {
    themable = true,
    close_icon = '󰅙',
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true
        }
    }
}

M.highlights = {
    fill = {
        bg = bl_colors.bg
    },
    background = {
        fg = bl_colors.fg_secondary,
        bg = bl_colors.bg
    },
    buffer_selected = {
        fg = bl_colors.fg_primary,
        bg = bl_colors.bg
    },
    buffer_visible = {
        fg = bl_colors.fg_secondary,
        bg = bl_colors.bg
    },
    close_button = {
        fg = bl_colors.fg_secondary,
        bg = bl_colors.bg
    },
    modified = {
        bg = bl_colors.bg
    },
    close_button_visible = {
        fg = bl_colors.fg_secondary,
        bg = bl_colors.bg
    },
    close_button_selected = {
        fg = bl_colors.fg_primary,
        bg = bl_colors.bg
    },
    separator_selected = {
        fg = bl_colors.bg,
        bg = bl_colors.bg
    },
    separator_visible = {
        fg = bl_colors.bg,
        bg = bl_colors.bg
    },
    separator = {
        fg = bl_colors.bg,
        bg = bl_colors.bg
    },
    offset_separator = {
        fg = colors.base02,
        bg = bl_colors.bg
    },
    indicator_visible = {
        fg = bl_colors.bg,
        bg = bl_colors.bg
    },
    indicator_selected = {
        fg = bl_colors.accent,
        bg = bl_colors.bg
    },
    tab = {
        fg = bl_colors.fg_primary,
        bg = bl_colors.bg,
    },
    tab_selected = {
        fg = bl_colors.bg,
        bg = bl_colors.accent,
    },
    tab_separator = {
        fg = bl_colors.bg,
        bg = bl_colors.bg,
    },
    tab_separator_selected = {
        fg = bl_colors.accent,
        bg = bl_colors.accent,
    },
    tab_close = {
        fg = bl_colors.close,
        bg = bl_colors.bg,
    },
}

return M
