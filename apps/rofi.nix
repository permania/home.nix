{
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    font = "monospace 12";
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
      "*" = {
        foreground = mkLiteral "#${config.colorScheme.palette.base05}";
        background = mkLiteral "#${config.colorScheme.palette.base00}";
        alternate-background = mkLiteral "#${config.colorScheme.palette.base01}";
        selected-background = mkLiteral "#${config.colorScheme.palette.base02}";
        selected-foreground = mkLiteral "#${config.colorScheme.palette.base05}";
        bordercolor = mkLiteral "#${config.colorScheme.palette.base0A}";
      };

      "#window" = {
        background-color = mkLiteral "@background";
        border = 3;
        border-radius = 0;
        border-color = mkLiteral "@bordercolor";
        padding = 5;
      };

      "#mainbox" = {
        border = 0;
        padding = 0;
        background-color = mkLiteral "@background";
      };

      "#message" = {
        border = "1px dash 0px 0px";
        border-color = mkLiteral "@bordercolor";
        padding = 1;
        background-color = mkLiteral "@background";
      };

      "#textbox" = {
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
      };

      "#listview" = {
        fixed-height = 0;
        border = "2px dash 0px 0px";
        border-color = mkLiteral "@bordercolor";
        spacing = 0;
        scrollbar = false;
        padding = "2px 0px 0px";
        background-color = mkLiteral "@background";
      };

      "#element" = {
        border = 0;
        padding = 1;
        background-color = mkLiteral "@background";
      };

      "#element.normal.normal" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };

      "#element.normal.urgent" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };

      "#element.normal.active" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };

      "#element.selected.normal" = {
        background-color = mkLiteral "@selected-background";
        text-color = mkLiteral "@selected-foreground";
      };

      "#element.selected.urgent" = {
        background-color = mkLiteral "@selected-background";
        text-color = mkLiteral "@selected-foreground";
      };

      "#element.selected.active" = {
        background-color = mkLiteral "@selected-background";
        text-color = mkLiteral "@selected-foreground";
      };

      "#element.alternate.normal" = {
        background-color = mkLiteral "@alternate-background";
        text-color = mkLiteral "@foreground";
      };

      "#element.alternate.urgent" = {
        background-color = mkLiteral "@alternate-background";
        text-color = mkLiteral "@foreground";
      };

      "#element.alternate.active" = {
        background-color = mkLiteral "@alternate-background";
        text-color = mkLiteral "@foreground";
      };

      "#scrollbar" = {
        width = 2;
        border = 0;
        handle-width = 8;
        padding = 0;
        background-color = mkLiteral "@background";
      };

      "#sidebar" = {
        border = "2px dash 0px 0px";
        border-color = mkLiteral "@bordercolor";
        background-color = mkLiteral "@background";
      };

      "#button.selected" = {
        background-color = mkLiteral "@selected-background";
        text-color = mkLiteral "@foreground";
      };

      "#inputbar" = {
        spacing = 0;
        text-color = mkLiteral "@foreground";
        padding = 1;
        children = mkLiteral "[ prompt,textbox-prompt-colon,entry,case-indicator ]";
        background-color = mkLiteral "@background";
      };

      "#case-indicator" = {
        spacing = 0;
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
      };

      "#entry" = {
        spacing = 0;
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
      };

      "#prompt" = {
        spacing = 0;
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
      };

      "#textbox-prompt-colon" = {
        expand = false;
        str = ":";
        margin = "0px 0.3em 0em 0em";
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
      };

      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
    };
  };
}
