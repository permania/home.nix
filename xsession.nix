{...}: {
  home.file.".xinitrc".text = ''
    #!/bin/sh
    . ~/.xsession
  '';

  xsession = {
    enable = true;
    windowManager.command = "qtile start -c ~/.config/qtile/config.py";
    initExtra = "systemctl --user start graphical-session.target";
  };
}
