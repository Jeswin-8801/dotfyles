![image](https://github.com/user-attachments/assets/87b96099-271b-4bf0-abeb-7191bb7cbc68)

![image](https://github.com/user-attachments/assets/3a34e958-1d7c-4160-baca-1e2cf74550db)

![image](https://github.com/user-attachments/assets/2f6e32dc-1f7d-4987-bcff-33c6d987f3f4)

![image](https://github.com/user-attachments/assets/b2a45eaa-30e3-491e-951c-44c913b08bb9)

<div align="center">

# <img src="https://github.com/user-attachments/assets/93df6e6d-31d1-486c-8dcb-557169d54139" alt="docker-svgrepo-com" style="width: 30px; height: 30px;"> dotfyles

</div>

> [!Note]
>
> All colorschemes and themes are specifically set according to the theme set in the `wezterm` config.
>
> - `wezterm` config is intended to be used on a windows system.
> - `fish` set as the default shell.

> [!Important]
>
> Make sure to update the paths configured which can be listed using the command below.
>
> ```fish
> rg "[\/\\\\]+home[\/\\\\]+jeswins" --hidden
> ```

> (Modify paths to images if necessary)

## Installation

- Install `Wezterm` on Windows

- In WSL, clone the repo and execute:

```bash
./install.sh
```

- Restart Session to see the changes

- Place the wezterm config file in the Windows User Home DIR

> ```bash
> cp wezterm/.wezterm.lua /mnt/c/Users/Lupin/
> ```

> [!Important]
> Make sure to check if your WSL distro has the correct name by checking:
>
> ```shell
> rg "Ubuntu" wezterm/.wezterm.lua
> ```
>
> Change if needed

- Also make sure you have the Bold, Italic and the Regular versions of the Nerd Font Installed

> Change the font in `.wezterm.lua`

## Installed Packages

#### UI

- oh-my-posh
- neofetch

#### Utilities

- btop
- superfile
- lnav
- lsd
- duf
- batcat
- pandoc
- fzf
- dysk
- tcolor (_color picker_)
- zoxide
- fend (_beefed up cli calculator_)

#### Git

- lazygit
- delta

#### Help

- cht.sh
- tldr

#### Sessions

- zellij
- zellij-runner

#### Editor

- neovim

#### Docker

- lazydocker
- dlnav (_custom function that tails the log of a docker compose service in lnav_)
- docker-volume-snapshot

> Programming
>
> - python
> - java
> - rust
> - pnpm (_node package manager_)
> - pdm (_python venv_)
> - spring-initializr-cli

_Checkout `install.sh` for all packages_

## Neovim Plugins

```lua
  Total: 66 plugins

    ● aerial.nvim
    ● blink.cmp
    ● boole.nvim
    ● bufferline.nvim
    ● catppuccin
    ● flash.nvim
    ● friendly-snippets
    ● gitsigns.nvim
    ● kanagawa.nvim
    ● lazy.nvim
    ● lazydev.nvim
    ● lazydocker.nvim
    ● LazyVim
    ● lua-async-await
    ● lualine.nvim
    ● mason-lspconfig.nvim
    ● mason-tool-installer.nvim
    ● mason.nvim
    ● mini.ai
    ● mini.bracketed
    ● mini.hipatterns
    ● mini.nvim
    ● mini.pairs
    ● noice.nvim
    ● nui.nvim
    ● nvim-colorizer.lua
    ● nvim-dap
    ● nvim-java
    ● nvim-java-core
    ● nvim-java-dap
    ● nvim-java-refactor
    ● nvim-java-test
    ● nvim-lint
    ● nvim-lspconfig
    ● nvim-notify
    ● nvim-surround
    ● nvim-treesitter
    ● nvim-treesitter-textobjects
    ● nvim-ts-autotag
    ● nvim-web-devicons
    ● oxocarbon.nvim
    ● persistence.nvim
    ● plenary.nvim
    ● refactoring.nvim
    ● render-markdown.nvim
    ● smear-cursor.nvim
    ● snacks.nvim
    ● spring-boot.nvim
    ● todo-comments.nvim
    ● toggleterm.nvim
    ● trouble.nvim
    ● ts-comments.nvim
    ● vim-illuminate
    ● which-key.nvim
    ○ conform.nvim
    ○ csvview.nvim
    ○ diffview.nvim
    ○ eldritch
    ○ gitgraph.nvim
    ○ grapple.nvim
    ○ grug-far.nvim
    ○ mini.files
    ○ mini.icons
    ○ rainbow_csv.nvim
    ○ tokyonight.nvim

  Disabled (1)
    ○ hologram.nvim
```

## Additional Applications

> To enable copy to clipboard from neovim in WSL, install `win32yank`.

- In Powershell:

```pwsh
winget install --id=equalsraf.win32yank  -e
```
