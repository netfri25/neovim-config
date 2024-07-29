return {
   "rachartier/tiny-code-action.nvim",
   dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
   },
   event = "LspAttach",
   opts = {
      backend = "vim",
      backend_opts = { },
      telescope_opts = {
         layout_strategy = "vertical",
         layout_config = {
            width = 0.7,
            height = 0.9,
            preview_cutoff = 1,
            preview_height = function(_, _, max_lines)
               local h = math.floor(max_lines * 0.5)
               return math.max(h, 10)
            end,
         },
      },

      signs = {
         quickfix = { "󰁨", { link = "DiagnosticInfo" } },
         others = { "?", { link = "DiagnosticWarning" } },
         refactor = { "", { link = "DiagnosticWarning" } },
         ["refactor.move"] = { "󰪹", { link = "DiagnosticInfo" } },
         ["refactor.extract"] = { "", { link = "DiagnosticError" } },
         ["source.organizeImports"] = { "", { link = "TelescopeResultVariable" } },
         ["source.fixAll"] = { "", { link = "TelescopeResultVariable" } },
         ["source"] = { "", { link = "DiagnosticError" } },
         ["rename"] = { "󰑕", { link = "DiagnosticWarning" } },
         ["codeAction"] = { "", { link = "DiagnosticError" } },
      },
   }
}
