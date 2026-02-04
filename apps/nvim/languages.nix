{...}: {
  programs.nvf.settings.vim = {
    treesitter.enable = true;
    languages = {
      lua = {
        enable = true;
        lsp = {enable = true;};
        treesitter.enable = true;
      };
      nix = {
        enable = true;
        lsp = {
          enable = true;
          servers = ["nixd"];
        };
        treesitter.enable = true;
      };
      rust = {
        enable = true;
        lsp = {
          enable = true;
        };
        treesitter.enable = true;
      };
    };
  };
}
