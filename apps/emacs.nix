{pkgs, ...}: {
  home.packages = with pkgs; [ispell];

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
        sha256 = "sha256-f3oQCyBJ9GCHzLNiFlVrN9LnBCYnlI7ciOoxeoD7awA=";
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

  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs) scheme-medium latexmk xetex wrapfig capt-of;
      #amsmath
      #collection-fontsrecommended
    };
  };

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync -a";
    };
  };
  accounts.email = {
    accounts."school" = {
      address = "26c.william@ptschools.org";
      imap.host = "imap.gmail.com";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      notmuch.enable = true;
      primary = true;
      realName = "Connor Mika";
      signature = {
        text = ''
          Mit besten Wünschen
          Ben Bals
          https://keybase.io/beb
        '';
        showSignature = "append";
      };
      passwordCommand = "pass show api/gmail/school";
      smtp = {
        host = "smtp.gmail.com";
      };
      userName = "26c.william@ptschools.org";
    };
  };
}
