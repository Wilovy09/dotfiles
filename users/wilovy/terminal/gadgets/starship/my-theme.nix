{...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = ''
        (($git_branch) ($nodejs)($rust)($python)($git_status))($nix_shell)$directory$character
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
        conflicted = "🔪$\{count\} ";
        ahead = "🏎️$\{count\} ";
        behind = "🐢$\{count\} ";
        diverged = "🏎️$\{ahead_count\} 🐢$\{behind_count\} ";
        up_to_date = "💯";
        untracked = "🤷$\{count\} ";
        stashed = "📦$\{count\} ";
        modified = "📝$\{count\} ";
        staged = "✅$\{count\} ";
        renamed = "🚚$\{count\} ";
        deleted = "🗑️$\{count\} ";
      };
      character = {
        success_symbol = "[󱐋](bold yellow)";
        error_symbol = "[󱐋](bold red)";
      };
      rust = {
        symbol = "🦀";
        style = "fg:#f65308";
        format = "[$symbol$version ]($style)";
      };
      nodejs = {
        symbol = "🐢";
        style = "fg:#83cd29";
        format = "[$symbol$version ]($style)";
      };
      python = {
        symbol = "🐍";
        style = "fg:#FF0";
        format = "[$symbol$version ]($style)";
      };
      golang = {
        symbol = "🦦";
        style = "fg:#78d5fd";
        format = "[$symbol$version ]($style)";
      };
      swift = {
        symbol = "🦒";
        style = "fg:#F4993A";
        format = "[$symbol$version ]($style)";
      };
      dotnet = {
        symbol = "🟣";
        style = "fg:#4e29ce";
        format = "[$symbol$version ]($style)";
      };
    };
  };
}
