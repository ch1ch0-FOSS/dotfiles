# dotfiles

Professional terminal workflow optimized for infrastructure operations. 11 CLI tools configured for efficiency, consistency, and reproducibility.

## What This Demonstrates

**For Engineering Teams:**

Developer ergonomics and tooling expertise. Thoughtful tool selection for infrastructure work. Reproducible development environments with version-controlled configurations. Consistent workflow across systems via symlink-based deployment.

## Toolkit Overview (11 Tools)

### Core Workflow

**Shell: Zsh**  
Custom aliases and functions for common infrastructure tasks. Git workflow helpers for conventional commits. Ansible dry-run patterns. Service management shortcuts.

**Editor: Neovim**  
LSP integration for Ansible, Bash, Markdown, YAML. Syntax highlighting for infrastructure-as-code. Git integration (fugitive). File navigation (telescope, nvim-tree).

**Terminal: Foot**  
Wayland-native terminal emulator. GPU-accelerated rendering. Low latency. Minimal resource usage. Configured for Solarized Dark color scheme.

**Multiplexer: Tmux**  
Session persistence across SSH disconnects. Custom layouts for infrastructure monitoring. Split-pane workflows (logs + editor + execution). Vim-style keybindings.

### Infrastructure Tools

**Version Control: Git**  
Conventional commit helpers. Pre-commit hook integration. Diff and merge tools configured. Aliases for common workflows (ga, gc, gp, gst).

**Note-Taking: Zk**  
Zettelkasten CLI for documentation workflows. Integrates with srv-m1m documentation pattern. Template support for atomic entries. Fast full-text search across notes.

**File Manager: Ranger**  
Vi-keybinding file navigation. Image preview support. Bulk file operations. Integration with system clipboard.

**Search: Ripgrep + Fd**  
Fast codebase navigation. Respects .gitignore patterns. Parallel execution for speed. Used by Neovim telescope integration.

### UI and Productivity

**Launcher: Fuzzel**  
Application launcher for Sway. Keyboard-driven interface. Fast fuzzy search. Low memory footprint.

**Git UI: Lazygit**  
Terminal-based Git interface. Stage/unstage hunks interactively. Commit message editor integration. Branch and stash management.

**Browser: Vimb**  
Keyboard-driven web browser. Vim-style navigation (hjkl). Custom bookmarks and quickmarks. Minimal UI for focus.

## Key Features

### Infrastructure-Optimized Workflows

**Git Aliases for Conventional Commits:**

.zshrc
alias gc='git commit -m'
alias gcf='git commit -m "feat: "'
alias gcd='git commit -m "docs: "'
alias gcx='git commit -m "fix: "'

**Ansible Workflow Helpers:**

.zshrc functions
ansible-check() {
ansible-playbook -i "$1" "$2" --check --diff
}

ansible-syntax() {
ansible-playbook "$1" --syntax-check
}

**Service Management Shortcuts:**

.zshrc
alias sctl='systemctl'
alias scst='systemctl status'
alias scre='systemctl restart'
alias jctl='journalctl'


### Reproducible Configuration

**Symlink-Based Deployment:**  
All configs symlinked from `~/.dotfiles/` to appropriate locations. Changes propagate immediately without reinstall. Easy to track in version control.

**Idempotent Install Script:**  
Safe to run multiple times. Backs up existing configs before symlinking. Validates symlink integrity post-install. Installs plugin managers (vim-plug, tpm).

**Version-Controlled:**  
Every configuration change tracked in Git. Easy rollback to previous states. Transferable across systems via git clone.

### Thoughtful Defaults

**Consistent Color Scheme:**  
Solarized Dark across all tools (terminal, Neovim, tmux). Reduces eye strain. Professional appearance.

**Optimized Keybindings:**  
Vim-style navigation where possible (hjkl). Tmux prefix: `Ctrl-a` (easier than default `Ctrl-b`). Muscle memory consistency across tools.

**Minimal Distractions:**  
No unnecessary plugins or bloat. Fast startup times (Neovim <50ms). Focus on productivity over aesthetics.

## Installation

Clone to ~/.dotfiles
git clone https://github.com/ch1ch0-FOSS/dotfiles.git ~/.dotfiles

Run install script
cd ~/.dotfiles
./install.sh

**What install.sh does:**

1. **Backs up existing configs** (if found) to `~/.dotfiles-backup/`
2. **Creates symlinks** for all tool configurations
3. **Installs plugin managers:**
   - vim-plug (Neovim plugin manager)
   - tpm (Tmux plugin manager)
4. **Validates symlink integrity** (ensures all links point correctly)
5. **Prints summary** of installed configurations

**Estimated time:** 2-3 minutes

## Directory Structure

dotfiles/
├── shell/
│ ├── .zshrc → ~/.zshrc
│ ├── .bashrc → ~/.bashrc
│ ├── .zshenv → ~/.zshenv
│ ├── aliases.sh # Sourced by shells
│ ├── functions.sh # Sourced by shells
│ └── profile.sh # Sourced by shells
├── editors/
│ ├── nvim/ → ~/.config/nvim/
│ │ ├── init.lua # Neovim entry point
│ │ ├── lua/ # Lua configuration modules
│ │ └── after/ # Filetype-specific configs
│ └── zk/
│ ├── config.toml → ~/.config/zk/config.toml
│ └── templates/ → ~/.config/zk/templates/
├── terminal/
│ ├── foot/
│ │ └── foot.ini → ~/.config/foot/foot.ini
│ └── tmux/
│ └── .tmux.conf → ~/.tmux.conf
├── terminal-ui/
│ ├── fuzzel/
│ │ └── fuzzel.ini → ~/.config/fuzzel/fuzzel.ini
│ ├── lazygit/
│ │ └── config.yml → ~/.config/lazygit/config.yml
│ └── vimb/
│ └── config → ~/.config/vimb/config
├── window-manager/
│ ├── config → ~/.config/sway/config
│ └── colors.conf → ~/.config/sway/colors.conf
├── git/
│ └── .gitconfig → ~/.gitconfig
├── install.sh # Automated installation script
└── README.md # This file


## Configuration Highlights

### Neovim LSP Setup

**Supported languages:**
- Ansible (ansible-language-server)
- Bash (bash-language-server)
- Markdown (marksman)
- YAML (yaml-language-server)

**Key plugins:**
- nvim-lspconfig (LSP integration)
- nvim-cmp (autocompletion)
- telescope.nvim (fuzzy finding)
- nvim-tree.lua (file explorer)
- fugitive (Git integration)

**Custom keybindings:**
- `<leader>ff` - Find files (telescope)
- `<leader>fg` - Live grep (telescope)
- `<leader>e` - Toggle file explorer
- `gd` - Go to definition (LSP)
- `K` - Show hover documentation (LSP)

### Tmux Layout Example

**Infrastructure monitoring layout:**

Pane 1 (top): Service logs
journalctl -u forgejo -f

Pane 2 (left): Neovim editing playbooks
nvim playbooks/services/forgejo.yml

Pane 3 (right): Ansible execution
ansible-playbook -i inventory/production playbooks/services/forgejo.yml --check

Created via tmux commands:

tmux split-window -v
tmux split-window -h
tmux select-pane -t 0

### Zsh Workflow Shortcuts

**Git workflow:**

gst # git status
ga . # git add .
gc "message" # git commit -m "message"
gp # git push
gpl # git pull
gd # git diff

**System monitoring:**

sctl status forgejo # systemctl status forgejo
jctl -u forgejo -f # journalctl -u forgejo -f

**Ansible helpers:**

ansible-check inventory/production playbooks/site.yml
ansible-syntax playbooks/services/forgejo.yml


## Tool-Specific Features

### Neovim

**Ansible development:**
- Syntax highlighting for Jinja2 templates
- YAML indentation enforcement
- Variable completion via LSP
- Lint integration (ansible-lint)

**Git integration:**
- Stage hunks interactively (fugitive)
- View commit history
- Resolve merge conflicts
- Blame annotations

### Tmux

**Session management:**
- Named sessions for different projects
- Automatic session restore via tmux-resurrect
- Copy mode with vi keybindings
- Mouse support for pane resizing

**Customizations:**
- Status bar shows: hostname, date/time, active pane
- Prefix: `Ctrl-a` (easier reach than `Ctrl-b`)
- Pane navigation: `Prefix + hjkl` (vim-style)

### Zk (Zettelkasten)

**Integration with srv-m1m:**
- Templates match srv-m1m atomic pattern
- Automatic date formatting (YYYY-MM-DD)
- Tags and backlinking support
- Full-text search across all notes

**Custom templates:**
- Session log template
- Task handoff template
- Issue documentation template

## Validation

**Verify symlinks:**

Check all symlinks point correctly
find ~ -maxdepth 1 -type l -ls | grep dotfiles
ls -la ~/.config/nvim
ls -la ~/.config/foot

**Test configurations:**

Neovim startup time
nvim --startuptime startup.log +qall
cat startup.log | grep "NVIM STARTED"

Tmux configuration valid
tmux source ~/.tmux.conf

Zsh configuration loads
zsh -c "echo 'Config loaded'"


## Related Infrastructure

**Production Environment:** [fedora-asahi-srv-m1m](https://github.com/ch1ch0-FOSS/fedora-asahi-srv-m1m) - Infrastructure managed with these tools

**Automation Playbooks:** [ansible-playbooks](https://github.com/ch1ch0-FOSS/ansible-playbooks) - Playbooks edited with this toolkit

## Requirements

**Minimum:**
- Fedora Linux 40+ (or compatible distro)
- Zsh shell
- Neovim 0.9+
- Tmux 3.0+
- Git 2.30+

**Optional (enhances functionality):**
- Sway window manager (for fuzzel launcher)
- LSP servers (for Neovim code intelligence)
- Ripgrep, Fd (for telescope search)
- Lazygit (for terminal Git UI)

## License

MIT

---


