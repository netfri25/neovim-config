local options = {
   backup = false, -- creates a backup file
   -- clipboard = 'unnamedplus',                         -- allows neovim to access the system clipboard
   cmdheight = 2, -- more space in the neovim command line for displaying messages
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
   splitbelow = true, -- force all horizontal splits to go below current window
   splitright = true, -- force all vertical splits to go to the right of current window
   swapfile = false, -- creates a swapfile
   termguicolors = true, -- set term gui colors (most terminals support this)
   timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
   undofile = true, --   enable persistent undo
   updatetime = 220, -- faster completion (4000ms default)
   writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
   expandtab = true, -- convert tabs to spaces
   shiftwidth = 3, -- the number of spaces inserted for each indentation
   tabstop = 3, -- insert 3 spaces for a tab
   cursorline = false, -- highlight the current line
   number = true, -- set numbered lines
   relativenumber = true, --   set relative numbered lines
   numberwidth = 4, --   set number column width to 2 {default 4}
   signcolumn = 'yes', --   always show the sign column, otherwise it would shift the text each time
   wrap = false, -- display lines as one long line
   scrolloff = 0, -- is one of my fav
   sidescrolloff = 7,
   guifont = 'Iosevka Custom',         -- the font used in graphical neovim applications
   foldmethod = 'manual', --   folding set to 'expr' for treesitter based folding
   foldexpr = '', -- set to 'nvim_treesitter#foldexpr()' for treesitter based folding
   hidden = true, -- required to keep multiple buffers and open multiple buffers
   shell = 'nu', -- the default shell that some neovim commands will use
   title = true, -- set the title of window to the value of the titlestring
   titlestring = 'Not Emacs', -- what the title of the window will be set to
   -- showtabline = 1,
   background = 'dark',
   -- spell = true,
   -- spelloptions = 'camel',
   ruler = false,
   showcmd = false,
   autochdir = false,
   grepprg = "grep -rn",
}

vim.opt.shortmess:append 'c'

vim.g.filetype_pl = 'prolog'
vim.g.filetype_pro = 'prolog'

for k, v in pairs(options) do
   vim.opt[k] = v
end

vim.opt.whichwrap:append '<,>,[,],h,l'
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
