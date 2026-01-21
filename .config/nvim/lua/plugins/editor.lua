return {
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            on_attach = function(bufnr)
                local gs = require('gitsigns')
                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end
                
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gs.nav_hunk('next')
                    end
                end, {desc = 'Next hunk'})
                
                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gs.nav_hunk('prev')
                    end
                end, {desc = 'Prev hunk'})
                
                map('n', '<leader>hs', gs.stage_hunk, {desc = 'Stage hunk'})
                map('n', '<leader>hr', gs.reset_hunk, {desc = 'Reset hunk'})
                map('n', '<leader>hu', gs.undo_stage_hunk, {desc = 'Undo stage hunk'})
                map('n', '<leader>hp', gs.preview_hunk, {desc = 'Preview hunk'})
                map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = 'Toggle blame'})
            end,
        },
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        version = '^1.0.0',
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 
            'nvim-tree/nvim-web-devicons',
            'SmiteshP/nvim-navic',
        },
        opts = {
            winbar = {
                lualine_c = {"filename", { "navic", color_correction = nil }, }
            },
            inactive_winbar = {
                lualine_c = { { cond = function() return vim.api.nvim_win_get_config(0).relative == "" end } },
            },
            sections = {
                lualine_c = { {"filename", path = 1 }},
            },
            options = {
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    winbar = { "snacks_dashboard", "help", "trouble", "qf" },
                },
            },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {},
    },
    {
        'stevearc/conform.nvim',
        opts = {
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    },
}
