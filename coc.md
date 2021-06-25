* Language servers
  * ccls
  * clangd
* install ccls: `sudo pacman -S ccls`
  * Might need to build from source in other OSes: [follow this](https://github.com/MaskRay/ccls/wiki/Build)
* install coc in vim config:
  * `Plug 'neoclide/coc.nvim', {'branch': 'release'}`
* `:CocConfig` and then set:
```
{
"languageserver": {
  "ccls": {
    "command": "ccls",
    "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"],
    "rootPatterns": [".ccls", "compile_commands.json", ".git/", ".hg/"],
    "initializationOptions": {
        "cache": {
          "directory": "/tmp/ccls"
        }
      }
  }
}
}
```

* Copy example coc keybindings and other vim config from [https://github.com/neoclide/coc.nvim#example-vim-configuration](https://github.com/neoclide/coc.nvim#example-vim-configuration)
* Enable C++17, add a `.ccls` file in project root with:
```
clang++
%h %cpp -std=c++17
```
* Go through example CoC keybindings:
  * Tab for completion
  * `<cr>` to choose first completion item
  * `gd` to jump to definition
  * `gr` for references
  * `gy` for type definition
  * `K` for documentation
  * `<leader>rn` for renaming
  * `if`, `ic` for fun/class selection in visual mode
  * Diagnostics:
    * `<space>a` to list diagnostics
    * `[g` and `]g` to go prev/next in diagnostics
