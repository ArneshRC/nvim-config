M = {}

local web_formatters = { "biome", "biome-check", "biome-organize-imports" }

M.formatters_by_ft = {
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
    python = { "ruff" },
    rust = { "rustfmt" }
}

return M
