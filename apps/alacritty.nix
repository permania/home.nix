{
  config,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = lib.mkForce 9.0;

      window = {
        opacity = 1.0;
        padding = {
          x = 8;
          y = 8;
        };
      };
      terminal.shell.program = "fish";

      general.live_config_reload = true;
    };
  };
}
