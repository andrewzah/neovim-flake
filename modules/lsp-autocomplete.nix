{...}: {
  config.vim = {
    treesitter.enable = true;

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
