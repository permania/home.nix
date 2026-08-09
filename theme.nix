{pkgs, ...}: let
  berkeley-mono = pkgs.stdenv.mkDerivation {
    pname = "berkeley-mono";
    version = "1.0";

    src = ./assets/berkeley-mono.zip;

    nativeBuildInputs = [pkgs.unzip];

    unpackPhase = ''
      unzip $src -d source
    '';

    installPhase = ''
      mkdir -p $out/share/fonts/opentype
      cp -r source/berkeley-mono/*.otf $out/share/fonts/opentype/
    '';

    meta = {
      description = "";
      platforms = pkgs.lib.platforms.all;
    };
  };
in {
  fonts.fontconfig.enable = true;

  home.pointerCursor.enable = true;

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-dark.yaml";

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
        package = berkeley-mono;
        name = "Berkeley Mono";
      };
      emoji = {
        package = pkgs.twemoji-color-font;
        name = "Twitter Color Emoji";
      };
    };

    cursor = {
      name = "Posy_Cursor_Mono_Black";
      size = 24;
      package = pkgs.posy-cursors;
    };
  };
}
