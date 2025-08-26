return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local wk = require("which-key")

            wk.add({
                { "<leader>g", group = "gitsigns" },
                { "<leader>gb", function() gs.blame_line({full=true}) end, desc = "blame_line" },
                { "<leader>gt", gs.toggle_current_line_blame, desc = "blame line toggle" },
                { "<leader>gd", gs.diffthis, desc = "diffthis" },
                { "<leader>gs", gs.stage_hunk, desc = "stage hunk" },
                { "<leader>gS", gs.undo_stage_hunk, desc = "undo last stage" },
                { "<leader>gf", gs.stage_buffer, desc = "stage file" },
                { "<leader>gp", gs.preview_hunk, desc = "preview hunk" },
            })

            wk.add(
                { "]g", function() gs.next_hunk({buffer=bufnr}) end, desc = "Next Git hunk" }
            )

            wk.add(
                { "[g", function() gs.prev_hunk({buffer=bufnr}) end, desc = "Prev Git hunk" }
            )
        end
    },
    config = function(_, opts)
        require('gitsigns').setup(opts)
    end
}
