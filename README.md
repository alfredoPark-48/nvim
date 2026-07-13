# 🌌 Neovim Configuration

A modern, fast, and feature-rich Neovim configuration built with Lua, leveraging **lazy.nvim** for plugin management, autocompletion, treesitter syntax highlighting, LSP, local/inline AI integration, and aesthetic UI polishing.

---

## 🛠️ Pre-Installations & System Dependencies

To ensure all plugins function perfectly, make sure you have the following system-level tools installed:

### 1. Core Requirements
*   **Neovim v0.12.0+** (Highly recommended. Neovim v0.12+ includes **built-in Tree-sitter** support for core languages, providing high-performance, out-of-the-box syntax highlighting without needing external treesitter plugins).
*   **Git** (needed for Lazy.nvim and plugin updates)
*   **Nerd Font** (highly recommended for file/folder icons). Make sure to set your terminal font to a Nerd Font (e.g., *FiraCode Nerd Font*, *JetBrainsMono Nerd Font*).

### 2. External Search Utilities
Used by Telescope for high-speed file searching and text grepping:
*   **Ripgrep (`rg`)**: Required for `<leader>fg` (Live Grep).
    *   *macOS*: `brew install ripgrep`
    *   *Linux*: `sudo apt install ripgrep` or `sudo pacman -S ripgrep`
*   **FD (`fd`)**: Recommended for `<leader>ff` (Find Files).
    *   *macOS*: `brew install fd`
    *   *Linux*: `sudo apt install fd-find` or `sudo pacman -S fd`

### 3. System Clipboard Utilities
Required for the `<leader>y` and `<leader>Y` system clipboard copy bindings:
*   **macOS**: Works out of the box (uses `pbcopy`/`pbpaste`).
*   **Linux (X11)**: Requires `xclip` or `xsel`.
    *   `sudo apt install xclip` or `sudo pacman -S xclip`
*   **Linux (Wayland)**: Requires `wl-clipboard`.
    *   `sudo apt install wl-clipboard`

### 4. Language & Formatter Runtimes
Required for LSPs, formatters, and linters:
*   **Node.js & npm/pnpm/yarn**: Required for GitHub Copilot (`copilot.lua`), TypeScript LSP (`ts_ls`), and Web-related formatting/tooling (like `prettier`/`prettierd`).
*   **Python 3 & pip/venv**: Required for Python LSP (`pylsp`) and formatting tools like `black` or `isort`.
*   **Lua / StyLua**: Required for Lua file formatting (`conform.nvim`). Can be installed via package managers (e.g., `brew install stylua`, `cargo install stylua`).
*   **OpenCode CLI**: Required to run OpenCode AI agent. Ensure the backend is available.

> [!TIP]
> **Installing Formatters and LSPs via Mason:**
> You can easily install, update, and manage your LSPs, linters, and formatters directly within Neovim. Open Neovim and run:
> ```vim
> :Mason
> ```
> Use the interactive interface to search for formatters like `stylua`, `black`, `isort`, `prettierd`, `prettier`, `goimports`, `gofumpt`, `rustfmt`, or `google-java-format`, and press `i` to install them.

---

## 🚀 Installation & Bootstrapping

This configuration automatically bootstraps `lazy.nvim` on start. Simply clone this repository into your Neovim configuration directory:

```bash
git clone https://github.com/alfredoPark-48/init.lua.git ~/.config/nvim
```

Upon launching Neovim (`nvim`), `lazy.nvim` will automatically download and install all the plugins listed below.

---

## 🔌 Installed Plugins & Architecture

Your plugins are organized modularly under `lua/plugins/`. Here is what each file configures:

### 🧩 Core & UI (`lua/plugins/ui.lua`)
*   **[cyberdream.nvim](https://github.com/scottmckendry/cyberdream.nvim)**: A sleek, modern, high-contrast dark colorscheme optimized for performance. Custom syntax highlights comments as dark grey italics.
*   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: A fast, clean statusline at the bottom of Neovim, styled to match the Cyberdream theme.

### 🤖 AI Assist (`lua/plugins/ai.lua`)
*   **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)**: Fast inline code completions via GitHub Copilot (ghost text).
*   **[opencode.nvim](https://github.com/sudo-tee/opencode.nvim)**: Context-aware AI coding agent directly in your editor.

### 🗂️ File Explorer (`lua/plugins/explorer.lua`)
*   **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)**: A modern sidebar directory explorer supporting file icons, nested git status displays, and auto-focusing on your active file.

### 🖥️ Terminal Manager (`lua/plugins/terminal.lua`)
*   **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)**: A flexible terminal manager supporting bottom-split layouts and floating terminals.

### 🔍 Search & Navigation (`lua/plugins/telescope.lua`, `lua/plugins/navigation.lua`)
*   **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: The industry-standard fuzzy finder for files, text searches, open buffers, and Neovim help manuals.
*   **[harpoon](https://github.com/theprimeagen/harpoon)**: Fast workspace navigation that allows pinning files to specific slots and jumping to them instantly.
*   **[undotree](https://github.com/mbbill/undotree)**: A visual branching undo-history browser to revert code state easily.

### 💻 IDE & Coding features (`lua/plugins/lsp.lua`, `lua/plugins/utilities.lua`, `lua/plugins/editing.lua`, `lua/plugins/gopher.lua`, `lua/plugins/treesitter.lua`)
*   **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Native LSP configuration manager.
*   **[mason.nvim](https://github.com/williamboman/mason.nvim)**, **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** & **[mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)**: Automatic installation of language servers (`lua_ls`, `ts_ls`, `pylsp`, `html`, `gopls`, `rust_analyzer`, `jdtls`) and external formatters/tools (`stylua`, `isort`, `black`, `prettierd`, `prettier`, `goimports`, `gofumpt`, `google-java-format`, `gomodifytags`, `impl`, `gotests`).
*   **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: The completion engine supporting LSP completions, local buffer matching, path completions, and snippets.
*   **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: Lightweight snippet execution engine.
*   **[conform.nvim](https://github.com/stevearc/conform.nvim)**: Code auto-formatter triggering on file save. Supports `stylua` for Lua, `black`/`isort` for Python, `prettier`/`prettierd` for JS/TS, `goimports`/`gofumpt` for Go, `rustfmt` for Rust, and `google-java-format` for Java.
*   **[trouble.nvim](https://github.com/folke/trouble.nvim)**: Prettified summary lists for compilation errors, LSP diagnostics, and quickfix lists.
*   **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Automatically inserts closing brackets, quotes, and braces.
*   **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Modern commenting support.
*   **[gopher.nvim](https://github.com/olexsmir/gopher.nvim)**: Structural helper actions for Go, supporting automated JSON and YAML tag additions.
*   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: For advanced parsing and treesitter syntax grammars (managing Go, GoMod, and GoWork parsers).
*   **Native Tree-sitter Auto-Attach**: Automatically triggers `vim.treesitter.start()` plus Tree-sitter folding and indentation when opening Java, Python, Go, Rust, and other supported buffers.
*   **[markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)**: Renders live markdown pages in your browser.

### 🐙 Git Integration (`lua/plugins/git.lua`)
*   **[vim-fugitive](https://github.com/tpope/vim-fugitive)**: The premier git wrapper allowing you to run git commands natively within Neovim.
*   **[git-blame.nvim](https://github.com/f-person/git-blame.nvim)**: Displays inline virtual-text git blames for the current line.
*   **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Renders indicators in the editor gutter highlighting added, modified, or deleted lines.

---

## 🤖 AI Model Injection & Customization

OpenCode provides an AI agent directly into your editor, interacting seamlessly with context, buffers, diagnostics, and visual selections.

### Configuration
By default, this configuration uses `sudo-tee/opencode.nvim`. Ensure you have the OpenCode CLI properly configured in your system.

```lua
require("opencode").setup({})
```
---

## ⌨️ Custom Keymaps Reference

Your Leader key is configured to `<Space>`.

### 🗃️ General Navigation & Window Management
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `<C-h>` | Normal | Move cursor to left window split |
| `<C-j>` | Normal | Move cursor to split below |
| `<C-k>` | Normal | Move cursor to split above |
| `<C-l>` | Normal | Move cursor to right window split |
| `J` | Visual | Move highlighted block down |
| `K` | Visual | Move highlighted block up |
| `<C-d>` | Normal | Scroll half page down and center cursor |
| `<C-u>` | Normal | Scroll half page up and center cursor |
| `<C-f>` | Normal | Scroll full page down and center cursor |
| `<C-b>` | Normal | Scroll full page up and center cursor |
| `n` | Normal | Jump to next search result (centered) |
| `N` | Normal | Jump to previous search result (centered) |
| `<Esc>` | Normal | Clear active search highlighting |

### 📋 Clipboard & Editing
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `<leader>y` | Normal / Visual | Yank selected text to the **system clipboard** |
| `<leader>Y` | Normal | Yank the entire current line to the **system clipboard** |
| `<leader>p` | Visual | Paste over visual selection without losing current register yank |
| `<leader>d` | Normal / Visual | Delete text without copying it to your clipboard (Blackhole `_` register) |
| `gcc` | Normal | Comment / uncomment current line |
| `gc` | Visual | Comment / uncomment highlighted lines |

### 🔍 Telescope & Explorer Panels
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `<leader>ff` | Normal | Find files inside the project |
| `<leader>fg` | Normal | Live Grep search for text within files |
| `<leader>fb` | Normal | Search through active open buffers |
| `<leader>fh` | Normal | Find items in Neovim help manual |
| `<leader>e` | Normal | Toggle File Explorer side panel (Neo-tree) |
| `<leader>pv` | Normal | Focus File Explorer on current active file |
| `<leader>u` | Normal | Toggle Undotree visual panel |

### 🖥️ Terminal (ToggleTerm)
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `<leader>t` / `<leader>tb` | Normal | Toggle Bottom Terminal (horizontal split) |
| `<leader>tf` | Normal | Toggle Floating Terminal |
| `<C-\>` | Normal / Insert / Terminal | Global shortcut to toggle active terminal |
| `jk` | Terminal | Enter Normal mode within terminal buffer |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Terminal | Switch to left/down/up/right split windows directly |

### 🛠️ Diagnostics & Code Issues (Trouble)
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `<leader>xx` | Normal | Toggle inline project diagnostics list |
| `<leader>xq` | Normal | Toggle Neovim Quickfix list |

### 🤖 AI (Copilot & OpenCode)
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `<M-l>` *(Alt/Opt + L)* | Insert | Accept full Copilot suggestion |
| `<M-w>` *(Alt/Opt + W)* | Insert | Accept next word of Copilot suggestion |
| `<M-A-l>` *(Alt/Opt + Shift + L)* | Insert | Accept next line of Copilot suggestion |
| `<M-]>` | Insert | Cycle to next Copilot suggestion |
| `<M-[>` | Insert | Cycle to previous Copilot suggestion |
| `<C-]>` | Insert | Dismiss Copilot suggestion |
| `<leader>oc` | Normal / Visual | Toggle OpenCode chat panel |
| `<leader>oa` | Normal / Visual | Open OpenCode prompt actions menu |

### 📌 Harpoon File Pinning
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `<leader>a` | Normal | Pin current file to Harpoon slot |
| `<leader>h` | Normal | Open Harpoon pinned files menu panel |
| `<leader>1` | Normal | Jump to Harpoon slot 1 |
| `<leader>2` | Normal | Jump to Harpoon slot 2 |
| `<leader>3` | Normal | Jump to Harpoon slot 3 |
| `<leader>4` | Normal | Jump to Harpoon slot 4 |

### 🐙 Git Integration
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `<leader>gs` | Normal | Open Fugitive Git Status panel |

### 💻 LSP Attach Actions (Only active when LSP is connected)
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `gd` | Normal | Jump to definition of symbol under cursor |
| `K` | Normal | Show hover documentation popup |
| `<leader>vrn` | Normal | Rename all occurrences of symbol under cursor |
| `<leader>vca` | Normal | Show available code actions |

### 🐹 Go Development (Gopher)
| Keymap | Mode | Action |
| :--- | :---: | :--- |
| `<leader>gsj` | Normal | Add JSON struct tags to struct under cursor |
| `<leader>gsy` | Normal | Add YAML struct tags to struct under cursor |

