{pkgs, ...}: {
  home.packages = with pkgs; [
    corefonts
    maple-mono.CN
    iosevka
    noto-fonts
    texlivePackages.opensans
    texlivePackages.jetbrainsmono-otf
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = let
    in {
      monospace = ["Iosevka"];
      serif = ["Times New Roman"];
      sansSerif = ["Trebuchet MS"];
    };
  };
}
