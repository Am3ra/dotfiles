local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup({
  -- Package manager

  -- { -- LSP Configuration & Plugins
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     'williamboman/mason.nvim',
  --     'williamboman/mason-lspconfig.nvim',
  --     -- Useful status updates for LSP
  --     'j-hui/fidget.nvim',
  --   },
  -- },
  -- {
  --   "glepnir/lspsaga.nvim",
  --   event = "BufRead",
  --   config = function()
  --       require("lspsaga").setup({})
  --   end,
  --   dependencies = {
  --     {"nvim-tree/nvim-web-devicons"},
  --     --Please make sure you install markdown and markdown_inline parser
  --     {"nvim-treesitter/nvim-treesitter"}
  --   },
  --   keys = {
  --     {"gh", "<cmd>Lspsaga lsp_finder<CR>",desc = "Find Definition"},
  --     {"<leader>ca", "<cmd>Lspsaga code_action<CR>",desc = "[c]ode [a]ction"},
  --     -- {"gr", "<cmd>Lspsaga rename<CR>", desc= "rename"},
  --     {"gd", "<cmd>Lspsaga peek_definition<CR>", desc="[g]oto [d]efinition"},
  --     {"gt", "<cmd>Lspsaga peek_type_definition<CR>" , desc = "[g]oto [t]ype definition"},
  --   }
  -- },

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  { "/j-hui/fidget.nvim",                       config = true },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },



  -- { "folke/trouble.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },


  'navarasu/onedark.nvim', -- Theme inspired by Atom,
  {
    'nvim-lualine/lualine.nvim',
    config = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    }
  }, -- Fancier statusline
  {
    'lukas-reineke/indent-blankline.nvim',
    config = {
      char = '┊',
      show_trailing_blankline_indent = false,
    }
  }, 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
  {
    "folke/which-key.nvim",
    config = {
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 40,
        },
      },
    }
  },
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = {
      direction = "float",
      open_mapping = [[<c-\>]],
    },
  },
  -- {
  --   'goolord/alpha-nvim',
  --   init = function()
  --     require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
  --   end
  -- },
  {
    'nvim-tree/nvim-tree.lua',
    config = true
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    config = true
  },
  { "ixru/nvim-markdown" },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   init = function()
  --     require("copilot_cmp").setup {
  --       method = "getCompletionsCycling",
  --     }
  --   end
  -- },

  -- { 'chentoast/marks.nvim', init = function()
  --   require('marks').setup()
  -- end },
  --    -- LSP Support

  {
    'debugloop/telescope-undo.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require("telescope").load_extension("undo")
      -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
  },
  --{ 'seblj/nvim-tabline', dependencies = { 'kyazdani42/nvim-web-devicons' } },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.starter').setup()
      require('mini.sessions').setup()
      require('mini.surround').setup()
      require('mini.align').setup()
      require('mini.comment').setup()
    end,
    version = '*'
  },
  {
    "shortcuts/no-neck-pain.nvim",
    config = {
      buffers = {
        left = {
          colors = {
            background = "#2a273f",
            text = "#ffffff",
          },
        }
      }
    }
  },
  { 'romgrk/barbar.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        disable_filetype = { "TelescopePrompt", "vim" },
      }
    end
  },
  {
    "pocco81/auto-save.nvim",
    config = {
      debounce_delay = 300,
    }
  },
  {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  'nvim-treesitter/nvim-treesitter-context',
  {
    'simrat39/symbols-outline.nvim',
    config = {
      autofold_depth = 1,

    }
  },
  "lewis6991/gitsigns.nvim",
  { 'renerocksai/telekasten.nvim',    lazy = true },
  'renerocksai/calendar-vim',
  'nvim-telescope/telescope-symbols.nvim',

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = true
  },

  { "jose-elias-alvarez/null-ls.nvim" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = true
  },
  {
    'mfussenegger/nvim-dap-python',
    config = function ()
      require('dap-python').setup( "/Users/alan/opt/anaconda3/envs/dataEng/bin/python")
    end
  },
  { 'ErichDonGubler/lsp_lines.nvim', config = true },
  'kdheepak/lazygit.nvim',
  -- {
  --   -- 'Bekaboo/deadcolumn.nvim',
  --   config = {
  --     scope = 'visible'
  --   }
  -- },
  {
    "JellyApple102/flote.nvim",
    config = true
  },
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  { "tveskag/nvim-blame-line" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python"
      -- "nvim-neotest/neotest-python",
    },
  },
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()
    end
  }
})

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
  },
})
-- -- format before save
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   command = 'silent! lua vim.lsp.buf.format()',
--   pattern = '*',
-- })
--
-- Automatically source and re-compile packer whenever you save this init.lua
-- local lazy_group = vim.api.nvim_create_augroup('lazy', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'source <afile>  | PackerSync',
--   group = lazy_group,
--   pattern = vim.fn.expand '$MYVIMRC',
-- })
-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
--lsp.ensure_installed({
--  'marksman'
--})
--lsp.setup()

-- MINI CONFIG



-- [[ Setting options ]]
-- See `:help vim.o`
vim.o.colorcolumn = '100'
-- Set highlight on search
vim.o.hlsearch = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

vim.o.relativenumber = true
vim.o.linebreak = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

vim.o.hidden = true
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd('colorscheme onedark')
vim.cmd('autocmd BufReadPost,FileReadPost * normal zR')
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Set lualine as statusline
-- See `:help lualine.txt`
-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  -- signs = {
  --   add = { text = '+' },
  --   change = { text = '~' },
  --   delete = { text = '_' },
  --   topdelete = { text = '‾' },
  --   changedelete = { text = '~' },
  -- },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local lsp = require('lsp-zero').preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
})

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

local on_attach_lsp = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end



null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
    on_attach_lsp(client, bufnr)
  end,
  sources = {
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.proselint,
    -- null_ls.builtins.formatting.reorder_python_imports
  }
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


-- if you only want these mappings for toggle term use term://*toggleterm#* instead


-- function _lazygit_toggle()
--   lazygit:toggle()
-- end

local wk = require("which-key")
wk.register({
  ['?'] = { require('telescope.builtin').oldfiles, '[?] Find recently opened files' },
  ['<space>'] = { require('telescope.builtin').buffers, '[ ] Find existing buffers' },
  ['<f2>'] = { "<cmd>lua require('renamer').rename()<cr>", "Rename symbol" },
  -- change window size macOS iterm
  -- ['<M->>'] = { "<cmd>vertical resize -5<cr>", "decrease window width" },
  -- ['–'] = { "<cmd>vertical resize +5<cr>", "increase window width" },
  -- ['≥'] = { "<cmd>resize -5<cr>", "decrease window height" },
  -- ['≤'] = { "<cmd>resize +5<cr>", "increase window height" },
  b = {
    name = "[B]uffers",
    b = { "<cmd>BufferPrevious<cr>", "go to previous [b]uffer" },
    c = { "<cmd>bdelete<cr>", "Close Buffer" },
    j = { "<c-w>j", "go to down[j] buffer" },
    l = { "<c-w>l", "go to [r]ight buffer" },
    n = { "<cmd>BufferNext<cr>", "Go to next buffer" },
    m = { ":WindowsMaximizeVertically<cr>", "[m]aximize vertical" },
    o = { "<cmd>only<cr>", "Close all other buffers" },
    p = { "<cmd>BufferPick<cr>", "[p]ick buffer" },
  },
  c = { "<cmd>bdelete<cr>", "Close Buffer" },
  d = {
    name = "[d]ebug",
    t = { ':lua require("neotest").run.run({strategy="dap"}) <cr> :lua require("dapui").open() <cr>', "[d]ebug nearest test" },
    o = {":lua require('dapui').open() <cr>", "[o]pen dapui"},
    c = {":lua require('dapui').close() <cr>", "[c]lose dapui"},
    d = {":lua require('dapui').toggle() <cr>", "toggle [d]apui"},
  },
  e = {
    name = "[E]ditor",
    c = { "<cmd>NoNeckPain<cr>", "[c]enter buffer" },
    e = { "<cmd>edit $MYVIMRC<cr>", "Edit [e]nv config" },
    -- t = { "<cmd>TroubleToggle<cr>", "[t]oggle trouble" },
    t = { "<cmd>NvimTreeToggle<CR>", "[T]oggle file tree" },
    f = { "<cmd>NvimTreeFocus<CR>", "[F]ocus file tree" },
  },
  g = {
    name = "[G]it",
    -- g = { "<cmd>lua _lazygit_toggle()<CR>", "Toggle lazy[g]it" },
    g = { "<cmd>LazyGit<CR>", "Toggle lazy[g]it" },
  },
  l = {
    f = {
      "<cmd>lua vim.lsp.buf.format()<cr>", "[f]ormat document"
    }
  },
  r = {
    name = "[R]un",
    p = { ":lua require('refactoring').debug.printf({below = false})<CR>", "Print" },
    t = {
      name = "[t]est",
      t = { ':lua require("neotest").run.run() <CR>', "run nearest [t]est" },
      f = { ':lua require("neotest").run.run(vim.fn.expand("%")) <CR>', "run test [f]ile" },
    }
  },
  s = {
    name = "[S]earch",
    b = {
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, ' Fuzzily search in current [b]uffer]'
    },
    d = { require('telescope.builtin').diagnostics, 'Search [D]iagnostics' },
    f = { require('telescope.builtin').find_files, 'Search [F]iles' },
    g = { require('telescope.builtin').live_grep, 'Search [G]rep' },
    h = { require('telescope.builtin').help_tags, 'Search [H]elp' },
    u = { "<cmd>Telescope undo<cr>", 'Search [u]ndo tree' },
    w = { require('telescope.builtin').grep_string, 'Search [W]ord' },
  },
  t = {
    name = "[t]oggle",
    b = {
      ":lua require'dap'.toggle_breakpoint() <cr>", "toggle [b]reakpoint"
    }
  },
  w = { "<cmd>w<cr>", "[W]rite buffer" },
  z = {
    name = "Telekasten",
    c = { "<cmd> Telekasten show_calendar<cr>", "[C]alendar" },
    i = { "<cmd>Telekasten insert_link<cr>", "[i]nsert link" },
    n = { "<cmd>Telekasten new_note<cr>", "New" },
    s = { "<cmd>Telekasten search_notes<cr>", "Search" },
    z = { "<cmd>Telekasten panel<cr>", "Panel" },
  },
}, { prefix = "<leader>" })

wk.register({
    r = {
      name = "[R]efactor",
      r = {
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        "select [R]efactor"
      }
    },
    ['/'] = {

      "gc"
      , "toggle comment on selection"
    }
  },
  {
    mode = "v",
    prefix = "<leader>",
  }
)
-- See `:help telescope.builtin`


-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  --



  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help' },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
      'rescript',
      'css', 'lua', 'xml', 'php',
      -- 'markdown'
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to prev diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open Floating Diagnostic" })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Set window location list" })



-- vim.keymap.set('n', '<c-d>', '<c-d>zz^', { desc = "move down" })
vim.keymap.set('n', '∆', '<c-d>zz^', { desc = "move down" })
vim.keymap.set('n', '˚', '<c-u>zz^', { desc = "move up" })
vim.keymap.set('n', '<alt-d>', '<c-d>zz^', { desc = "move down" })
vim.keymap.set('n', '˚', '<c-u>zz^', { desc = "move up" })
-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.

-- Setup mason so it can manage external tooling
require('mason').setup()


-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}



-- Turn on lsp status information
-- require('fidget').setup()

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')


local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
