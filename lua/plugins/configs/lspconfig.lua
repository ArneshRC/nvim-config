local M = {}

local lspconfig = vim.lsp.config
local lspenable = vim.lsp.enable

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

lspconfig('rust_analyzer', {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy"
            }
        }
    }
})

lspconfig('astro', {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  init_options = {
    typescript = { tsdk = vim.fs.normalize '~/.local/share/nvim/mason/packages/vtsls/node_modules/@vtsls/language-server/node_modules/typescript/lib/', }
  }
})

lspconfig('lua_ls', {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false }
        }
    }
})

lspconfig('bashls', {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    filetypes = { 'sh', 'bash', 'zsh' }
})

lspconfig('emmet_language_server', {
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

local servers = {
    'html', 'clangd', 'basedpyright', 'vtsls',
    'cssls', 'texlab', 'jdtls', 'jsonls',
    'svelte', 'vala_ls', 'biome', 'astro',
    'tailwindcss', 'rust_analyzer', 'lua_ls',
    'bash_ls', 'emmet_language_server'
}

for _, lsp in ipairs(servers) do
    lspconfig(lsp, {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
    })
    lspenable(lsp)
end

