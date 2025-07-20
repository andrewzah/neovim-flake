{...}: let
  mkKeymap = mode: key: action: {
    inherit mode key action;
    silent = true;
    noremap = true;
  };
in {
  config.vim = {
    keymaps = [
      (mkKeymap "n" " " "<Nop>") # ??
      (mkKeymap "n" "<Leader>bd" "<cmd>set background=dark<CR>")
      (mkKeymap "n" "<Leader>bl" "<cmd>set background=light<CR>")

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
    ];
  };
}
