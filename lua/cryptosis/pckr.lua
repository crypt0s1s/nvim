local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {
    "nvim-lua/plenary.nvim"; -- don't forget to add this one if you don't have it yet!
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { "nvim-lua/plenary.nvim" }
    };

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' }
    };

    {
        'rose-pine/neovim',
        as = 'rose-pine',
        run = vim.cmd('colorscheme rose-pine')
    };

    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    };

    'mbbill/undotree';
    'tpope/vim-fugitive';
    'williamboman/mason.nvim';
    'williamboman/mason-lspconfig.nvim';

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    };

    {
        'xbase-lab/xbase',
        run = 'make install',     -- or "make install && make free_space" (not recommended, longer build time)
        requires = {
            "neovim/nvim-lspconfig",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require 'xbase'.setup({})  -- see default configuration bellow
        end
    };

    'MunifTanjim/prettier.nvim';
}
