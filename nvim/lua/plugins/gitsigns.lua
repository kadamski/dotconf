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
                    d = { gs.diffthis, "diffthis" },
                    p = { gs.preview_hunk, "preview hunk" },
                    s = { gs.stage_hunk, "stage hunk" },
                    S = { gs.undo_stage_hunk, "undo last stage" },
                    f = { gs.stage_buffer, "stage file" },
                }
            }, { prefix = "<leader>", buffer=bufnr })

            wk.register({
                g = { gs.next_hunk, "Next Git hunk" },
            }, { prefix = "]", buffer=bufnr })

            wk.register({
                g = { gs.prev_hunk, "Prev Git hunk" },
            }, { prefix = "[", buffer=bufnr })
        end
    },
    config = function(_, opts)
        require('gitsigns').setup(opts)
    end
}
