{ ... }: {
  xdg.configFile."qtile" = let
    config = pkgs.stdenv.mkDerivation {
      name = "qtile-config";
      src = pkgs.fetchFromGitHub {
        owner = "permania";
        repo = "emacs";
        rev = "main";
        sha256 = "";
      };
      buildInputs = [];
      buildPhase = '''';
      installPhase = ''
        mkdir -p $out
        cp -r * $out/ 2>/dev/null
      '';
    };
  in {
    source = config;
    recursive = false;
  };
}
