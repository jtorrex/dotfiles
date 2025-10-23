return {
    {
        "nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim
    },
    {
    "nvim-telescope/telescope.nvim", -- Extendable fuzzy finder over lists
    config = function ()
        dependencies = { "nvim-lua/plenary.nvim" }
        require('telescope').setup({ file_ignore_patterns = { "node%_modules/.*" } })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', 'ff', builtin.find_files, {})
        vim.keymap.set('n', 'fg', builtin.live_grep, {})
        vim.keymap.set('n', 'fb', builtin.buffers, {})
        vim.keymap.set('n', 'fh', builtin.help_tags, {})
    end
    },
    {
        "nvim-telescope/telescope-media-files.nvim"
    }
}
