{config, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
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
