-- Visual tree
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons" },
    config = function ()
        require("nvim-tree").setup {
          sync_root_with_cwd = true,
          sort = {
            sorter = "case_sensitive",
          },
          update_focused_file = {
            enable = true,
            update_cwd = true,
          },
          filters = {
            dotfiles = false,
            git_ignored = false,
          },
          git = {
            enable = true,
          },
          renderer = {
            group_empty = true,
            root_folder_label = ":t",
            icons = {
              glyphs = {
                default = "",
                symlink = "",
                folder = {
                  arrow_open = "",
                  arrow_closed = "",
                  default = "",
                  open = "",
                  empty = "",
                  empty_open = "",
                  symlink = "",
                  symlink_open = "",
                },
                git = {
                  unstaged = "",
                  staged = "S",
                  unmerged = "",
                  renamed = "➜",
                  untracked = "U",
                  deleted = "",
                  ignored = "◌",
                },
              },
            },
          },
          diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
              hint = "",
              info = "",
              warning = "",
              error = "",
            },
          },
          view = {
            width = 30,
            side = "left",
          },
          on_attach = function(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
              return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.map.on_attach.default(bufnr)

            vim.keymap.set("n", "l",     api.node.open.edit,         opts "Open")
            vim.keymap.set("n", "<CR>",  api.node.open.edit,         opts "Open")
            vim.keymap.set("n", "o",     api.node.open.edit,         opts "Open")
            vim.keymap.set("n", "h",     api.node.navigate.parent_close, opts "Close Node")
            vim.keymap.set("n", "v",     api.node.open.vertical,     opts "Vertical Split")
          end,
        }
    end
}
