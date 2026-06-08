-- Note taking plugins

return {
    {
        "renerocksai/telekasten.nvim",
        dependencies = {
            "renerocksai/calendar-vim",
        },
        config = function()
            require("telekasten").setup({
                home = vim.fn.expand("~/Sync/wiki"),
            })

            vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")
            vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
            vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
            vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
            vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
            vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
            vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
            vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
            vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

            -- Insert link when typing [[
            vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
        end,
    },

    {
        "TobinPalmer/pastify.nvim",
        cmd = { "Pastify", "PastifyAfter" },
        -- event = { "BufReadPost" },

        keys = {
            { "<leader>p", "<cmd>PastifyAfter<CR>", mode = { "n", "x" } },
            { "<leader>P", "<cmd>Pastify<CR>", mode = "n" },
        },

        config = function()
            require("pastify").setup({
                opts = {
                    absolute_path = false,
                    apikey = "",
                    local_path = "./assets/",
                    save = "local",
                    filename = function()
                        return vim.fn.expand("%:t:r")
                            .. "_"
                            .. os.date("%Y-%m-%d_%H-%M-%S")
                    end,
                    default_ft = "markdown",
                },

                ft = {
                    html = '<img src="$IMG$" alt="$NAME$">',
                    markdown = '![$NAME$]($IMG$)',
                    tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
                    css = 'background-image: url("$IMG$");',
                    js = 'const img = new Image(); img.src = "$IMG$";',
                    xml = '<image src="$IMG$" />',
                    php = '<?php echo "<img src=\\"$IMG$\\" alt=\\"$NAME$\\">"; ?>',
                    python = "# $IMG$",
                    java = "// $IMG$",
                    c = "// $IMG$",
                    cpp = "// $IMG$",
                    swift = "// $IMG$",
                    kotlin = "// $IMG$",
                    go = "// $IMG$",
                    typescript = "// $IMG$",
                    ruby = "# $IMG$",
                    vhdl = "-- $IMG$",
                    verilog = "// $IMG$",
                    systemverilog = "// $IMG$",
                    lua = "-- $IMG$",
                },
            })
        end,
    },
}
