{
  pkgs,
  lib,
  ...
}: {
  plugins.rust-tools.enable = true;
  plugins.lsp = {
    servers = {
      ansiblels.enable = true;
      ansiblels.filetypes = ["yaml" "yaml.ansible" "ansible"];
      bashls.enable = true;
      cmake.enable = true;
      gopls.enable = true;
      jsonls.enable = true;
      lua-ls.enable = true;
      lua-ls.settings.telemetry.enable = false;
      nixd.enable = true;
      ruff-lsp.enable = true;
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      tsserver.enable = true;
      yamlls.enable = true;
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    typescript-tools-nvim
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

      -- golang lsp
      require("lspconfig").gopls.setup({
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

      -- Lua LSP
      require("lspconfig").lua_ls.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- Markdown LSP
      require("lspconfig").marksman.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- Nix LSP
      require("lspconfig").nil_ls.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })

      -- Python LSP
      require("lspconfig").ruff_lsp.setup({
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
      require("lspconfig").tsserver.setup({
        on_attach = function()
          set_cmn_lsp_keybinds()
        end,
      })
  '';
}
