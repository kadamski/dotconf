local wk = require("which-key")

-- brackets
wk.register({
    b = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" }
}, { prefix = "]"})

wk.register({
    b = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" }
}, { prefix = "["})

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<C-\'>', telescope.oldfiles, {})
wk.register({
    f = {
        name = "telescope",
        f = { telescope.find_files, "find files" },
        r = { telescope.oldfiles, "recent files" },
        b = { telescope.buffers, "buffers" },
        h = { telescope.help_tags, "help tags" },
        g = { telescope.live_grep, "grep" },
        m = { telescope.marks, "marks" },
        s = { telescope.lsp_document_symbols, "document symbols" },
    }
}, { prefix = "<leader>" })

-- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
wk.register({
    l = {
        name = "lsp",
        d = { vim.lsp.buf.definition, "definition" },
        r = { vim.lsp.buf.references, "references" },
        c = { vim.lsp.buf.code_action, "code action" },
        h = { vim.lsp.buf.hover, "hover" },
        n = { vim.lsp.buf.rename, "rename" },
    }
}, { prefix = "<leader>" })

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

wk.register({
    h = {
        name = "harpoon",
        a = { function() harpoon:list():append() end, "add mark" },
        c = { function() harpoon:list():clear() end, "clear mark" },
        r = { function() harpoon:list():remove() end, "remove mark" },
        p = { function() harpoon:list():prev({ui_nav_wrap = true}) end, "previous mark" },
    }
}, { prefix = "<leader>" })

-- bufferline
wk.register({
    b = {
        name = "bufferline",
        p = { function() vim.cmd(":BufferLinePick") end, "pick" },
        l = { function() vim.cmd(":BufferLineCycleNext") end, "next" },
        h = { function() vim.cmd(":BufferLineCyclePrev") end, "prev" },
        m = { function() vim.cmd(":BufferLineMoveNext") end, "move next" },
        n = { function() vim.cmd(":BufferLineMovePrev") end, "move prev" },
    }
}, { prefix = "<leader>" })
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
wk.register({
    n = {
        name = "noice",
        d = { function() vim.cmd(":Noice dismiss") end, "dismiss noice"},
        t = { function() vim.cmd(":Noice telescope") end, "telescope"},
    }
}, { prefix = "<leader>" })

-- alpha
wk.register({
    a = {
        function() vim.cmd(":Alpha") end,
        "alpha"
    }
}, { prefix = "<leader>"})

-- auto-session
wk.register({
    r = {
        name = "session",
        r = { require("auto-session.session-lens").search_session, "restore" },
        d = { function() vim.cmd(":Autosession delete") end, "delete" },
    }
}, { prefix = "<leader>"})
