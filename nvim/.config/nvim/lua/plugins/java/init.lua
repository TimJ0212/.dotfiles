return {
  "nvim-java/nvim-java",
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {},
        },
        setup = {
          jdtls = function()
            require("java").setup({
              -- your nvim-java configuration goes here
            })
          end,
        },
      },
    },
  },
}
