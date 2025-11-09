M = {}

local web_formatters = { "biome", "biome-check", "rustywind" }

M.formatters_by_ft = {
    astro = { "prettier" },
    javascript = web_formatters,
    typescript = web_formatters,
    javascriptreact = web_formatters,
    typescriptreact = web_formatters,
    svelte = web_formatters,
    css = web_formatters,
    html = web_formatters,
    json = web_formatters,
    jsonc = web_formatters,
    yaml = web_formatters,
    markdown = web_formatters,
    graphql = web_formatters,
    python = { "ruff", "ruff_format" },
    tex = { "tex-fmt" },
    rust = { "rustfmt" }
}

return M
