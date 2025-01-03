{pkgs, ...}: {
  programs.neovim.enable = true;

  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua".source = ./lua;
  };

  home.packages = with pkgs; [
    lua-language-server
    rust-analyzer
    rustfmt
  ];
}
