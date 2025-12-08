{pkgs, ...}: {
  config.vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableDAP = true;

      bash.enable = true;
      bash.lsp.enable = true;

      clojure.enable = true;
      clojure.lsp.enable = true;
      clojure.treesitter.enable = true;

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
      rust.lsp.package = ["rust-analyzer"]; # look at PATH

      ts.enable = true;
      ts.lsp.enable = true;
      ts.format.type = "prettierd"; # https://github.com/NotAShelf/nvf/issues/943
      yaml.enable = true;
      yaml.lsp.enable = true;

      zig.enable = true;
      zig.dap.enable = true;
      zig.lsp.enable = true;
      zig.treesitter.enable = true;
    };

    treesitter = {
      enable = true;
      grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        gdscript
        gdshader
      ];
    };

    autocomplete = {
      blink-cmp.enable = true;
      blink-cmp.setupOpts.signature.enabled = true;
      blink-cmp.setupOpts.keymap = {
        preset = "none";
        "<C-p>" = ["select_prev" "fallback"];
        "<C-n>" = ["select_next" "fallback"];
        "<C-e>" = ["show" "hide"];
      };
      blink-cmp.friendly-snippets.enable = true;
    };

    lsp = {
      enable = true;
      lspconfig.enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lightbulb.enable = true;
      lightbulb.autocmd.enable = true;
      mappings = {
        goToDefinition = "gd";
      };

      trouble.enable = true;
    };

    diagnostics.enable = true;
    diagnostics.config = {
      underline = true;
      update_in_insert = false;
      virtual_text = false;
      float = {
        show_header = true;
        source = "always";
        border = "rounded";
      };
    };
  };
}
