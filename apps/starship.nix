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
      palette = "nix";

      format = lib.concatStrings [
        "$directory" " "
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
        success_symbol = "[λ](bold green)";
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
        background = "#${config.colorScheme.palette.base01}";
        darkbg = "#${config.colorScheme.palette.base00}";
        lightbg = "#${config.colorScheme.palette.base02}";
        foreground = "#${config.colorScheme.palette.base05}";
        lightfg = "#${config.colorScheme.palette.base06}";
        darkfg = "#${config.colorScheme.palette.base04}";
        black = "#${config.colorScheme.palette.base03}";
        red = "#${config.colorScheme.palette.base0E}";
        green = "#${config.colorScheme.palette.base0D}";
        yellow = "#${config.colorScheme.palette.base0A}";
        blue = "#${config.colorScheme.palette.base08}";
        magenta = "#${config.colorScheme.palette.base09}";
        cyan = "#${config.colorScheme.palette.base0B}";
        white = "#${config.colorScheme.palette.base0F}";
      };
    };
  };
}
