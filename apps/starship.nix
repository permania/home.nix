{
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$directory"
        " "
        "$nix_shell"
        "$character"
      ];

      add_newline = false;

      right_format = lib.concatStrings [
        "$git_commit"
      ];

      username = {
        format = "[ $user ]($style)";
        style_user = "yellow";
        show_always = true;
      };

      status = {
        format = "[exit code $status ]($style)";
        style = "comment";
        disabled = false;
      };

      cmd_duration = {
        format = "[in $duration]($style)";
        style = "comment";
        min_time = 0;
        show_notifications = true;
        show_milliseconds = true;
        disabled = false;
      };

      character = {
        success_symbol = "[λ](bold blue)";
        error_symbol = "[λ](bold red)";
      };

      directory = {
        truncation_length = 2;
        truncation_symbol = "";
        format = "[$read_only]($read_only_style)[$path]($style)";
        style = "yellow";
        read_only = "RO:";
        read_only_style = "red";
      };

      git_branch = {
        always_show_remote = true;
        format = " $remote_name:$branch";
        style = "bold purple";
        symbol = "";
        disabled = false;
      };

      git_commit = {
        commit_hash_length = 7;
        format = "[ $hash]($style)";
        style = "purple";
        only_detached = false;
        disabled = false;
      };

      nix_shell = {
        symbol = "+nix ";
        format = "[$symbol](blue)";
      };

      palettes.nix = {
        background = "#${config.lib.stylix.colors.base01}";
        darkbg = "#${config.lib.stylix.colors.base00}";
        lightbg = "#${config.lib.stylix.colors.base02}";
        foreground = "#${config.lib.stylix.colors.base05}";
        lightfg = "#${config.lib.stylix.colors.base06}";
        darkfg = "#${config.lib.stylix.colors.base04}";
        black = "#${config.lib.stylix.colors.base03}";
        red = "#${config.lib.stylix.colors.base0E}";
        green = "#${config.lib.stylix.colors.base0D}";
        yellow = "#${config.lib.stylix.colors.base0A}";
        blue = "#${config.lib.stylix.colors.base08}";
        magenta = "#${config.lib.stylix.colors.base09}";
        cyan = "#${config.lib.stylix.colors.base0B}";
        white = "#${config.lib.stylix.colors.base0F}";
      };
    };
  };
}
