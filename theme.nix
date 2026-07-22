{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;

  home.pointerCursor.enable = true;

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    fonts = {
      serif = {
        package = pkgs.corefonts;
        name = "Times New Roman";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.mononoki;
        name = "Mononoki Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };

    cursor = {
      name = "Posy_Cursor_Mono_Black";
      size = 24;
      package = pkgs.posy-cursors;
    };
  };
}
