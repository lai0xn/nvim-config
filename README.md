# Neovim Config

Personal Neovim configuration built on top of [NvChad](https://github.com/NvChad/NvChad).

## Features

- NvChad starter layout with a custom `inuyasha` theme.
- Neo-tree and Oil file navigation.
- Harpoon 2 quick file switching.
- HTML, CSS, and Go LSP setup.
- Conform-based formatting integration.
- Reproducible plugin versions through `lazy-lock.json`.

## Requirements

- Neovim 0.10 or newer.
- Git.
- A C compiler for Treesitter parsers.
- A Nerd Font for icons.
- Optional language tooling:
  - `gopls` for Go.
  - `stylua` for Lua formatting.

## Installation

Back up any existing Neovim configuration first:

```sh
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

Clone this repository:

```sh
git clone https://github.com/lai0xn/nvim-config.git ~/.config/nvim
```

Start Neovim:

```sh
nvim
```

Lazy.nvim will install plugins on the first launch. Restart Neovim after the initial install finishes.

## Updating

Pull the latest config changes:

```sh
git -C ~/.config/nvim pull
```

Update plugins inside Neovim:

```vim
:Lazy sync
```

## Useful Keymaps

| Key | Action |
| --- | --- |
| `;` | Enter command mode |
| `jk` | Leave insert mode |
| `<C-n>` | Toggle Neo-tree |
| `<leader>e` | Focus Neo-tree |
| `-` | Open Oil in the parent directory |
| `<leader>o` | Open Oil |
| `<leader>ha` | Add file to Harpoon |
| `<leader>hh` | Open Harpoon menu |
| `<leader>hn` | Go to next Harpoon item |
| `<leader>hp` | Go to previous Harpoon item |
| `<leader>t[` | Previous tab |
| `<leader>t]` | Next tab |
| `<leader>tn` | New tab |
| `<leader>tc` | Close tab |
| `<leader>to` | Close other tabs |

## Notes

This config expects NvChad's plugin defaults and imports modules from `nvchad`. Local changes live in `lua/`.
