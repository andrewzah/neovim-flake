{lib, ...}: {
  config.vim = {
    autocmds = [
      {
        enable = true;
        callback = lib.mkLuaInline ''
          function()
            if vim.o.background == 'dark' then
              vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
            end
          end
        '';
        event = ["ColorScheme" "BufEnter" "ModeChanged"];
        desc = "";
      }
    ];
  };
}
