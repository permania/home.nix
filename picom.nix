{...}: {
  services.picom = {
    enable = true;
    backend = "xrender";
    vSync = true;
  };
}
