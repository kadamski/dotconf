return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "clangd" },
            auto_install = true,
        }
    },
    { "folke/neodev.nvim", opts = {} },

    { "hrsh7th/cmp-nvim-lsp" },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                }, {
                        { name = "buffer" },
                    }),
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        depends = {
            "folke/neodev.nvim"
        },
        config = function(_, _)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("neodev").setup({})
            local lsp = require('lspconfig')
            lsp.lua_ls.setup({
                capabilities = capabilities
            })
            lsp.clangd.setup({})
        end
    },
}
