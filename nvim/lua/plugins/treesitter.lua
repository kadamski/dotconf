return {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    event = 'VeryLazy',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
        ensure_installed = { "c", "lua", "luadoc", "vim", "vimdoc" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function (_, opts)
        local configs = require("nvim-treesitter.configs")
        configs.setup(opts)
    end
}

