{pkgs, ...}: {
  imports = [
    ./keymaps.nix
    ./completion.nix
    ./lint.nix
    ./lsp.nix
    ./style.nix
    ./telescope.nix
  ];

  config = {
    globals = {
      mapleader = " ";
    };

    opts = {
      autoindent = true;
      backspace = "indent,eol,start";
      smartcase = true;
      smartindent = true;
      smarttab = true;
      ignorecase = true;
      number = true;
      colorcolumn = "80";
      cursorcolumn = true;
      relativenumber = true;
      shiftwidth = 2;
      shiftround = true;
      tabstop = 2;
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
      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      updatetime = 50;
      foldlevelstart = 99;
      clipboard = "unnamedplus";
      breakindent = true;
      completeopt = "menu,menuone,noselect";
    };

    highlight = {
      Comment.fg = "#ff00ff";
      Comment.bg = "#000000";
      Comment.underline = true;
      Comment.bold = true;
    };

    plugins = {
      cursorline = {
        enable = true;
        cursorline = {
          timeout = 0;
          number = true;
        };
      };
      flash.enable = true;
      fugitive.enable = true;
      navic.enable = true;
      oil.enable = true;
      trouble.enable = true;
      undotree.enable = true;
    };

    extraPackages = with pkgs; [
      ansible
      ansible-language-server
      commitlint
      go
      gofumpt
      golangci-lint
      golines
      gotools
      hadolint
      luajitPackages.luacheck
      markdownlint-cli
      nil
      nodePackages.jsonlint
      python3
      ripgrep
      ruff
      rustfmt
      shellcheck
      yamllint
      zip
    ];
  };
}
