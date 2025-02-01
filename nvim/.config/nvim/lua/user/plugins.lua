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

    use {
        "nvimtools/none-ls.nvim",
        commit = "d991c8952defd654ed78cce0abce63a5c06d0bc6",
        requires = "nvim-lua/plenary.nvim"
    } -- formatting


    -- Colorschemes
    use {"RRethy/nvim-base16"}

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- git
    use {"lewis6991/gitsigns.nvim", tag = "v0.7"}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
