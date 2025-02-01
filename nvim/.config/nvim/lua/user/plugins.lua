local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({border = "rounded"})
        end
    }
})

-- Install your plugins here
return packer.startup(function(use)
    use {"wbthomason/packer.nvim", commit = "ea0cc3c"} -- Have packer manage itself
    use {"nvim-lua/plenary.nvim", tag = "v0.1.4"} -- Useful lua functions used by lots of plugins
    use {
        "goolord/alpha-nvim",
        commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31"
    } -- dashboard
    use {"folke/which-key.nvim"} -- show keybind compinations
    use {
        "nvim-tree/nvim-tree.lua",
        tag = "v1.7.1",
        requires = "nvim-tree/nvim-web-devicons"
    }

    use {
        "windwp/nvim-autopairs",
        commit = "99f696339266c22e7313d6a85a95bd538c3fc226"
    }

    use {
        "ahmedkhalf/project.nvim",
        commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4"
    }

    use {
        "akinsho/bufferline.nvim",
        tag = "v4.*",
        requires = "nvim-tree/nvim-web-devicons"
    } -- buffer / tab line
    use {"nvim-lualine/lualine.nvim", requires = "nvim-tree/nvim-web-devicons"}

    use {"moll/vim-bbye"}

    use {"lambdalisue/suda.vim", tag = "v1.2.2"} -- sudo write in nvim

    -- completion
    --
    use {
        "hrsh7th/nvim-cmp",
        commit = "d818fd0624205b34e14888358037fb6f5dc51234"
    }
    use {
        "hrsh7th/cmp-buffer",
        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa"
    }
    use {
        "hrsh7th/cmp-path",
        commit = "91ff86cd9c29299a64f968ebb45846c485725f23"
    }
    use {
        "hrsh7th/cmp-cmdline",
        commit = "d250c63aa13ead745e3a40f61fdd3470efde3923"
    }
    use {
        "hrsh7th/cmp-nvim-lsp",
        commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d"
    }

    -- snippets
    use {"L3MON4D3/LuaSnip", tag = "v2.3.0"}
    use {"rafamadriz/friendly-snippets"}

    -- lsp / language server
    use {"neovim/nvim-lspconfig", tag = "v1.0.0"}
    use {"williamboman/mason.nvim", tag = "v1.10.0"}
    use {"williamboman/mason-lspconfig.nvim", tag = "v1.31.0"}
    use {
        "RRethy/vim-illuminate",
        commit = "5eeb7951fc630682c322e88a9bbdae5c224ff0aa"
    } -- for text highlighting
    use {
        "glepnir/lspsaga.nvim",
        commit = "2198c07124bef27ef81335be511c8abfd75db933",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function() require("user.lspsaga") end
    } -- lsp ui
    use {
        "nvimtools/none-ls.nvim",
        commit = "d991c8952defd654ed78cce0abce63a5c06d0bc6",
        requires = "nvim-lua/plenary.nvim"
    } -- formatting

    use {"ron-rs/ron.vim"}

    -- dap / debugging
    use {'mfussenegger/nvim-dap', tag = "0.8.0"}
    use {'rcarriga/nvim-dap-ui', tag = "v4.0.0", requires = 
  "nvim-neotest/nvim-nio"}
    use {'theHamsta/nvim-dap-virtual-text', commit = "76d80c3d171224315b61c006502a1e30c213a9ab"}
    use {
        'mfussenegger/nvim-dap-python',
        commit = "34282820bb713b9a5fdb120ae8dd85c2b3f49b51"
    }

    -- Colorschemes
    use {
        "connorholyday/vim-snazzy",
        commit = "d979964b4dc0d6860f0803696c348c5a912afb9e"
    }
    use {"RRethy/nvim-base16"}

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    }

    -- git
    use {"lewis6991/gitsigns.nvim", tag = "v0.7"}

    -- show color codes
    use {"NvChad/nvim-colorizer.lua"}

    -- yuck filetype for eww
    use {
        "https://github.com/elkowar/yuck.vim",
        commit = "9b5e0370f70cc30383e1dabd6c215475915fe5c3"
    }
    -- earthly syntax highlighting
    use {"https://github.com/earthly/earthly.vim"}
    -- helm syntax highlighting and filetype detection
    use {
        "https://github.com/towolf/vim-helm",
        commit = "86cc6766db60b8cc5731068d0c2111dee1f2b328"
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
