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
                opts = {}
            },
        },
        opts = require('plugins.configs.nvimtree')
    },
    {
        -- Color code highlighting
        'NvChad/nvim-colorizer.lua',
        opts = {
            user_default_options = {
                tailwind = true,
                mode = 'virtualtext',
                virtualtext = '󱓻'
            }
        }
    },
    {
        'cameron-wags/rainbow_csv.nvim',
        opts = {}
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
        opts = {}
    },
    {
        -- Indentation guides
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        main = 'ibl',
        opts = {
            indent = {
                char = '│'
            }
        }
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
        opts = require('plugins.configs.bufferline')
    },
    {
        'ziontee113/syntax-tree-surfer',
        event = 'BufEnter',
        opts = {}
    },
    {
        -- Move lines with <A-j>/<A-k>
        'echasnovski/mini.move',
        event = 'BufEnter',
        version = false,
        opts = {}
    },
    {
        -- Remove buffers while keeping layout
        'echasnovski/mini.bufremove',
        event = 'BufEnter',
        version = false,
        opts = {}
    },
    {
        -- Statusline
        'nvim-lualine/lualine.nvim',
        lazy = false,
        opts = require('plugins.configs.lualine')
    },
    {
        -- Package manager for language servers etc.
        'williamboman/mason.nvim',
        opts = {}
    },
    {
        -- [LSP] Completion Engine
        'saghen/blink.cmp',
        dependencies = {
            -- Snippet Engine
            'rafamadriz/friendly-snippets',
            -- LSP Icons
            'onsails/lspkind.nvim',
            -- Signature Hints
            'ray-x/lsp_signature.nvim',
            -- Colorful Completion Menu
            {
                'xzbdmw/colorful-menu.nvim',
                opts = {}
            },
            {
                -- [LSP] Configuration presets
                'neovim/nvim-lspconfig',
                event = { 'BufReadPre', 'BufNewFile' },
                config = function()
                    require 'plugins.configs.lspconfig'
                end
            }
        },

        version = '1.*',

        opts = require('plugins.configs.blinkcmp'),
        opts_extend = { "sources.default" }

    },
    {
        -- Formatter
        'stevearc/conform.nvim',
        event = 'InsertEnter',
        opts = require('plugins.configs.conform')
    },
    {
        -- UI Overhaul
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            {
                'rcarriga/nvim-notify',
                opts = {
                    timeout = 0
                }
            }
        },
        opts = require('plugins.configs.noice')
    },
    {
        -- [LSP] Renamer
        'smjonas/inc-rename.nvim',
        event = 'BufEnter',
        dependencies = { 'folke/noice.nvim' },
        opts = {}
    },
    {
        -- Lua version of vim-surround
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        opts = require('plugins.configs.surround')
    },
    {
        'nvim-autopairs',
        event = 'InsertEnter',
        opts = {
            fast_wrap = {}
        }
    },
    {
        -- Scrollbar
        'lewis6991/satellite.nvim',
        opts = {
            current_only = true
        }
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
        opts = {
            shade_terminals = false
        }
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
        opts = {
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
    },
    {
        -- Automatic commenting
        'numToStr/Comment.nvim',
        event = 'BufEnter',
        opts = {}
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
        opts = {}
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
        opts = {}
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
}

require('lazy').setup(plugins)
