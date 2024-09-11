{ config, lib, pkgs, ... }:
{
  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;

    "nvim/lua/base/init.lua".source = ./lua/base/init.lua;
    "nvim/lua/base/plugins/init.lua".source = ./lua/base/plugins/init.lua;
    "nvim/lua/base/plugins/lazy.lua".source = ./lua/base/plugins/lazy.lua;

    "nvim/lua/configs/alpha-nvim.lua".source = ./lua/configs/alpha-nvim.lua;
    "nvim/lua/configs/completions.lua".source = ./lua/configs/completions.lua;
    "nvim/lua/configs/cord.lua".source = ./lua/configs/cord.lua;
    "nvim/lua/configs/lazy.lua".source = ./lua/configs/lazy.lua;
    "nvim/lua/configs/lspconfig.lua".source = ./lua/configs/lspconfig.lua;
    "nvim/lua/configs/lualine.lua".source = ./lua/configs/lualine.lua;
    "nvim/lua/configs/mason.lua".source = ./lua/configs/mason.lua;
    "nvim/lua/configs/none-ls.lua".source = ./lua/configs/none-ls.lua;
    "nvim/lua/configs/nvimtree".source = ./lua/configs/nvimtree.lua;
    "nvim/lua/configs/telescope.lua".source = ./lua/configs/telescope.lua;
    "nvim/lua/configs/toogleterm.lua".source = ./lua/configs/toogleterm.lua;
  };
}

