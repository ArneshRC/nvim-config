local plugins = {
    {
        -- Theme
        'RRethy/nvim-base16',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require 'plugins.configs.theme'
        end
    },
    {
        -- Filesystem tree
        'nvim-tree/nvim-tree.lua',
        cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
        dependencies = {
            {
                'nvim-tree/nvim-web-devicons',
                lazy = true,
                config = function()
                    require('nvim-web-devicons').setup()
                end
            },
        },
        config = function()
            require('plugins.configs.nvimtree')
        end
    },
    {
        -- Color code highlighting
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup {
                user_default_options = {
                    tailwind = true,
                    mode = 'virtualtext',
                    virtualtext = '󱓻'
                }
            }
        end
    },
    {
        'cameron-wags/rainbow_csv.nvim',
        config = function()
            require 'rainbow_csv'.setup()
        end
    },
    {
        -- Improved syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require 'plugins.configs.treesitter'
        end
    },
    {
        -- Git integration
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        -- Indentation guides
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        main = 'ibl',
        config = function()
            require('ibl').setup {
                indent = {
                    char = '│'
                }
            }
        end
    },
    {
        -- Buffer and tab visualization
        'akinsho/bufferline.nvim',
        event = 'BufEnter',
        dependencies = {
            "tiagovla/scope.nvim",
            config = function()
                require('scope').setup()
            end
        },
        config = function()
            require 'plugins.configs.bufferline'
        end
    },
    {
        'ziontee113/syntax-tree-surfer',
        event = 'BufEnter',
        config = function()
            require('syntax-tree-surfer').setup()
        end
    },
    {
        -- Move lines with <A-j>/<A-k>
        'echasnovski/mini.move',
        event = 'BufEnter',
        version = false,
        config = function()
            require('mini.move').setup()
        end
    },
    {
        -- Remove buffers while keeping layout
        'echasnovski/mini.bufremove',
        event = 'BufEnter',
        version = false,
        config = function()
            require('mini.bufremove').setup()
        end
    },
    {
        -- Statusline
        'nvim-lualine/lualine.nvim',
        lazy = false,
        config = function()
            require 'plugins.configs.lualine'
        end
    },
    {
        -- Package manager for language servers etc.
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        -- [LSP] Configuration presets
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'ray-x/lsp_signature.nvim',
            {
                -- [LSP] Completion engine
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                dependencies = {
                    'hrsh7th/cmp-buffer',
                    'hrsh7th/cmp-path',
                    'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/cmp-nvim-lua',
                    {
                        'L3MON4D3/LuaSnip',
                        build = "make install_jsregexp",
                        config = function()
                            require("luasnip.loaders.from_vscode").lazy_load()
                        end,
                        dependencies = {
                            'rafamadriz/friendly-snippets',
                        }
                    },
                    'saadparwaiz1/cmp_luasnip',
                    {
                        'windwp/nvim-autopairs',
                        config = function()
                            require('nvim-autopairs').setup()
                            local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
                            local cmp = require 'cmp'
                            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
                        end
                    },
                    {
                        'windwp/nvim-ts-autotag',
                        dependencies = 'nvim-treesitter/nvim-treesitter',
                        config = function()
                            require('nvim-ts-autotag').setup()
                        end

                    },
                },
                config = function()
                    require 'plugins.configs.nvimcmp'
                end
            },
            {
                -- Formatter
                'stevearc/conform.nvim',
                event = 'InsertEnter',
                config = function()
                    local conform = require('conform')
                    conform.setup {
                        formatters_by_ft = {
                            javascript = { "prettierd" },
                            typescript = { "prettierd" },
                            javascriptreact = { "prettierd" },
                            typescriptreact = { "prettierd" },
                            svelte = { "prettierd" },
                            python = { "ruff" },
                            css = { "prettierd" },
                            html = { "prettierd" },
                            json = { "prettierd" },
                            jsonc = { "prettierd" },
                            yaml = { "prettierd" },
                            markdown = { "prettierd" },
                            graphql = { "prettierd" },
                            rust = { "rustfmt" }
                        },
                    }
                end
            },
            {
                -- LSP Icons
                'onsails/lspkind.nvim'
            }
        },
        config = function()
            require 'plugins.configs.lspconfig'
        end
    },
    {
        -- UI Overhaul
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            {
                'rcarriga/nvim-notify',
                config = function()
                    require('notify').setup {
                        timeout = 0
                    }
                end
            }
        },
        config = function()
            require 'plugins.configs.noice'
        end
    },
    {
        -- [LSP] Renamer
        'smjonas/inc-rename.nvim',
        event = 'BufEnter',
        dependencies = { 'folke/noice.nvim' },
        config = function()
            require('inc_rename').setup()
        end
    },
    {
        -- Lua version of vim-surround
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup {
                surrounds = {
                    ["c"] = {
                        add = function()
                            local cmd = require("nvim-surround.config").get_input "Command: "
                            return { { "\\" .. cmd .. "{" }, { "}" } }
                        end,
                    },
                    ["e"] = {
                        add = function()
                            local env = require("nvim-surround.config").get_input "Environment: "
                            return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
                        end,
                    },
                }
            }
        end
    },
    {
        -- Scrollbar
        'lewis6991/satellite.nvim',
        config = function()
            require('satellite').setup({
                current_only = true
            })
        end
    },
    {
        -- Floating terminal
        'voldikss/vim-floaterm',
        event = 'VeryLazy',
        cmd = { 'FloatermNew', 'FloatermToggle', 'FloatermPrev', 'FloatermNext' }
    },
    {
        -- Toggle terminal
        'akinsho/toggleterm.nvim',
        event = 'VeryLazy',
        cmd = { 'ToggleTerm' },
        config = function()
            require('toggleterm').setup {
                shade_terminals = false
            }
        end
    },
    {
        -- Fixed window positioning
        'folke/edgy.nvim',
        event = 'VeryLazy',
        dependencies = { 'akinsho/toggleterm.nvim' },
        opts = {
            animate = { enabled = false },
            wo = { winbar = false },
            bottom = {
                {
                    ft = 'toggleterm',
                    size = { height = 12 },
                    filter = function(buf, win)
                        return vim.api.nvim_win_get_config(win).relative == ''
                    end,
                },
            },
            left = {
                { ft = 'NvimTree' },
            }
        }
    },
    {
        -- Versatile, extensible fuzzy finder
        'nvim-telescope/telescope.nvim',
        cmd = { 'Telescope' },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            {
                'jvgrootveld/telescope-zoxide',
                dependencies = {
                    'nvim-tree/nvim-tree.lua'
                }
            }
        },
        config = function()
            require('telescope').setup {
                extensions = {
                    zoxide = {
                        mappings = {
                            ['<CR>'] = {
                                action = function(selection)
                                    local tree = require('nvim-tree.api').tree
                                    tree.focus()
                                    tree.change_root(selection.path)
                                end
                            }
                        }
                    }
                }
            }
        end
    },
    {
        -- Automatic commenting
        'numToStr/Comment.nvim',
        event = 'BufEnter',
        config = function()
            require('Comment').setup()
        end
    },
    {
        -- For testing treesitter
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
    },
    {
        -- For converting colors from one format to another
        'NTBBloodbath/color-converter.nvim',
        event = 'BufEnter',
        config = function()
            local color_converter = require('color-converter')
            local cmd = vim.api.nvim_create_user_command
            cmd('ColorConvertHex', color_converter.to_hex, { nargs = 0 })
            cmd('ColorConvertRGB', color_converter.to_rgb, { nargs = 0 })
            cmd('ColorConvertHSL', color_converter.to_hsl, { nargs = 0 })
        end

    },
    {
        -- For highlighting todo comments and more
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = 'BufEnter',
        opts = {}
    },
    {
        'utilyre/barbecue.nvim',
        name = 'barbecue',
        version = '*',
        dependencies = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons', -- optional dependency
            'RRethy/nvim-base16',
        },
        config = function()
            require('barbecue').setup()
        end
    },
    {
        "luckasRanarison/tree-sitter-hyprlang",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = 'VeryLazy'
    },
    {
        "Fymyte/rasi.vim",
        ft = "rasi",
        event = 'VeryLazy'
    },
    {
        "RRethy/vim-illuminate",
        event = 'BufEnter',
        config = function()
            require("illuminate").configure {
                min_count_to_highlight = 2,
                large_file_cutoff = 1000
            }
        end
    },
    {
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        main = "nvim-silicon",
        opts = {
            -- Configuration here, or leave empty to use defaults
            line_offset = function(args)
                return args.line1
            end,
        }
    },
    {
        "stevearc/oil.nvim",
        config = function()
            require('oil').setup()
        end
    },
    {
        "kmonad/kmonad-vim"
    },
    {
        "NTBBloodbath/color-converter.nvim"
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false, -- Recommended
        config = function()
            local presets = require("markview.presets").headings;

            require("markview").setup({
                preview = {
                    filetypes = { "md", "markdown" },
                },
                markdown = {
                    headings = presets.simple
                }
            });
        end,

        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        'tigion/nvim-asciidoc-preview',
        ft = { 'asciidoc' },
        build = 'cd server && pnpm install',
        opts = {
            server = {
                converter = 'cmd',
                port = 11235,
            },
        }
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = {
            {
                "zbirenbaum/copilot.lua",
                cmd = "Copilot",
                event = "InsertEnter",
                opts = {
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                }
            }
        },
        config = function()
            require("copilot_cmp").setup()
        end
    }
}

require('lazy').setup(plugins)
