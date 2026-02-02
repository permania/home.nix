{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    client.enable = true;
  };

  home.file.".emacs.d" = let
    myEmacsConfig = pkgs.stdenv.mkDerivation {
      name = "emacs-config";
      src = pkgs.fetchFromGitHub {
        owner = "permania";
        repo = "emacs";
        rev = "main";
        sha256 = "sha256-UBgRA+OgitC7NiQgFQ0QsJ4oUYDXoZG1+w6jPP+1Euw=";
      };
      buildInputs = [pkgs.emacs];
      buildPhase = ''
        emacs --batch --eval "(require 'org)" \
        --eval "(org-babel-tangle-file \"init.org\")"
      '';
      installPhase = ''
        mkdir -p $out
        cp -r * $out/ 2>/dev/null
      '';
    };
  in {
    source = myEmacsConfig;
    recursive = false;
  };

  programs.ripgrep.enable = true;
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs) scheme-medium latexmk xetex wrapfig capt-of;
      #amsmath
      #collection-fontsrecommended
    };
  };
}
