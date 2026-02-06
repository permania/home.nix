{...}: {
  programs = {
    fish = {
      enable = true;
      shellAliases = {};
      functions = {
        "fish_greeting".body = "";
        "ls".body = "eza --long --group-directories-last --all --icons --no-time $argv";
      };
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    eza = {
      enable = true;
      git = true;
      enableFishIntegration = false;
    };
    carapace = {
      enable = true;
      enableFishIntegration = true;
    };
    nix-your-shell = {
      enable = true;
      enableFishIntegration = true;
    };
    atuin = {
      enable = true;
      enableFishIntegration = true;
    };
    pay-respects = {
      enable = true;
      enableFishIntegration = true;
    };
    direnv = {
      enable = true;
      enableFishIntegration = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
