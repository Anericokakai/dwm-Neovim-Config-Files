local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " "

local plugins={



   {
  'nvim-telescope/telescope.nvim', version = '0.1.8',
-- or                            , branch = '0.1.x',
  dependecies = { {'nvim-lua/plenary.nvim'} }
},
    'nvim-telescope/telescope-ui-select.nvim',
{ 'projekt0n/github-nvim-theme' },

  'nvim-treesitter/nvim-treesitter', build= ':TSUpdate',
 'nvim-treesitter/playground',
 'mbbill/undotree',

 --cmp plugins
'hrsh7th/cmp-buffer',
 'hrsh7th/cmp-path',
 'hrsh7th/cmp-cmdline',
 'hrsh7th/nvim-cmp',
 'hrsh7th/cmp-nvim-lsp'
    ,

 'nvimtools/none-ls.nvim',




--snippets
{
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets",'saadparwaiz1/cmp_luasnip' , },

  config = function()
    require("luasnip.loaders.from_vscode").lazy_load() -- Lazy load the snippets
  end,

},
{ "rafamadriz/friendly-snippets" },


    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},


--Language support 

"neovim/nvim-lspconfig",
'williamboman/nvim-lsp-installer'
    ,

'williamboman/mason.nvim'
,
"williamboman/mason-lspconfig.nvim", -- lazy.nvim
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
},
    -- Alpha Tree sitter

    {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
}

}

require("lazy").setup(plugins,{})
