return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "eslint",
          "gopls",
          "rust_analyzer",
          "svelte",
          "html",
          "astro",
          "tailwindcss",
        },
      })
    end,
  },
  {
    "folke/neodev.nvim",
    config = function()
      -- Setup neovim lua configuration
      require("neodev").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Set up lspconfig.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports",
          },
        },
      })
      -- lspconfig.eslint.setup({
      --   on_attach = function(client, bufnr)
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       buffer = bufnr,
      --       command = "EslintFixAll",
      --     })
      --   end,
      -- })
      lspconfig.svelte.setup({
        capabilities = capabilities,
      })
      lspconfig.astro.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              -- formatter options
              black = { enabled = true },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              -- linter options
              pylint = { enabled = true, executable = "pylint" },
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              -- type checker
              pylsp_mypy = { enabled = true },
              -- auto-completion options
              jedi_completion = { fuzzy = true },
              -- import sorting
              pyls_isort = { enabled = true },
            },
          },
        },
      })
      local telescope_builtin = require("telescope.builtin")
      -- local telescope_builtin = require("telescope.builtin")
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      -- See `:help K` for why this keymap
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, { desc = "[G]oto [D]efinitions" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})

      vim.keymap.set("n", "gD", function()
        vim.lsp.buf_request(
          0,
          "textDocument/definition",
          vim.lsp.util.make_position_params(),
          function(_, result, ctx, _)
            if not result or vim.tbl_isempty(result) then
              vim.notify("No definition found", vim.log.levels.WARN)
              return
            end

            -- If only one location -> open directly in tab
            if #result == 1 then
              local def = result[1]
              local uri = def.uri or def.targetUri
              local range = def.range or def.targetSelectionRange
              local fname = vim.uri_to_fname(uri)

              vim.cmd("tabedit " .. fname)
              vim.api.nvim_win_set_cursor(0, { range.start.line + 1, range.start.character })
              return
            end

            -- Otherwise -> use Telescope picker
            telescope_builtin.lsp_definitions({
              jump_type = "never",
              attach_mappings = function(_, map)
                local function open_in_tab(prompt_bufnr)
                  local entry = action_state.get_selected_entry()
                  actions.close(prompt_bufnr)

                  local filename = entry.filename or (entry.uri and vim.uri_to_fname(entry.uri))
                  if not filename then
                    vim.notify("No file info for definition", vim.log.levels.ERROR)
                    return
                  end

                  vim.cmd("tabedit " .. filename)
                  vim.api.nvim_win_set_cursor(0, { entry.lnum, entry.col })
                end

                map("i", "<CR>", open_in_tab)
                map("n", "<CR>", open_in_tab)
                return true
              end,
            })
          end
        )
      end, { desc = "[G]oto [D]efinition in new tab (with skip)" })

      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>oi", ":OrganizeImports<CR>", { desc = "[O]rganize [I]mports" })
    end,
  },
}
