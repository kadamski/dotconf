return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    init = function()
        require('Comment').setup()
    end
}
