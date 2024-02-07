return {
    "ThePrimeagen/harpoon",
    even = "VeryLazy",
    branch = "harpoon2", 
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts) 
        require("harpoon").setup(opts)
    end
}
