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
vim.keymap.set("n", "<C-\\>", function() harpoon:list():prev({ui_nav_wrap = true}) end)

wk.register({
    h = {
        name = "harpoon",
        a = { function() harpoon:list():append() end, "add mark" },
        c = { function() harpoon:list():clear() end, "clear mark" },
        r = { function() harpoon:list():remove() end, "remove mark" },
        p = { function() harpoon:list():prev({ui_nav_wrap = true}) end, "previous mark" },
    }
}, { prefix = "<leader>" })

-- auto-session
wk.register({
    r = {
        name = "session",
        r = { require("auto-session.session-lens").search_session, "restore" },
        d = { function() vim.cmd(":Autosession delete") end, "delete" },
    }
}, { prefix = "<leader>"})
