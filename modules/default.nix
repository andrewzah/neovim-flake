{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./autocmds.nix
    ./keymaps.nix
    ./lsp-autocomplete.nix
    ./plugins.nix
    ./style.nix
    ./debugging.nix
  ];

  # https://neovim.io/doc/user/lsp.html
  # https://notashelf.github.io/nvf/options.html

  config.vim = {
    globals = {
      mapleader = " ";
      maplocalleader = ",";
      number = true;
      relativenumber = true;
      softtabstop = 2;
      expandtab = true;
      list = true;
      listchars = "trail:¬,precedes:«,extends:»,tab:→⋅";
      wrap = false;
      swapfile = false;
      backup = false;
      undofile = true;
      hlsearch = false;
      incsearch = true;
      scrolloff = 8;
      signcolumn = "yes";
      updatetime = 50;
      foldlevelstart = 99;
      breakindent = true;
      completeopt = "menu,menuone,noselect";
    };

    options = {
      termguicolors = true;
      colorcolumn = "80";
      cursorcolumn = true;
      autoindent = true;
      backspace = "indent,eol,start";
      smartcase = true;
      smartindent = true;
      smarttab = true;
      ignorecase = true;
      shiftwidth = 2;
      shiftround = true;
      tabstop = 2;
    };
    lineNumberMode = "relNumber";

    clipboard = {
      enable = true;
      providers.xclip.enable = true;
      registers = "unnamedplus";
    };

    comments.comment-nvim.enable = true;

    lazy.enable = true;

    ui = {
      noice.enable = true;
      noice.setupOpts.lsp.signature.enabled = true;
      borders.plugins.lsp-signature.enable = true;
    };
    visuals.nvim-cursorline.enable = true;
    visuals.nvim-cursorline.setupOpts.cursorword.enable = true;
    visuals.highlight-undo.enable = true;

    treesitter.enable = true;

    undoFile.enable = true;
    undoFile.path = lib.mkLuaInline "os.getenv('XDG_DATA_HOME') .. '/nvf/undo'";

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableDAP = true;

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
      markdown.treesitter.enable = true;
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
