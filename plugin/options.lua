local opt = vim.opt

opt.guicursor = ""
opt.updatetime = 50

opt.number = true
opt.relativenumber = true

opt.signcolumn = "yes"
opt.colorcolumn = "+1"
opt.textwidth = 80
opt.scrolloff = 6

opt.foldenable = false
opt.foldmethod = "manual"
opt.foldlevelstart = 99

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
opt.wrap = false

opt.listchars = "trail:•,tab:» ,nbsp:•"
opt.showbreak = "↪"

opt.splitright = true
opt.splitbelow = true
opt.laststatus = 3 -- global status line

opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath "data" .. "/undodir"
opt.undofile = true

-- better diffs
opt.diffopt:append "iwhite"
opt.diffopt:append "indent-heuristic"
opt.diffopt:append "algorithm:histogram"

if require("util").is_windows then
  opt.shell = "pwsh"
  opt.shellcmdflag = "-NoProfile -NoLogo -ExecutionPolicy RemoteSigned -Command"
  opt.shellredir = "2>&1 | Out-File %s; exit $lastexitcode"
  opt.shellpipe = '2>&1 | tee.exe %s; exit $lastexitcode'
  opt.shellquote = ""
  opt.shellxquote = ""
end

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true -- docs say this can break plugins

opt.termguicolors = true
opt.isfname:append "@-@"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
