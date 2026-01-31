-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent_background = true,
            term_colors = false,
            no_italic = true,
            custom_highlights = function(colors)
                return {
                    LineNr = { fg = colors.mauve },
                    CursorLineNr = { fg = colors.yellow, style = { "bold" } },
                    SignColumn = { bg = "NONE" },
                }
            end
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
        end,
    },
    -- Which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps" },
        },
        opts = {
            delay = 1000,
            spec = {
                { "<leader>w", proxy = "<c-w>", group = "windows" }
            },
        },
    },
    -- Rust
    { 'mrcjkb/rustaceanvim', version = '^7', lazy = false },
    -- Import plugins from lua/plugins/
    { import = "plugins" },
})
