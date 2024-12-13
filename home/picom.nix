{...}: {
  services.picom = {
    enable = true;
    fade = true;
    backend = "glx";
    shadow = true;

    opacityRules = [
      "85:class_g = 'Code'"
      "85:class_g = 'dev.zed.Zed'"
      "85:class_g = 'kitty'"
      "85:class_g = 'rio'"
    ];

    fadeSteps = [0.08 0.08];

    settings = {
      blur = {
        method = "dual_kawase";
        strength = 1;
        background = false;
        background-frame = false;
        background-fixed = false;
      };

      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "class_g = 'Conky'"
        "class_g = 'Cairo-clock'"
      ];

      corner-radius = 0;

      use-damage = true;

      rounded-corners-exclude = [
        "window_type = 'dock'"
      ];

      shadow-exclude = [
        "class_g = 'Polybar'"
        "window_type = 'utility'"
      ];
    };
  };
}
