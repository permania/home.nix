{pkgs, ...}: {
  home.packages = with pkgs; [
    corefonts
    maple-mono.CN
    noto-fonts
    texlivePackages.opensans
    texlivePackages.jetbrainsmono-otf
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = let
    in {
      monospace = ["Jetbrains Mono"];
      serif = ["Times New Roman"];
      sansSerif = ["Trebuchet MS"];
    };
  };
}
