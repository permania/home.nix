{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."qtile/config.py" = {
    enable = true;
    executable = true;

    source = pkgs.replaceVars ./assets/qtile/qtile.py {
      darkbg = config.colorScheme.palette.base00;
      lightbg = config.colorScheme.palette.base02;
      foreground = config.colorScheme.palette.base05;
      darkfg = config.colorScheme.palette.base04;
      yellow = config.colorScheme.palette.base0A;

      # background = config.colorScheme.palette.base01;
      # lightfg = config.colorScheme.palette.base06;
      # black = config.colorScheme.palette.base03;
      # red = config.colorScheme.palette.base0E;
      # green = config.colorScheme.palette.base0D;
      # blue = config.colorScheme.palette.base08;
      # magenta = config.colorScheme.palette.base09;
      # cyan = config.colorScheme.palette.base0B;
      # white = config.colorScheme.palette.base0F;
    };
  };

  xdg.configFile."qtile/autostart" = {
    enable = true;
    executable = true;
    source = ./assets/qtile/autostart;
  };
}
