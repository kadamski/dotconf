return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            map('n', '<leader>gb', function() gs.blame_line{full=true} end)
            map('n', '<leader>gt', gs.toggle_current_line_blame)
            map('n', '<leader>gd', gs.diffthis)
        end
    },
    config = function(_, opts)
        require('gitsigns').setup(opts)
    end
}
