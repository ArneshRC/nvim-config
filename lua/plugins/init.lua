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
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
            {
                's1n7ax/nvim-window-picker',
                name = 'window-picker',
                event = 'VeryLazy',
                version = '2.*',
                config = function()
                    require 'window-picker'.setup()
                end,
            }
        },
        opts = {
            window = {
                width = 30,
                mappings = {
                    ["l"] = "open",
                    ["h"] = "navigate_up",
                    ["L"] = "set_root"
                }
            },
            event_handlers = {
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd.wincmd("=")
                        end
                    end
                },
                {
                    event = "neo_tree_window_after_close",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd.wincmd("=")
                        end
                    end
                }
            }
        },
        lazy = false, -- neo-tree will lazily load itself
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
        -- Syntax highlighting
        "romus204/tree-sitter-manager.nvim",
        dependencies = {}, -- tree-sitter CLI must be installed system-wide
        config = function()
            require("tree-sitter-manager").setup({
                -- Default Options
                ensure_installed = { 'html', 'css', 'typescript', 'javascript', 'markdown', 'rust', 'python', 'haskell', 'gitignore', 'fish', 'bash', 'dockerfile', 'cpp', 'c', 'lua', 'yuck', 'json', 'vala' },
                auto_install = true, -- if enabled, install missing parsers when editing a new file
                highlight = true,    -- treesitter highlighting is enabled by default
            })
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
            {
                -- LSP Icons
                'onsails/lspkind.nvim',
                opts = {
                    symbol_map = {
                        Copilot = ''
                    }
                }
            },
            -- Signature Hints
            'ray-x/lsp_signature.nvim',
            {
                -- Colorful Completion Menu
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

        opts = require('plugins.configs.blinkcmp'),
        opts_extend = { "sources.default" }

    },
    {
        -- Formatter
        'stevearc/conform.nvim',
        event = 'InsertEnter',
        opts = require('plugins.configs.conform')
    },
    -- {
    --     -- UI Overhaul
    --     'folke/noice.nvim',
    --     dependencies = {
    --         'MunifTanjim/nui.nvim',
    --         {
    --             'rcarriga/nvim-notify',
    --             opts = {
    --                 timeout = 0
    --             }
    --         }
    --     },
    --     opts = require('plugins.configs.noice')
    -- },
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
                { ft = 'neo-tree' },
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
                'jvgrootveld/telescope-zoxide'
            }
        },
    },
    {
        -- Automatic commenting
        'numToStr/Comment.nvim',
        event = 'BufEnter',
        opts = {}
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
        'YaQia/dropbar.nvim',
        lazy = false,
        opts = {
            menu = {
                keymaps = {
                    ["h"] = "<C-w>c",
                    ["l"] = function()
                        local menu = require("dropbar.api").get_current_dropbar_menu()
                        if not menu then
                            return
                        end
                        local cursor = vim.api.nvim_win_get_cursor(menu.win)
                        local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
                        if component then
                            menu:click_on(component, nil, 1, "l")
                        end
                    end,
                },
            },
        },
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        }
    },
    {
        "luckasRanarison/tree-sitter-hyprlang",
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
        lazy = true,
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
        "lewis6991/hover.nvim",
        opts = require "plugins.configs.hover"
    },
    {
        "https://codeberg.org/andyg/leap.nvim",
        opts = {}
    },
    {
        "gruvw/strudel.nvim",
        build = "/usr/bin/npm i",
        config = function()
            require("strudel").setup()
        end,
    },
    {
        "folke/zen-mode.nvim",
    }
}

require('lazy').setup(plugins)
