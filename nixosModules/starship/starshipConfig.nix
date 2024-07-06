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
        ($nodejs)($golang)($rust)($python) ($git_branch) ($git_status)($line_break)$directory$character
      '';
      # os = {
      #   format = "[$symbol]($style)";
      #   symbols.NixOS = "  ";
      #   style = "fg:#5376c3 bg:none";
      #   disabled = false;
      # };
      directory = {
        format = "[󰉋 ](fg:#D8A657 bg:none)[$path ](fg:#D8A657 bg:none)";
        truncation_length = 3;
        truncate_to_repo = false;
      };

      git_branch = {
        format = "[󰘬 ](fg:#FFFFFF bg:none)[$branch](fg:#FFFFFF bg:none)";
      };

      git_status = {
        format = "[$all_status $ahead_behind]($style)";
        style = "fg:#F0F0F0 bg:none";
        conflicted = " ⚔️";
        ahead = " 🏎️$\{count\}";
        behind = " 🐢$\{count\}";
        diverged = " 🏎️$\{ahead_count\}🐢$\{behind_count\}";
        up_to_date = " 💯";
        untracked = " 🤷$\{count\}";
        stashed = " 📦";
        modified = " 📝$\{count\}";
        staged = " ++$\{count\}";
        renamed = " ✍️$\{count\}";
        deleted = " 🗑️$\{count\}";
      };
      character = {
        success_symbol = "[󱐋](bold yellow)";
        error_symbol = "[󱐋](bold red)";
      };
      nodejs = {
        symbol = " ";
        style = "fg:#83cd29";
        format = "[$symbol]($style)";
      };
      golang = {
        symbol = " ";
        style = "fg:#78d5fd";
        format = "[$symbol]($style)";
      };
      rust = {
        symbol = " ";
        style = "fg:#f65308";
        format = "[$symbol]($style)";
      };
      python = {
        symbol = " ";
        style = "fg:#fee262";
        format = "[$symbol]($style)";
      };
    };
  };
}
