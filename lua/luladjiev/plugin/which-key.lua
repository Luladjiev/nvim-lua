local wk = require('which-key')

vim.o.timeoutlen = 500

wk.register({
  a = {
    name = 'Apps',

    l = { '<cmd>Lazy<cr>', 'Lazy' },
    m = { '<cmd>Mason<cr>', 'Mason' },
    ['<space>'] = { '<cmd>Telescope<cr>', 'Telescope' }
  },

  b = {
    name = 'Buffers',

    b = { '<cmd>Telescope buffers<cr>', 'List Buffers' },
    d = { '<cmd>bd<cr>', 'Delete buffer' },
    D = { '<cmd>%bd<cr>', 'Delete all buffers' },
    o = { '<cmd>%bd|e#|normal `"<cr>', 'Close other buffers' },
  },

  c = {
    name = 'Code',

    a = { vim.lsp.buf.code_action, 'Action' },
    d = { '<cmd>Telescope diagnostics<cr>', 'Diagnostic' },
    f = { vim.lsp.buf.format, 'Format buffer' },

    r = {
      n = { vim.lsp.buf.rename, 'Rename variable' },
      r = { vim.lsp.buf.references, 'Find references' },
    }
  },

  f = {
    name = 'Files',

    b = { '<cmd>Neotree<cr>', 'Browser' },
    f = { '<cmd>Telescope find_files<cr>', 'Find files' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Find recently opened files' },
    s = { '<cmd>Telescope live_grep<cr>', 'Search Files' },
  },

  g = {
    name = 'Git',

    f = { '<cmd>Telescope git_files<cr>', 'Files' },
    s = { '<cmd>Git<cr>', 'Status' }
  },

  h = { '<cmd>Telescope help_tags<cr>', 'Search Help' },

  u = { '<cmd>UndotreeToggle<cr>', 'Undotree' },

  ['*'] = { '<cmd>Telescope grep_string<cr>', 'Search current word' },
  ['<space>'] = { '<cmd>Telescope find_files<cr>', 'Find Files' },

  ['/'] = { function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, 'Search current file' },
}, {
  prefix = '<leader>'
})

wk.register({
  g = {
    d = { vim.lsp.buf.definition, 'Go to definition' }
  },

  -- See `:help K` for why this keymap
  K = { vim.lsp.buf.hover, 'Hover Documentation' },

  ['<TAB>'] = { '<cmd>bn<cr>', 'Next buffer' },
  ['<S-TAB>'] = { '<cmd>bp<cr>', 'Previous buffer' },

  ['['] = {
    d = { vim.diagnostic.goto_prev, 'Previous diagnostic' },
    g = { '<cmd>Gitsigns prev_hunk<cr>', 'Previous hunk' }
  },

  [']'] = {
    d = { vim.diagnostic.goto_next, 'Next diagnostic' },
    g = { '<cmd>Gitsigns next_hunk<cr>', 'Next hunk' }
  },

  ['<C-k>'] = { vim.lsp.buf.signature_help, 'Signature Documentation' }
})

wk.register({
  ['<C-k>'] = { vim.lsp.buf.signature_help, 'Signature Documentation' },
}, {
  mode = 'i'
})
