{...}: let
  mkKeymap = mode: key: action: {
    inherit mode key action;
    silent = true;
    noremap = true;
  };
  mkKeymapLua = mode: key: action: {
    inherit mode key action;
    silent = true;
    noremap = true;
    lua = true;
  };
in {
  config.vim = {
    keymaps = [
      (mkKeymap "n" " " "<Nop>") # ??
      (mkKeymap "n" "<CR>" ":noh<CR><CR>") # clear incsearch hl
      (mkKeymap "n" "<tab>" "<C-w>w")

      # i already use ctrl-[, but let's see if either stick
      (mkKeymap "i" "jk" "<Esc>")
      (mkKeymap "i" "jh" "<Esc>")

      # keep at middle of screen after jump
      (mkKeymap "n" "<C-d>" "<C-d>zz")
      (mkKeymap "n" "<C-u>" "<C-u>zz")

      # diagnostics / LSP
      (mkKeymap "n" "<C-CR>" "<cmd>lua vim.lsp.buf.code_action()<CR>")
      (mkKeymap "n" "<Leader>dn" "<cmd>lua vim.diagnostic.goto_next()<CR>")
      (mkKeymap "n" "<Leader>dp" "<cmd>lua vim.diagnostic.goto_prev()<CR>")
      (mkKeymap "n" "<Leader>dv" "<cmd>lua vim.diagnostic.open_float()<CR>")
      (mkKeymap "n" "<Leader>xx" "<cmd>Trouble diagnostics toggle<CR>")
      (mkKeymap "n" "<Leader>lr" "<cmd>lua vim.lsp.buf.rename()<CR>")
      (mkKeymap "v" "<Leader>lr" "<cmd>lua vim.lsp.buf.rename()<CR>")

      # mini.files
      (mkKeymap "n" "<Leader>e" "<cmd>lua MiniFiles.open()<CR>")

      # color schemes
      (mkKeymapLua "n" "<Leader>bdm" ''
        function()
          vim.cmd[[colorscheme modus]]
          vim.o.background = 'dark'
        end
      '')
      (mkKeymapLua "n" "<Leader>bdt" ''
        function()
          vim.cmd[[colorscheme tokyonight]]
          vim.o.background = 'dark'
        end
      '')
      (mkKeymapLua "n" "<Leader>bdg" ''
        function()
          vim.cmd[[colorscheme gruvbox]]
          vim.o.background = 'dark'
        end
      '')
      (mkKeymapLua "n" "<Leader>blg" ''
        function()
          vim.cmd([[colorscheme gruvbox]])
          vim.o.background = 'light'
        end
      '')
      (mkKeymapLua "n" "<Leader>blb" ''
        function()
          vim.cmd([[colorscheme bluloco]])
          vim.o.background = 'light'
        end
      '')
      (mkKeymapLua "n" "<Leader>blm" ''
        function()
          vim.cmd([[colorscheme modus]])
          vim.o.background = 'light'
        end
      '')

      # splits (rm due to harpoon)
      # (mkKeymap "n" "<C-h>" "<C-w>h")
      # (mkKeymap "n" "<C-j>" "<C-w>j")
      # (mkKeymap "n" "<C-k>" "<C-w>k")
      # (mkKeymap "n" "<C-l>" "<C-w>l")
    ];
  };
}
