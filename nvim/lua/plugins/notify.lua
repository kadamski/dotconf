return {
    "rcarriga/nvim-notify",
    config = function() 
        local notify = require("notify")
        notify.setup({
            background_colour = "#000000",
            enabled = false,
        })
        vim.notify = notify
    end
}
