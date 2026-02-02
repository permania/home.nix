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
    enableFishIntegration = false;
  };
}
