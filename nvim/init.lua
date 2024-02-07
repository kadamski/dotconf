-- generic settings
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showmatch = true
vim.opt.listchars = { tab = "▸ ", eol = "¬", nbsp = "␣", trail = "·" }
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.g.mapleader = " "

-- plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
    { "nvim-telescope/telescope.nvim", tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" }},
    { "EdenEast/nightfox.nvim"},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "alexghergh/nvim-tmux-navigation" },
    { "nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' }},
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy"},
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },
    { "ethanholz/nvim-lastplace" },
    { "numToStr/Comment.nvim", },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

     {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        enabled = false,
      })
    end
  },
}

opts = {}
require("lazy").setup(plugins, opts)

-- plugins related settings
-- - telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
        ensure_installed = { "c", "lua", "luadoc", "vim", "vimdoc" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
})

-- harpoon
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end)
vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end)
--vim.keymap.set("n", "<C-e>">, function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev({ui_nav_wrap = true}) end)
vim.keymap.set("n", "<C-\\>", function() harpoon:list():prev({ui_nav_wrap = true}) end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
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
-- TODO

-- nvim-tmux-navigator
require('nvim-tmux-navigation').setup {
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        next = "<C-Space>",
    }
}

-- statusline
require('lualine').setup({
    options = { theme = "material" },
})

-- surround
require("nvim-surround").setup({
    move_cursor = false,
})

-- gitsigns
require('gitsigns').setup({
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
})

-- comment
require('Comment').setup()

-- lastplace
require("nvim-lastplace").setup({})

-- blankline
require("ibl").setup {
    indent = { char = '┊' },
    scope = { show_start = false, show_end = false }
}

-- catppucin
require("catppuccin").setup({
    background = { -- :h background
        light = "frappe",
        dark = "mocha",
    },
    transparent_background = true,
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.1, -- percentage of the shade to apply to the inactive window
    },
})

require("nightfox").setup({
    options = {
        transparent = true,
        dim_inactive = true,
    }
})

-- vim.cmd.colorscheme("carbonfox")
vim.cmd.colorscheme("catppuccin")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) 
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) 
-- vim.cmd.colorscheme("habamax")


