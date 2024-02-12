return {
    { "xiyaowong/transparent.nvim", },
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000,
        init = function()
            require("catppuccin").setup({
                background = {
                    light = "frappe",
                    dark = "mocha",
                },
                -- transparent_background = true,
                dim_inactive = {
                    enabled = true,
                    shade = "dark",
                    percentage = 0.1,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end
    },
    { "ntpeters/vim-better-whitespace" },
}
