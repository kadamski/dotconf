return {
    "akinsho/bufferline.nvim",
    event = 'VeryLazy',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            numbers = "ordinal",
            left_trunc_marker = '',
            right_trunc_marker = '',
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true,
                }
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
    end,
}
