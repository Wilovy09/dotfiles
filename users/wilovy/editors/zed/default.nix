{lib, ...}: let
  jsonGenerator = lib.generators.toJSON {};
in {
  xdg.configFile."zed/keymap.json".source = ./keymap.json;
  xdg.configFile."zed/tasks.json".source = ./tasks.json;
  xdg.configFile."zed/settings.json".text = jsonGenerator {
    assistant = {
      default_model = {
        provider = "copilot_chat";
        model = "gpt-4o";
      };
      version = "2";
    };
    show_whitespaces = "selection";
    wrap_guides = [80];
    toolbar = {
      breadcrumbs = false;
      quick_actions = false;
    };
    show_inline_completions = true;
    inlay_hints = {
      enabled = true;
      show_type_hints = true;
      show_parameter_hints = true;
      show_other_hints = true;
    };
    project_panel = {
      dock = "left";
    };
    file_types = {
      XML = ["csproj" "csproj.nuget.g.props" "csproj.nuget.g.targets"];
      JSON = ["nuget.cache"];
    };
    vim_mode = true;
    ui_font_size = 16;
    buffer_font_size = 16;
    theme = {
      mode = "dark";
      light = "Gruvbox Light";
      dark = "Gruvbox Dark";
    };
    calls = {
      mute_on_join = false;
      share_on_join = false;
    };
    autosave = "on_focus_change";
    format_on_save = "on";
    soft_wrap = "editor_width";
    tabs = {
      close_position = "right";
      file_icons = true;
      git_status = true;
      activate_on_close = "neighbour";
    };
    languages = {
      JavaScript = {
        formatter = {
          external = {
            command = "prettier";
            arguments = ["--stdin-filepath" "{buffer_path}"];
          };
        };
      };
      CSharp = {
        format_on_save = "on";
        preferred_line_length = 80;
        remove_trailing_whitespace_on_save = true;
      };
      Nix = {
        language_servers = ["nixd" "!nil"];
      };
    };
    lsp = {
      "rust-analyzer" = {
        binary = {
          path_lookup = true;
        };
        initialization_options = {
          cachePriming = false;
          check = {
            features = "all";
          };
          cargo = {
            features = "all";
            allTargets = false;
            buildScripts = true;
          };
          diagnostics = {
            experimental = true;
          };
          imports = {
            prefix = "self";
            granularity = {
              group = "module";
            };
          };
        };
      };
      omnisharp = {
        binary = {
          path = "/etc/profiles/per-user/wilovy/bin/OmniSharp";
          arguments = ["-lsp"];
        };
      };
      nixd = {
        settings = {
          diagnostic = {
            suppress = ["sema-extra-with"];
          };
        };
      };
      discord_presence = {
        initialization_options = {
          base_icons_url = "https://raw.githubusercontent.com/xhyrom/zed-discord-presence/main/assets/icons/";
          state = "Working on {filename}";
          details = "In {workspace}";
          large_image = "{base_icons_url}/{language}.png";
          large_text = "{language:u}";
          small_image = "{base_icons_url}/zed.png";
          small_text = "Zed";
          rules = {
            mode = "blacklist";
            paths = ["absolute path"];
          };
          git_integration = true;
        };
      };
    };
  };
}
