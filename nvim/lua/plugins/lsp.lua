return {
    {
        "williamboman/mason.nvim",
        lazy = true,
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

    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = {
            "folke/neodev.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function(_, _)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("neodev").setup({})
            local lsp = require('lspconfig')
            lsp.lua_ls.setup({
                capabilities = capabilities
            })
            lsp.clangd.setup({
                capabilities = capabilities
            })
        end
    },
}
