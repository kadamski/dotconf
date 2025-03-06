local wk = require("which-key")

-- brackets
wk.add({
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" }
})

wk.add({
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" }
})

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<C-\'>', telescope.oldfiles, {})

wk.add({
    { "<leader>f", group = "telescope" },
    { "<leader>fb", telescope.buffers, desc = "buffers" },
    { "<leader>ff", telescope.find_files, desc = "find files" },
    { "<leader>fg", telescope.live_grep, desc = "grep" },
    { "<leader>fh", telescope.help_tags, desc = "help tags" },
    { "<leader>fm", telescope.marks, desc = "marks" },
    { "<leader>fr", telescope.oldfiles, desc = "recent files" },
    { "<leader>fs", telescope.lsp_document_symbols, desc = "document symbols" },
  })


-- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
wk.add({
    { "<leader>l", group = "lsp" },
    { "<leader>ld", vim.lsp.buf.definition, desc = "definition" },
    { "<leader>lr", vim.lsp.buf.references, desc = "references" },
    { "<leader>lc", vim.lsp.buf.code_action, desc = "code action" },
    { "<leader>lh", vim.lsp.buf.hover, desc = "hover" },
    { "<leader>ln", vim.lsp.buf.rename, desc = "rename" },
})

-- neo-tree
vim.keymap.set("n", "<C-f>", ":Neotree filesystem toggle left<CR>", {})

-- harpoon
local harpoon = require("harpoon")
local function toggle_telescope(harpoon_files)
    local conf = require("telescope.config").values
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end
vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
-- vim.keymap.set("n", "<C-\\>", function() harpoon:list():prev({ui_nav_wrap = true}) end)

wk.add({
    { "<leader>h", group = "harpoon" },
    { "<leader>ha", function() harpoon:list():append() end, desc = "add mark" },
    { "<leader>hc", function() harpoon:list():clear() end, desc = "clear mark" },
    { "<leader>hr", function() harpoon:list():remove() end, desc = "remove mark" },
    { "<leader>hp", function() harpoon:list():prev({ui_nav_wrap = true}) end, desc = "previous mark" },
})

-- bufferline
wk.add({
    { "<leader>b", group = "bufferline" },
    { "<leader>bp", function() vim.cmd(":BufferLinePick") end, desc = "pick" },
    { "<leader>bl", function() vim.cmd(":BufferLineCycleNext") end, desc = "next" },
    { "<leader>bh", function() vim.cmd(":BufferLineCyclePrev") end, desc = "prev" },
    { "<leader>bm", function() vim.cmd(":BufferLineMoveNext") end, desc = "move next" },
    { "<leader>bn", function() vim.cmd(":BufferLineMovePrev") end, desc = "move prev" },
})
vim.keymap.set("n", "<M-1>", ":BufferLineGoToBuffer 1 <CR>", {})
vim.keymap.set("n", "<M-2>", ":BufferLineGoToBuffer 2 <CR>", {})
vim.keymap.set("n", "<M-3>", ":BufferLineGoToBuffer 3 <CR>", {})
vim.keymap.set("n", "<M-4>", ":BufferLineGoToBuffer 4 <CR>", {})
vim.keymap.set("n", "<M-5>", ":BufferLineGoToBuffer 5 <CR>", {})
vim.keymap.set("n", "<M-h>", ":BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<M-l>", ":BufferLineCycleNext<CR>", {})

-- toggleterm
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})

-- noice
wk.add({
    { "<leader>n", group = "noice" },
    { "<leader>nd", function() vim.cmd(":Noice dismiss") end, desc = "dismiss noice"},
    { "<leader>nt", function() vim.cmd(":Noice telescope") end, desc= "telescope"},
})

-- alpha
wk.add({
    { "<leader>a", function() vim.cmd(":Alpha") end, desc = "alpha" }
})

-- auto-session
wk.add({
    { "<leader>r", group = "session" },
    { "<leader>rr", require("auto-session.session-lens").search_session, desc = "restore" },
    { "<leader>rd", function() vim.cmd(":Autosession delete") end, desc = "delete" },
})
