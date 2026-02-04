{...}: {
  programs.nvf.settings.vim = {
    autocomplete = {
      nvim-cmp.enable = true;
    };

    ui.borders.plugins.nvim-cmp = {
      enable = true;
      style = "single";
    };
  };
}
