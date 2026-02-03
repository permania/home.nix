{
  pkgs,
  config,
  inputs,
  ...
}: {
  targets.genericLinux.enable = false; # true on non-nixos
  programs.home-manager.enable = true;

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./font.nix
    ./theme.nix
    ./dev.nix
    ./shell.nix
    ./qtile.nix

    ./apps/alacritty.nix
    ./apps/zathura.nix
    ./apps/nitrogen.nix
    ./apps/brave.nix
    ./apps/rofi.nix
    ./apps/starship.nix
    ./apps/emacs.nix
    ./apps/gpg.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

  home = {
    username = "corn";
    homeDirectory = "/home/corn";
    stateVersion = "25.05";
  };
}
