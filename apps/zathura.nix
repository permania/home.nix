{
  config,
  font,
  ...
}: {
  programs.zathura = {
    enable = true;
    options = {default-bg = "#${config.colorScheme.palette.base00}";};
  };
}
