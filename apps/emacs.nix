{ pkgs, ... }:
{
  stylix.targets.emacs.enable = false;

  home.packages = with pkgs; [ ispell biber ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    client.enable = true;
  };

 home.file.".local/share/emacs/themes" = {
   source = ../assets/emacs;
   recursive = true;
 };

  home.file.".emacs.d" =
    let
      myEmacsConfig = pkgs.stdenv.mkDerivation {
        name = "emacs-config";
        src = pkgs.fetchFromGitHub {
          owner = "permania";
          repo = "emacs";
          rev = "main";
          sha256 = "sha256-xbCVFaca9XSRuq+X5x2ibKnResD/Z6iWmTg1pSmcV/s=";
        };
        buildInputs = [ pkgs.emacs ];
        buildPhase = ''
          emacs --batch --eval "(require 'org)" \
          --eval "(org-babel-tangle-file \"init.org\")"
        '';
        installPhase = ''
          mkdir -p $out
          cp -r * $out/ 2>/dev/null
        '';
      };
    in
    {
      source = myEmacsConfig;
      recursive = false;
    };

  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        scheme-medium
        latexmk
        xetex
        wrapfig
        capt-of
        siunitx
        censor
        tokcycle
        pbox
        biblatex
        biblatex-mla
        ;
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
      postNew = ''
        notmuch tag +sent from:"26c.william@ptschools.org"
        notmuch tag +drafts folder:"Maildir/school/[Gmail]/Drafts"
        notmuch tag +trash folder:"Maildir/school/[Gmail]/Trash"
      '';
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
      # signature = {
      #   text = '''';
      #   showSignature = "append";
      # };
      passwordCommand = "pass show api/gmail/school";
      smtp = {
        host = "smtp.gmail.com";
      };
      userName = "26c.william@ptschools.org";
    };
  };
}
