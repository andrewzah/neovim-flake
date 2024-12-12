{
  pkgs,
  ...
}: let
  love2d-nvim = pkgs.vimUtils.buildVimPlugin rec {
    name = "love2d-nvim";
    version = "0.2";

    src = pkgs.fetchzip {
      url = "https://github.com/S1M0N38/love2d.nvim/archive/refs/tags/v${version}.zip";
      hash = "sha256-/OneGugGHM5Fohy/X+UDweuz45OL3YiFjXgjJiQ3BFA=";
    };
  };
in {
  #plugins.rustaceanvim.enable = true;
  plugins.lsp = {
    servers = {
      ansiblels.enable = true;
      ansiblels.filetypes = ["yaml" "yaml.ansible" "ansible"];
      bashls.enable = true;
      cmake.enable = true;

      gleam = {
        enable = true;
        autostart = true;
        filetypes = ["gleam"];
        rootDir = ''
          function(fname)
            return vim.loop.cwd()
          end
        '';
      };
      glsl_analyzer.enable = true;

      gopls.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      nixd.enable = true;
      ruff.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      ts_ls.enable = true;
      yamlls.enable = true;
    };
  };

  extraPlugins = (with pkgs.vimPlugins; [
    nvim-lspconfig
    typescript-tools-nvim
  ]) ++ [
    love2d-nvim
  ];

  extraConfigLua = ''
      -- Extra nvim-lspconfig configuration

      -- Common LSP key mappings
      local function set_cmn_lsp_keybinds()
        local lsp_keybinds = {
          {
            key = "K",
            action = vim.lsp.buf.hover,
            options = {
              buffer = 0,
              desc = "hover [K]noledge with LSP",
            },
          },
          {
            key = "gd",
            action = vim.lsp.buf.definition,
            options = {
              buffer = 0,
              desc = "[g]o to [d]efinition with LSP",
            },
          },
          {
            key = "gy",
            action = vim.lsp.buf.type_definition,
            options = {
              buffer = 0,
              desc = "[g]o to t[y]pe definition with LSP",
            },
          },
          {
            key = "gi",
            action = vim.lsp.buf.implementation,
            options = {
              buffer = 0,
              desc = "[g]o to [i]mplementation with LSP",
            },
          },
          {
            key = "<leader>dj",
            action = vim.diagnostic.goto_next,
            options = {
              buffer = 0,
              desc = "Go to next [d]iagnostic with LSP",
            },
          },
          {
            key = "<leader>dk",
            action = vim.diagnostic.goto_prev,
            options = {
              buffer = 0,
              desc = "Go to previous [d]iagnostic with LSP",
            },
          },
          {
            key = "<leader>r",
            action = vim.lsp.buf.rename,
            options = {
              buffer = 0,
              desc = "[r]ename variable with LSP",
            },
          },
        }

        for _, bind in ipairs(lsp_keybinds) do
          vim.keymap.set("n", bind.key, bind.action, bind.options)
        end
      end

      -- Additional lsp-config
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- ansible LSP
      require("lspconfig").ansiblels.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- gleam lsp
      require("lspconfig").gleam.setup({
        root_dir = function(fname)
          return vim.loop.cwd()
        end,
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- golang lsp
      require("lspconfig").gopls.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- glsl_analyzer lsp
      require("lspconfig").glsl_analyzer.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- JSON lsp
      require("lspconfig").jsonls.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- Lua
      require'lspconfig'.lua_ls.setup({
        root_dir = function(fname)
          return vim.loop.cwd()
        end,
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT'
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                "''${3rd}/love2d/library",
              }
            }
          })
        end,
        settings = {
          Lua = {}
        }
      })

      -- Markdown LSP
      require("lspconfig").marksman.setup({
        on_attach = function()
          root_dir = function(fname)
            return '/tmp'
          end,
          set_cmn_lsp_keybinds()
        end,
      })

      -- Nix LSP
      require("lspconfig").nixd.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- Python LSP
      require("lspconfig").ruff.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

       -- Rust LSP
      require("lspconfig").rust_analyzer.setup({
        root_dir = function(fname)
          return vim.loop.cwd()
        end,
        settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- Typescript/Javascript LSP
      require("lspconfig").ts_ls.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })
  '';
}
