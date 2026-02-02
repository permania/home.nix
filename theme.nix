{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
    iconTheme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
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
