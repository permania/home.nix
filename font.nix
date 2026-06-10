{pkgs, ...}: {
  home.packages = with pkgs; [
    cozette
    corefonts
    maple-mono.CN
    iosevka
    nerd-fonts.mononoki
    noto-fonts
    sitelen-seli-kiwen
    texlivePackages.opensans
    texlivePackages.jetbrainsmono-otf
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts =
      {
        monospace = ["Cozette"];
        serif = ["Times New Roman"];
        sansSerif = ["Trebuchet MS"];
      };
  };
}
