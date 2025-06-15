{pkgs, ...}: {
  imports = [
    ./keymaps.nix
    ./lsp-autocomplete.nix
    ./plugins.nix
    ./style.nix
  ];

  # https://notashelf.github.io/nvf/options.html
  config.vim = {
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };
    lineNumberMode = "relNumber";

    lazy.enable = true;

    ui.noice.enable = true;
    ui.noice.setupOpts.lsp.signature.enabled = true;
    ui.borders.plugins.lsp-signature.enable = true;

    languages = {
      enableFormat = true;
      enableTreesitter = true;

      bash.enable = true;
      bash.lsp.enable = true;
      csharp.enable = true;
      csharp.lsp.enable = true;
      csharp.treesitter.enable = true;
      css.enable = true;
      css.format.type = "prettierd"; # https://github.com/NotAShelf/nvf/issues/943
      gleam.enable = true;
      go.enable = true;
      go.lsp.enable = true;
      haskell.enable = true;
      html.enable = true;
      java.enable = true;
      lua.enable = true;
      markdown.enable = true;
      markdown.lsp.enable = true;
      nix.enable = true;
      nix.lsp.enable = true;
      ruby.enable = true;
      ruby.lsp.enable = true;
      rust.enable = true;
      rust.lsp.enable = true;
      ts.enable = true;
      ts.lsp.enable = true;
      ts.format.type = "prettierd"; # https://github.com/NotAShelf/nvf/issues/943
      yaml.enable = true;
      yaml.lsp.enable = true;
    };
  };
}
