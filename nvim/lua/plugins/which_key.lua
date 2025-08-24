return {
    "folke/which-key.nvim",
    dependencies = {
        { 'echasnovski/mini.nvim', version = '*' },
    },
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        disable = {
            buftypes = { "neo-tree" },
            filetypes = { "neo-tree" }
        }
    },
}
