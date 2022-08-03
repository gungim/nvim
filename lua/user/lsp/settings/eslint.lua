local util = require 'lspconfig.util'
return {
  default_config = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
      'vue',
    },
    root_dir = util.root_pattern(
      '.eslintrc.js',
      '.eslintrc.cjs',
      '.eslintrc.yaml',
      '.eslintrc.yml',
      '.eslintrc.json',
      'package.json'
    ),
    settings = {
      validate = 'on',
      packageManager = 'npm',
      useESLintClass = false,
      codeActionOnSave = {
        enable = false,
        mode = 'all',
      },
      format = true,
      quiet = false,
      onIgnoredFiles = 'off',
      rulesCustomizations = {},
      run = 'onType',
      -- nodePath configures the directory in which the eslint server should start its node_modules resolution.
      -- This path is relative to the workspace folder (root dir) of the server instance.
      nodePath = '',
      -- use the workspace folder location or the file location (if no workspace folder is open) as the working directory
      workingDirectory = { mode = 'location' },
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = 'separateLine',
        },
        showDocumentation = {
          enable = true,
        },
      },
    },
  }
}
