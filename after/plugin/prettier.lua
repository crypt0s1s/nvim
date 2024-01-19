local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  cli_options = {
      semi = false,
      singleQuote = true,
      printWidth = 80,
      trailingComma = "all",
      arrowParens = "always",
      jsxSingleQuote = true,
      bracketSpacing = true,
      importOrderSeparation = true,
      importOrderSortSpecifiers = true,
  },
})


