{pkgs, ...}:{
  programs.neovim.enable = true;

  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua".source = ./lua;
    "nvim/.luarc.json".source = ./.luarc.json;
  };

  home.packages = with pkgs; [
    lua-language-server
    rust-analyzer
    rustfmt
    omnisharp-roslyn
    csharpier
    vue-language-server
    astro-language-server
    stylua
    prettierd
    typescript-language-server
    deno
    eslint_d
    tailwindcss-language-server
    nil
    emmet-language-server
    # Kulala deps
    jq
    libxml2
  ];
}
