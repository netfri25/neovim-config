local ok, whichkey = pcall(require, "which-key")
if not ok then return end

whichkey.setup({
   spelling = {
      enabled = true,
      suggestions = 10,
   },

   key_labels = {
      ["<cr>"] = "<ret>",
   },

   window = {
      border = "rounded",
      margin = { 2, 2, 2, 1 }
   },
})
