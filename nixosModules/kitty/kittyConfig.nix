{ config, lib, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      font_family = "JetBrains Mono Regular";
      fallback_fonts = "Terminus Nerd Font";
      font_size = "13";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      mouse_hide_wait = "2.0";
      cursor_shape = "block";
      url_color = "#0087bd";
      url_style = "dotted";
      confirm_os_window_close = "0";
      background_opacity = "1";
      enabled_layouts = "*";
    };
  };
}
