{inputs, ...}: {
  targets.genericLinux.enable = false; # true on non-nixos
  programs.home-manager.enable = true;

  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.stylix.homeModules.stylix
    ./theme.nix
    ./dev.nix
    ./lsp.nix
    ./shell.nix
    ./qtile.nix
    ./xsession.nix
    ./picom.nix

    ./apps/alacritty.nix
    ./apps/zathura.nix
    ./apps/nitrogen.nix
    ./apps/chromium.nix
    ./apps/rofi.nix
    ./apps/dunst.nix
    ./apps/starship.nix
    ./apps/emacs.nix
    ./apps/btop.nix
    ./apps/bat.nix
    ./apps/beets.nix
    ./apps/gpg.nix
    ./apps/gnupass.nix
    ./apps/freecad.nix

    # ./apps/nvim/nvim.nix
  ];

  home = {
    username = "corn";
    homeDirectory = "/home/corn";
    stateVersion = "25.05";
  };
}
