{pkgs, ...}:{
  programs.neovim.enable = true;

  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua".source = ./lua;
    "nvim/.luarc.json".source = ./.luarc.json;
  };

  home.packages = with pkgs; [
    lua-language-server
    stylua

    nil
    nixd

    rust-analyzer
    rustfmt

    omnisharp-roslyn
    csharpier
    vue-language-server
    astro-language-server
    prettierd
    typescript-language-server
    deno
    eslint_d
    tailwindcss-language-server
    emmet-language-server
  ];
}
