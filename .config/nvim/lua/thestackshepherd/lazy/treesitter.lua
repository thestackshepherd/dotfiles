return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- Install parsers on first load
            require("nvim-treesitter").install({
                "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                "jsdoc", "bash", "go",
            })

            -- Register custom templ parser before TSUpdate fires
            vim.api.nvim_create_autocmd("User", {
                pattern = "TSUpdate",
                once = true,
                callback = function()
                    require("nvim-treesitter.parsers").templ = {
                        install_info = {
                            url = "https://github.com/vrischmann/tree-sitter-templ.git",
                            files = { "src/parser.c", "src/scanner.c" },
                            branch = "master",
                        },
                    }
                end,
            })

            vim.treesitter.language.register("templ", "templ")

            -- Enable treesitter highlighting per filetype
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local buf = args.buf
                    if vim.bo[buf].filetype == "html" then return end

                    local max_filesize = 100 * 1024
                    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        vim.notify(
                            "File larger than 100KB, treesitter disabled for performance",
                            vim.log.levels.WARN,
                            { title = "Treesitter" }
                        )
                        return
                    end

                    pcall(vim.treesitter.start, buf)
                end,
            })

            -- Enable treesitter indentation per filetype
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesitter-context").setup({
                enable = true,
                multiwindow = false,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = "outer",
                mode = "cursor",
                separator = nil,
                zindex = 20,
                on_attach = nil,
            })
        end,
    },
}
