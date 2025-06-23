local M = {}

local lspconfig = require('lspconfig')

M.on_attach = function(_, bufnr)
    vim.diagnostic.config({
        virtual_text = false,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = ' ',
                [vim.diagnostic.severity.WARN] = ' ',
                [vim.diagnostic.severity.INFO] = ' ',
                [vim.diagnostic.severity.HINT] = ' 󰌵',
            }
        }
    })

    require('lsp_signature').on_attach({
        bind = true,
        hi_parameter = 'LspSignatureActiveParameter',
        handler_opts = {
            border = 'rounded'
        }
    }, bufnr)
end

M.capabilities = require('blink.cmp').get_lsp_capabilities()

local servers = {
    'html', 'clangd', 'pyright', 'eslint',
    'vtsls', 'cssls', 'texlab', 'jdtls',
    'jsonls', 'svelte', 'vala_ls', 'biome',
    'astro'
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities
    }
end

lspconfig.rust_analyzer.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy"
            }
        }
    }
}

lspconfig.astro.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  init_options = {
    typescript = { tsdk = vim.fs.normalize '~/.local/share/nvim/mason/packages/vtsls/node_modules/@vtsls/language-server/node_modules/typescript/lib/', }
  }
}

-- lspconfig.textlsp.setup {
--     on_attach = M.on_attach,
--     capabilities = M.capabilities,
--     filetypes = { 'markdown', 'txt', 'text', 'tex', 'asciidoc' },
--     settings = {
--         textLSP = {
--             analysers = {
--                 languagetool = {
--                     enabled = true,
--                     check_text = {
--                         on_open = true,
--                         on_save = true,
--                         on_change = false,
--                     }
--                 }
--             }
--         }
--     }
-- }

lspconfig.lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false }
        }
    }
}

lspconfig.bashls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    filetypes = { 'sh', 'bash', 'zsh' }
}

lspconfig.emmet_language_server.setup({
    -- on_attach = on_attach,
    capabilities = M.capabilities,
    filetypes = {
        "css", "ejs", "html",
        "javascript", "javascriptreact",
        "less", "sass", "scss", "svelte",
        "pug", "typescriptreact", "vue",
        "astro"
    },
    init_options = {
        html = {
            options = {
                ["bem.enabled"] = true,
            },
        },
    }
})
