return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- the plugin does not support lazy-loading
    build = ":TSUpdate", -- keep installed parsers in sync with the plugin
    config = function()
        -- The rewritten `main` branch needs Neovim >= 0.11 (vim.fs.joinpath and
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

        local ts = require("nvim-treesitter")

        -- was: ensure_installed = { ... }
        local ensure_installed = { "python", "vim", "go", "markdown", "yaml", "hcl" }

        -- was: require("nvim-treesitter.configs").setup { ... }
        -- that module was dropped by the rewrite; setup() now only configures
        -- the plugin itself, parsers are installed separately.
        ts.setup()
        ts.install(ensure_installed) -- no-op for parsers already present

        -- every parser this plugin ships (was: auto_install = true)
        local supported = {}
        for _, lang in ipairs(ts.get_available()) do
            supported[lang] = true
        end

        -- was: highlight = { enable = true } -> highlighting is opt-in per filetype now
        local fetching = {}
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("NvimTreesitter", { clear = true }),
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if lang and supported[lang] and not fetching[lang] then
                    fetching[lang] = true -- try to fetch each parser only once
                    ts.install(lang)
                end
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
