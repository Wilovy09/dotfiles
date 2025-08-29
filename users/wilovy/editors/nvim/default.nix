{pkgs, ...}: {
  programs.neovim.enable = true;

  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/lua".source = ./lua;
    "nvim/.luarc.json".source = ./.luarc.json;
  };

  home.packages = with pkgs; [
    # Lua
    lua-language-server
    stylua

    # Nix
    nil
    nixd

    # Rust
    rust-analyzer
    rustfmt

    # Web / TS / Vue
    vtsls
    vue-language-server
    astro-language-server
    tailwindcss-language-server
    emmet-language-server
    deno

    # Formatting / lint
    prettierd
    eslint_d

    # CSharp
    omnisharp-roslyn
    csharpier
  ];
}
