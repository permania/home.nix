{config, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 1.0;
        padding = {
          x = 0;
          y = 8;
        };
      };
      terminal.shell.program = "fish";

      colors = {
        normal = {
          black = "#${config.colorScheme.palette.base00}";
          red = "#${config.colorScheme.palette.base08}";
          green = "#${config.colorScheme.palette.base0B}";
          yellow = "#${config.colorScheme.palette.base0A}";
          blue = "#${config.colorScheme.palette.base0D}";
          magenta = "#${config.colorScheme.palette.base0E}";
          cyan = "#${config.colorScheme.palette.base0C}";
          white = "#${config.colorScheme.palette.base05}";
        };

        primary = {
          background = "#${config.colorScheme.palette.base00}";
          foreground = "#${config.colorScheme.palette.base05}";
        };
      };

      font = {
        size = 7;

        normal = {
          family = "monospace";
          style = "Regular";
        };
      };

      general.live_config_reload = true;
    };
  };
}
