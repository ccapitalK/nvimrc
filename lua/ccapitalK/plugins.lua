vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
    }

	use({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})
    -- Use for plugin dev
	-- use({'nvim-treesitter/playground')

    use('mbbill/undotree')

    -- LSP stuff
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
            pcall(vim.cmd, 'MasonUpdate')
          end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      }
    }
    use {
        'maxmx03/solarized.nvim',
        config = function()
          vim.o.background = 'dark' -- or 'light'

          vim.cmd.colorscheme 'solarized'
        end
    }
end)
