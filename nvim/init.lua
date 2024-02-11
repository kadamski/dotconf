-- generic settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
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
vim.g.transparent_enabled = true

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

require("lazy").setup("plugins")
require("keymaps")
