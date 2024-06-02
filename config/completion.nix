{...}: {
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = false;
      cmdline = {
        "/" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [
            {
              name = "buffer";
            }
          ];
        };
        ":" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [
            {
              name = "path";
            }
            {
              name = "cmdline";
              option = {
                ignore_cmds = [
                  "Man"
                  "!"
                ];
              };
            }
          ];
        };
      };
      settings = {
        performance.max_view_entries = 16;
        snippet = {
          expand = ''
            function(args)
            	luasnip.lsp_expand(args.body)
            end
          '';
        };

        completion = {
          completeopt = "menu,menuone,noinsert";
        };

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete {}";
          "<CR>" = "cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }";
          "<Tab>" = "cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' })";
          "<S-Tab>" = "cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' })";
        };

        window.documentation.border = [
          "╭"
          "─"
          "╮"
          "│"
          "╯"
          "─"
          "╰"
          "│"
        ];

        sources = [
          {name = "nvim_lsp";}
          {name = "nvim_lua";}
          # {name = "cmdline";}
          {name = "luasnip";}
          {name = "path";}
          {name = "buffer";}
        ];
      };
    };
    cmp-buffer.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-cmdline.enable = true;
    cmp-path.enable = true;
    luasnip.enable = true;
    cmp_luasnip.enable = true;
  };

  extraConfigLuaPre = ''
    local luasnip = require("luasnip")
    luasnip.config.setup({})
  '';

  extraConfigLua = ''
     local luasnip = require("luasnip")
    luasnip.config.setup({})

    -- Extra options for cmp-cmdline setup
    local cmp = require("cmp")
    cmp.event:on(
      'confirm_done'
    )
  '';
}
