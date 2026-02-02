{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
    iconTheme = {
      name = "Nordzy";
      package = pkgs.nordzy-icon-theme;
    };
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "Posy_Cursor";
    size = 24;
    package = pkgs.posy-cursors;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Posy_Cursor";
    XCURSOR_SIZE = 24;
  };
}
