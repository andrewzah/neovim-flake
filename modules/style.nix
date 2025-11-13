{pkgs, ...}: let
  inherit (pkgs.vimUtils) buildVimPlugin;

  auto-dark-mode-nvim = buildVimPlugin {
    pname = "auto-dark-mode.nvim";
    version = "2025-08-04";
    src = pkgs.fetchFromGitHub {
      owner = "f-person";
      repo = "auto-dark-mode.nvim";
      rev = "e300259ec777a40b4b9e3c8e6ade203e78d15881";
      hash = "sha256-PhhOlq4byctWJ5rLe3cifImH56vR2+k3BZGDZdQvjng=";
    };
    meta.homepage = "https://github.com/f-person/auto-dark-mode.nvim/";
  };
in {
  config.vim = {
    extraPlugins = {
      auto-dark-mode-nvim = {
        package = auto-dark-mode-nvim;
        setup = ''
          require("auto-dark-mode").setup({
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                vim.cmd.colorscheme('tokyonight')
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.cmd.colorscheme('bluloco')
            end,
            update_interval = 3000,
            fallback = "dark"
          })
        '';
      };

      blueloco-nvim = {
        package = pkgs.vimPlugins.bluloco-nvim;
        setup = ''
          require("bluloco").setup({
            style = "auto",
            transparent = false,
            italics = false,
            guicursor = true,
            terminal = vim.fn.has("gui_running") == 1,
            rainbow_headings = true,
          })
        '';
      };

      gruvbox = {
        package = pkgs.vimPlugins.gruvbox-nvim;
        setup = ''
          require("gruvbox").setup({
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
              strings = true,
              emphasis = true,
              comments = true,
              operators = false,
              folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
          })
        '';
      };

      tokyoNight = {
        package = pkgs.vimPlugins.tokyonight-nvim;
        setup = ''
          require("tokyonight").setup({
            style = "night",
          })
          --vim.cmd[[colorscheme tokyonight]]
          --vim.o.background = "dark"
        '';
      };
    };

    theme = {
      #enable = true;
      ## github:dark_high_contrast oxocarbon:dark onedark:darker cappuccin:mocha
      #name = "onedark";
      #style = "darker";

      #palette_overrides = {
      #  #dark0 = "#1d2021";
      #  #dark1 = "#3c3836";
      #  #dark2 = "#504945";
      #  #dark3 = "#665c54";
      #  #dark4 = "#7c6f64";
      #  #light0 = "#f9f5d7";
      #  #light1 = "#ebdbb2";
      #  #light2 = "#d5c4a1";
      #  #light3 = "#bdae93";
      #  #light4 = "#a89984";
      #  #bright_red = "#fb4934";
      #  #bright_green = "#b8bb26";
      #  #bright_yellow = "#fabd2f";
      #  #bright_blue = "#83a598";
      #  #bright_purple = "#d3869b";
      #  #bright_aqua = "#8ec07c";
      #  #bright_orange = "#fe8019";
      #  #neutral_red = "#cc241d";
      #  #neutral_green = "#98971a";
      #  #neutral_yellow = "#d79921";
      #  #neutral_blue = "#458588";
      #  #neutral_purple = "#b16286";
      #  #neutral_aqua = "#689d6a";
      #  #neutral_orange = "#d65d0e";
      #  #faded_red = "#9d0006";
      #  #faded_green = "#79740e";
      #  #faded_yellow = "#b57614";
      #  #faded_blue = "#076678";
      #  #faded_purple = "#8f3f71";
      #  #faded_aqua = "#427b58";
      #  #faded_orange = "#af3a03";
      #  #dark_red = "#792329";
      #  #light_red = "#fc9690";
      #  #dark_green = "#5a633a";
      #  #light_green = "#d3d6a5";
      #  #dark_aqua = "#3e4934";
      #  #light_aqua = "#e6e9c1";
      #  #gray = "#928374";
      #};
    };
  };
}
