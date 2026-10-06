return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- the plugin does not support lazy-loading
    build = ":TSUpdate", -- keep installed parsers in sync with the plugin
    config = function()
        -- The plugin's `main` branch needs Neovim >= 0.11 (vim.fs.joinpath and
        -- friends). Bail out cleanly on older builds instead of aborting startup.
        if vim.fn.has("nvim-0.11") == 0 then
            local v = vim.version()
            vim.notify_once(
                "nvim-treesitter: needs Neovim >= 0.11 (running "
                    .. v.major
                    .. "."
                    .. v.minor
                    .. "), see :checkhealth",
                vim.log.levels.WARN
            )
            return
        end

        -- was: ensure_installed = { ... }
        local ensure_installed = { "python", "vim", "go", "markdown", "yaml", "hcl" }

        local ts = require("nvim-treesitter")

        -- `require("nvim-treesitter").install()` only exists since 522e0c69
        -- (2025-04-27, "remove ensure_install field"). A checkout pinned older
        -- (lazy-lock.json is machine-local, so pins drift per machine) still
        -- installs through the internal install module. Supporting both shapes
        -- keeps a stale pin working instead of erroring out at startup.
        local function install(langs)
            if type(ts.install) == "function" then
                pcall(ts.install, langs)
                return true
            end
            local ok, installer = pcall(require, "nvim-treesitter.install")
            if ok and type(installer.install) == "function" then
                pcall(installer.install, langs, {})
                return true
            end
            return false
        end

        if not install(ensure_installed) then
            vim.notify_once(
                "nvim-treesitter: unsupported revision, run :Lazy update nvim-treesitter",
                vim.log.levels.WARN
            )
        end

        -- every parser this plugin ships (was: auto_install = true)
        local supported = {}
        if type(ts.get_available) == "function" then
            for _, lang in ipairs(ts.get_available()) do
                supported[lang] = true
            end
        end

        -- was: highlight = { enable = true } -> highlighting is opt-in per filetype
        local fetching = {}
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("NvimTreesitter", { clear = true }),
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if lang and supported[lang] and not fetching[lang] then
                    fetching[lang] = true -- try to fetch each parser only once
                    install({ lang })
                end
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
