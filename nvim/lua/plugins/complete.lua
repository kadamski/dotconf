-- vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

return {
    "hrsh7th/nvim-cmp",
    lazy = true,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        -- "saadparwaiz1/cmp_luasnip",
        -- "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local select_opts = {behavior = cmp.SelectBehavior.Select, select = true}
        local cmdline_dbldot = cmp.mapping.preset.cmdline()

        cmdline_dbldot["<Tab>"] = cmp.mapping.confirm({ -- "Tab" will overrides preset behaviour
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })

        -- require("luasnip.loaders.from_vscode").lazy_load()
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm(select_opts),
                -- ['<Tab>'] = cmp.mapping(function(fallback)
                --     local col = vim.fn.col('.') - 1
                --
                --     if cmp.visible() then
                --         cmp.select_next_item(select_opts)
                --     elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                --         fallback()
                --     else
                --         cmp.complete()
                --     end
                -- end, {'i', 's'}),
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = 'path'  },
                { name = "nvim_lsp", keyword_length = 2 },
                { name = "buffer", keyword_length = 3},
                -- { name = "luasnip" },
            },
            formatting = {
                fields = {'menu', 'abbr', 'kind'},
                format = function(entry, item)
                    local menu_icon = {
                        nvim_lsp = 'λ',
                        buffer = 'Ω',
                        path = '🖫',
                        luasnip = '⋗'
                    }
                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
                expandable_indicator = true
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
        })
        cmp.setup.cmdline(':', {
            mapping = cmdline_dbldota,
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    }
                }),
                matching = { disallow_symbol_nonprefix_matching = false },
        })
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
    end,
}
