local status_ok, which_key = pcall(require, "which-key")
if not status_ok then return end
which_key.setup {
    preset = "helix",
  sort = { "manual"}
}

local mappings = {
    {"<leader>/", ":noh<cr>", desc = "clear search highlight"},
    {"<leader>a", "<cmd>Alpha<cr>", desc = "Alpha"}, {
        "<leader>b",
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        desc = "Buffers"
    }, {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer"},
    {"<leader>w", "<cmd>w!<CR>", desc = "Save"},
    {"<leader>W", "<cmd>wq<CR>", desc = "Save and Quit"},
    {"<leader>q", "<cmd>q<CR>", desc = "Quit"},
    {"<leader>Q", "<cmd>q!<CR>", desc = "Force Quit"},
    {"<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer"},
    {"<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight"}, {
        "<leader>P",
        "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
        desc = "Projects"
    }, {
        "<leader>f",
        "<cmd>lua require('user.telescope').project_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        desc = "Find files in project"
    }, {
        "<leader>F",
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        desc = "Find files"
    }, {
        "<leader>t",
        "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>",
        desc = "Find text (current buffer)"
    }, {
        "<leader>T",
        "<cmd>Telescope live_grep theme=ivy<cr>",
        desc = "Find text (working directory)"
    }, 
    -- Packer --
    {"<leader>p", group = "Packer"},
    {"<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile"},
    {"<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install"},
    {"<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync"},
    {"<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status"},
    {"<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update"}, 
    -- Git --
    {"<leader>g", group = "Git"}, {
        "<leader>gj",
        "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
        desc = "Next Hunk"
    }, {
        "<leader>gk",
        "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
        desc = "Prev Hunk"
    },
    {
        "<leader>gl",
        "<cmd>lua require 'gitsigns'.blame_line()<cr>",
        desc = "Blame"
    }, {
        "<leader>gp",
        "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
        desc = "Preview Hunk"
    }, {
        "<leader>gr",
        "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
        desc = "Reset Hunk"
    }, {
        "<leader>gR",
        "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
        desc = "Reset Buffer"
    }, {
        "<leader>gs",
        "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
        desc = "Stage Hunk"
    }, {
        "<leader>gu",
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        desc = "Undo Stage Hunk"
    },
    {"<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file"},
    {"<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch"},
    {"<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit"},
    {"<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff"},  
    -- Search --
    {"<leader>s", group = "Search"},
    {"<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch"},
    {"<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme"},
    {"<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help"},
    {"<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages"},
    {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File"},
    {"<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers"},
    {"<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps"},
    {"<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands"},

    -- WhichKey --
    {"<c-w>", "<cmd>WhichKey<cr>", desc = "Display keybinds"}
}
which_key.add(mappings)
