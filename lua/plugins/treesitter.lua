return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        -- Disable for files over 1 MB to avoid slowdowns
        disable = function(lang, buf)
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > 1024 * 1024 then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
