local options = {
   backup = false, -- creates a backup file
   -- clipboard = 'unnamedplus',                         -- allows neovim to access the system clipboard
   cmdheight = 1, -- more space in the neovim command line for displaying messages
   -- completeopt = { 'menu', 'menuone', 'noselect' }, -- mostly just for cmp
   conceallevel = 0, -- so that `` is visible in markdown files
   fileencoding = 'utf-8', -- the encoding written to a file
   hlsearch = false, -- highlight all matches on previous search pattern
   ignorecase = false, --   ignore case in search patterns
   mouse = 'a', -- allow the mouse to be used in neovim
   pumheight = 10, -- pop up menu height
   showmode = false, -- we don't need to see things like -- INSERT -- anymore
   -- smartcase = true,                                 -- smart case
   smartindent = false, --   make indenting smarter again
   cindent = false,
   splitbelow = true, -- force all horizontal splits to go below current window
   splitright = true, -- force all vertical splits to go to the right of current window
   swapfile = false, -- creates a swapfile
   termguicolors = true, -- set term gui colors (most terminals support this)
   timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
   undofile = true, --   enable persistent undo
   updatetime = 220, -- faster completion (4000ms default)
   writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
   expandtab = true, -- convert tabs to spaces
   shiftwidth = 4, -- the number of spaces inserted for each indentation
   tabstop = 4, -- insert 4 spaces for a tab
   cursorline = false, -- highlight the current line
   number = true, -- set numbered lines
   relativenumber = true, --   set relative numbered lines
   numberwidth = 4, --   set number column width to 2 {default 4}
   signcolumn = 'yes', --   always show the sign column, otherwise it would shift the text each time
   wrap = false, -- display lines as one long line
   scrolloff = 3, -- is one of my fav
   sidescrolloff = 7,
   foldmethod = 'manual', --   folding set to 'expr' for treesitter based folding
   foldexpr = '', -- set to 'nvim_treesitter#foldexpr()' for treesitter based folding
   hidden = true, -- required to keep multiple buffers and open multiple buffers
   shell = 'fish', -- the default shell that some neovim commands will use
   -- shellpipe = 'out+err>',
   title = true, -- set the title of window to the value of the titlestring
   titlestring = '%F - Not Emacs', -- what the title of the window will be set to
   -- showtabline = 1,
   background = 'dark',
   -- spell = true,
   -- spelloptions = 'camel',
   ruler = false,
   showcmd = false,
   autochdir = false,
   grepprg = "rg --vimgrep",
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
   vim.opt[k] = v
end

vim.filetype.add({
   extension = {
      ['ebnf'] = 'ebnf',
      ['porth'] = 'porth',
      ['pro'] = 'prolog',
      ['nasm'] = 'nasm',
   }
})

vim.opt.whichwrap:append '<,>,[,],h,l'
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

vim.cmd[[filetype indent off]]

vim.g.firenvim_config = {
    globalSettings = { alt = "all" },
    localSettings = {
        [".*"] = {
            cmdline  = "neovim",
            content  = "text",
            priority = 0,
            selector = "textarea",
            takeover = "always"
        }
    }
}
