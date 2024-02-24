return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
        -- statusline
        require('lualine').setup({
            options = { theme = "catppuccin" },
            sections = {
                lualine_x = {
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                        color = { fg = "#ff9e64" }
                    }
                }
            --     lualine_a = { 'buffers' }
            }
        })
    end
}
