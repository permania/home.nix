{
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    cycle = true;
    modes = ["drun"];
    extraConfig = {
      display-drun = "run";
      drun-display-format = "{name}";
      drun-match-fields = "name,exec";
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "#window" = {
        border = 3;
        border-radius = 0;
        padding = 5;
      };

      "#mainbox" = {
        border = 0;
        padding = 0;
      };

      "#message" = {
        border = "1px dash 0px 0px";
        padding = 1;
      };

      "#listview" = {
        fixed-height = 0;
        border = "2px dash 0px 0px";
        spacing = 0;
        scrollbar = false;
        padding = "2px 0px 0px";
      };

      "#element" = {
        border = 0;
        padding = 1;
      };


      "#scrollbar" = {
        width = 2;
        border = 0;
        handle-width = 8;
        padding = 0;
      };

      "#sidebar" = {
        border = "2px dash 0px 0px";
      };

      "#inputbar" = {
        spacing = 0;
        padding = 1;
        children = mkLiteral "[ prompt,textbox-prompt-colon,entry,case-indicator ]";
      };

      "#case-indicator" = {
        spacing = 0;
      };

      "#entry" = {
        spacing = 0;
      };

      "#prompt" = {
        spacing = 0;
      };

      "#textbox-prompt-colon" = {
        expand = false;
        str = ":";
        margin = "0px 0.3em 0em 0em";
      };

      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
    };
  };
}
