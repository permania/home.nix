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
    ./alacritty.nix
    ./zathura.nix
    ./nitrogen.nix
    ./brave.nix
    ./rofi.nix
    ./theme.nix
    ./dev.nix
    ./shell.nix
    ./starship.nix
    ./emacs.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.nord;

  home = {
    username = "corn";
    homeDirectory = "/home/corn";
    stateVersion = "25.05";
  };
}
