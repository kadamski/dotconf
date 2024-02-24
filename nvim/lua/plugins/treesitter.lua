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
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = { query ="@function.outer", desc = "a function TO" },
                    ["if"] = { query ="@function.inner", desc = "inner function TO" },
                }
            },
            move = {
                enable = true,
                goto_next_start = {
                    ["]f"] = { query ="@function.outer", desc = "Next function start" },
                },
                goto_next_end = {
                    ["]F"] = { query ="@function.outer", desc = "Next function end" },
                },
                goto_previous_start = {
                    ["[f"] = { query ="@function.outer", desc = "Nrev function start" },
                },
                goto_previous_end = {
                    ["[F"] = { query ="@function.outer", desc = "Nrev function end" },
                }
            },
        },
    },
    config = function (_, opts)
        local configs = require("nvim-treesitter.configs")
        configs.setup(opts)
    end
}

