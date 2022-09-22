## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup
Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```

---

**NOTE** make sure you have [node](https://nodejs.org/en/) installed, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).


- npm plugins
using command `npm i -g 'package'` to install package
├── @tailwindcss/language-server
├── cssmodules-language-server
├── eslint
├── ls_emmet
├── neovim
├── prettier
├── stylelint
├── typescript-language-server
├── typescript
└── vscode-langservers-extracted
- brew plugins
using command `brew install 'package'` to install package
├── gcc
└── vscode-langservers-extracted@4.4.0
