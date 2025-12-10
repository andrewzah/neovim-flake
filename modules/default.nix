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
  # https://neovim.io/doc/user/plugins.html
  config.vim = {
    extraPackages = with pkgs; [claude-code];

    globals = {
      editorconfig = true;

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
    visuals.rainbow-delimiters.enable = true;

    undoFile.enable = true;
    undoFile.path = lib.mkLuaInline "os.getenv('XDG_DATA_HOME') .. '/nvf/undo'";
  };
}
