{pkgs, ...}: {
  home.packages = with pkgs; [
    corefonts
    maple-mono.CN
    iosevka
    nerd-fonts.mononoki
    noto-fonts
    texlivePackages.opensans
    texlivePackages.jetbrainsmono-otf
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = let
    in {
      monospace = ["Mononoki Nerd Font Mono"];
      serif = ["Times New Roman"];
      sansSerif = ["Trebuchet MS"];
    };
  };
}
