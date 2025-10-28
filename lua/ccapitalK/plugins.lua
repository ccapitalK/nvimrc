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
    use {'neovim/nvim-lspconfig'}             -- Required
    use {                                      -- Optional
      'mason-org/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    }
    use {'mason-org/mason-lspconfig.nvim'} -- Optional
    use {'hrsh7th/nvim-cmp'}     -- Required
    use {'hrsh7th/cmp-nvim-lsp'} -- Required
    use {'L3MON4D3/LuaSnip'}     -- Required

    -- Solarized
    use {
        'maxmx03/solarized.nvim',
        config = function()
          vim.o.background = 'dark' -- or 'light'

          vim.cmd.colorscheme 'solarized'
        end
    }
end)
