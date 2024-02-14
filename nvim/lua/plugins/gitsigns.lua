return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local wk = require("which-key")

            wk.register({
                g = {
                    name = "gitsigns",
                    b = { function() gs.blame_line({full=true}) end, "blame_line" },
                    t = { gs.toggle_current_line_blame, "blame line toggle" },
                    s = { gs.diffthis, "diffthis" },
                    p = { gs.preview_hunk, "preview hunk" },
                }
            }, { prefix = "<leader>", buffer=bufnr })
        end
    },
    config = function(_, opts)
        require('gitsigns').setup(opts)
    end
}
