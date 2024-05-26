{pkgs, ...}: {
  imports = [
    ./keymaps.nix
    ./telescope.nix
  ];

  config = {
    globals = {
      mapleader = " ";
    };

    options = {
      autoindent = true;
      backspace = "indent,eol,start";
      smartcase = true;
      relativenumber = true;
      colorcolumn = "80";
      cursorcolumn = true;
    };

    highlight = {
      Comment.fg = "#ff00ff";
    };

    plugins = {
      trouble.enable = true;
    };

    extraPlugins = with pkgs; [
      rustfmt
    ];
  };
}
