# nvim config

> This is my personal NeoVim config that I configured for development and documenting.

All config based on [lazy.nvim](https://github.com/folke/lazy.nvim).
I've tried a lot of different distros (kickstart, astro, chad) and decided to create custom (yeah...).

It is very simple and opionated but contains everything I need for the moment.

## Setup

First backup and move previous config:

```bash
mv ~/.config/nvim ~/.config/nvim.YYYY-MM-DD
```

```bash
git clone git@github.com:niklucky/nvim-config.git ~/.config/nvim
```

## Git integration

`lazygit`:

```shell
brew install jesseduffield/lazygit/lazygit
```

https://github.com/jesseduffield/lazygit

## eslint

After updating eslint to a new flat config, I had to update the eslint plugin in nvim:

[Instructions on nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint)

Installing vscode eslint server:

```shell
npm i -g vscode-langservers-extracted
```

## Tech stack

Something was setup and tested because I need it right now, something I will setup later.

| Language              | Snippets | Formatting | Linting | Debugging |
| --------------------- | -------- | ---------- | ------- | --------- |
| Typescript            | ✅       | ✅         | ✅      |           |
| Golang                | ✅       | ✅         | ✅      | ✅        |
| HTML                  | ✅       | ✅         | ✅      |
| Svelte                | ✅       | ✅         | ✅      |
| React/Solid (TSX/JSX) | ✅       | ✅         | ✅      |
| Astro                 | ✅       | ✅         | ✅      |
| Tailwind              | ✅       | ✅         | ✅      | —         |
| Rust                  |          |            |         |
| Python                |          |            |         |
| C                     |          |            |         |
| C++                   |          |            |         |
