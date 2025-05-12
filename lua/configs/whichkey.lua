local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    win = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    filter = function ()
	    return true
    end,
    -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = {
	    "<leader>",
      { "j", mode = { "n", "v" } },
      { "k", mode = { "n", "v" } },
    }, -- or specify a list manually
}



which_key.setup(setup)
which_key.add({
  -- Single mappings
  { "<leader>k", "<cmd>bdelete<CR>", desc = "Kill Buffer" },
  { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },
  { "<leader>p", "<cmd>Lazy<CR>", desc = "Plugin Manager" },
  { "<leader>q", "<cmd>wqall!<CR>", desc = "Quit" },
  { "<leader>r", function() vim.lsp.buf.format({ async = true }) end, desc = "Reformat Code" },
  { "<leader>w", "<cmd>w!<CR>", desc = "Save" },

  -- Groups
  { "<leader>l", group = "LSP" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lr", function() vim.lsp.buf.rename() end, desc = "Rename" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },

  { "<leader>f", group = "File Search" },
  { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<leader>ff", function() require('telescope.builtin').find_files() end, desc = "Find Files" },
  { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text Pattern" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },

  { "<leader>s", group = "Search" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
})

