return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
        -- statusline
        require('lualine').setup({
            options = { theme = "catppuccin" },
            sections = {
                lualine_a = { 'buffers' }
            }
        })
    end
}
