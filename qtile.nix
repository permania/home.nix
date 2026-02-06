{
  config,
  pkgs,
  lib,
  ...
}: {
  xdg.configFile."qtile/config.py" = {
    enable = true;
    executable = true;

    source = pkgs.replaceVars ./assets/qtile/qtile.py {
      darkbg = config.lib.stylix.colors.base00;
      lightbg = config.lib.stylix.colors.base02;
      foreground = config.lib.stylix.colors.base05;
      darkfg = config.lib.stylix.colors.base04;
      yellow = config.lib.stylix.colors.base0A;

      # background = config.lib.stylix.colors.base01;
      # lightfg = config.lib.stylix.colors.base06;
      # black = config.lib.stylix.colors.base03;
      # red = config.lib.stylix.colors.base0E;
      # green = config.lib.stylix.colors.base0D;
      # blue = config.lib.stylix.colors.base08;
      # magenta = config.lib.stylix.colors.base09;
      # cyan = config.lib.stylix.colors.base0B;
      # white = config.lib.stylix.colors.base0F;
    };
  };

  xdg.configFile."qtile/autostart" = {
    enable = true;
    executable = true;
    source = ./assets/qtile/autostart;
  };

  home.activation.clearQtileCache =
  lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -rf ~/.config/qtile/__pycache__
  '';
}
