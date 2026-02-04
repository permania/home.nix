{pkgs, ...}: {
  programs.fish = {
    enable = true;
    shellAliases = {};
    functions = {
      "fish_greeting".body = "";
      "ls".body = "eza --long --group-directories-last --all --icons --no-time $argv";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.eza = {
    enable = true;
    git = true;
    enableFishIntegration = false;
  };
  programs.carapace = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.pay-respects = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    silent = true;
    nix-direnv.enable = true;
  };
}
