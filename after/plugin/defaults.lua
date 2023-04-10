local set = vim.opt

vim.cmd([[
  " Set up backup directory
  " Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
  set noswapfile
  set backup   " create backup for files
  set backupcopy=yes  " copy the original file to backupdir and overwrite it
  let g:backupdir=expand(stdpath('data') . '/backup')
  if !isdirectory(g:backupdir)
     call mkdir(g:backupdir, 'p')
  endif
  let &backupdir=g:backupdir

  " Set matching pairs of characters and highlight matching brackets
  set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

  " Do not show mode on command line since vim-airline can show it
  set noshowmode

  " Suppress appending <PasteStart> and <PasteEnd> when pasting
  set t_BE=
]])

set.relativenumber = true
set.cursorline = true
-- Ignore case in general, but become case-sensitive when uppercase is present
set.ignorecase['smartcase'] = true

-- File and script encoding settings for vim
set.fileencoding = 'utf-8'
set.fileencodings = { 'ucs-bom', 'utf-8', 'cp936', 'gb18030', 'big5', 'euc-jp', 'euc-kr', 'latin1' }

-- Break line at predefined characters
set.linebreak = true
-- Character to show before the lines that have been soft-wrapped
set.showbreak = '↪ '

-- Minimum lines to keep above and below cursor when scrolling
set.scrolloff = 8

-- Use mouse to select and resize windows, etc.
set.mouse = 'nic' -- Enable mouse in several mode
set.mousemodel = 'popup' -- Set the behaviour of mouse
-- Fileformats to use for new files
set.fileformats = { 'unix', 'dos' }

-- Ask for confirmation when handling unsaved or read-only files
set.confirm = true

set.visualbell['noerrorbells'] = true -- Do not use visual and errorbells
set.history = 500 -- The number of command and search history to keepv

-- Use list mode and customized listchars
set.list = true
set.listchars = {
  -- space = '⋅',
  -- eol = '↩',
  tab = '▸ ',
  -- trail = '~',
  -- extends = '❯',
  -- precedes = '❮',
  -- nbsp = '␣',
}

set.pumheight = 10 -- Maximum number of items to show in popup menu

set.spelllang = { 'en', 'cjk' } -- Spell languages

-- https://stackoverflow.com/questions/27015214/can-vim-apply-shiftround-to-a-block-as-a-whole-instead-of-linewise
set.shiftround = true

-- External program to use for grep command
if vim.fn.executable('rg') then
  set.grepprg = 'rg --vimgrep --no-heading --smart-case'
  set.grepformat = '%f:%l:%c:%ma'
end

-- Enable true color support. Do not set.this option if your terminal does not
-- support true colors!
set.termguicolors = true

-- Set debugger icon width to 2
set.signcolumn = 'yes'

set.incsearch = true

-- Use system clipboard to copy and paste
set.clipboard:append('unnamedplus')

-- incremental substitution (neovim)
set.inccommand = 'split'

-- folding
vim.cmd([[
  setlocal foldmethod=indent
  set nofoldenable
  set foldlevel=99
]])
