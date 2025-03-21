local M = {}

local cmp = require('cmp')
local lspkind = require('lspkind')

M.formatting = {
    format = lspkind.cmp_format({
        mode = 'symbol',
        maxwidth = {
            menu = 50,
            abbr = 50,
        },
        ellipsis_char = '...',
        show_labelDetails = true,
        symbol_map = { Copilot = "" }
    })
}

M.snippet = {
    expand = function(args)
        require('luasnip').lsp_expand(args.body)
    end
}

M.window = {
    documentation = {
        border = 'rounded'
    }
}

M.mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end, { 'i', 's' }),
})

M.sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'copilot' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'luasnip' }
})

M.experimental = {
    ghost_text = true
}

cmp.setup(M)
