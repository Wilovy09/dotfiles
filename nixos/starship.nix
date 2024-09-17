{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = ''
        ($git_branch) ($git_status)($nix_shell)($nodejs)($golang)($rust)($python)$directory$character
      '';
      directory = {
        format = "[󰉋 ](fg:#D8A657 bg:none)[$path ](fg:#D8A657 bg:none)";
        truncation_length = 3;
        truncate_to_repo = false;
      };
      nix_shell = {
        format = "[ ](fg:##54b5c7 bg:none)";
        symbol = "nix ";
      };
      git_branch = {
        format = "[󰘬 ](fg:#FFFFFF bg:none)[$branch](fg:#988BC7 bg:none)(fg:#FFFFFF bg:none)";
      };
      git_status = {
        format = "[$all_status $ahead_behind]($style)\n";
        style = "fg:#F0F0F0 bg:none";
        conflicted = " 🔪";
        ahead = " 🏎️$\{count\}";
        behind = " 🐢$\{count\}";
        diverged = " 🏎️$\{ahead_count\}🐢$\{behind_count\}";
        up_to_date = " 💯";
        untracked = " 🤷$\{count\}";
        stashed = " 📦";
        modified = " 📝$\{count\}";
        staged = " ✅$\{count\}";
        renamed = " ✏️$\{count\}";
        deleted = " 🗑️$\{count\}";
      };
      character = {
        success_symbol = "[󱐋](bold yellow)";
        error_symbol = "[󱐋](bold red)";
      };
      nodejs = {
        symbol = "🐢";
        style = "fg:#83cd29";
        format = "[$symbol]($style)";
      };
      golang = {
        symbol = "🦦";
        style = "fg:#78d5fd";
        format = "[$symbol]($style)";
      };
      rust = {
        symbol = "🦀";
        style = "fg:#f65308";
        format = "[$symbol]($style)";
      };
      python = {
        symbol = "🐍";
        style = "fg:#fee262";
        format = "[$symbol]($style)";
      };
    };
  };
}
