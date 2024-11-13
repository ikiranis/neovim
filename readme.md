### Install

Clone this repo to `~/.config/nvim` and run `nvim`. It will install all plugins.

### Install fd and ripgrep, for live-grep plugin

```
sudo pamac install fd ripgrep lazygit
```

### Sources

Based on the following tutorials/code

#### Main tutorial

https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn

#### Github repo

https://github.com/cpow/neovim-for-newbs

### Install nerd-fonts, for icons. Run the following script

https://github.com/ryanoasis/nerd-fonts

```
#!/bin/bash

declare -a fonts=(
	BitstreamVeraSansMono
	CodeNewRoman
	DroidSansMono
	FiraCode
	FiraMono
	Go-Mono
	Hack
	Hermit
	JetBrainsMono
	Meslo
	Noto
	Overpass
	ProggyClean
	RobotoMono
	SourceCodePro
	SpaceMono
	Ubuntu
	UbuntuMono
)

version='3.2.1'
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
	mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
	zip_file="${font}.zip"
	download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
	echo "Downloading $download_url"
	wget "$download_url"
	unzip "$zip_file" -d "$fonts_dir"
	rm "$zip_file"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv
```

https://raw.githubusercontent.com/dDeedev/install-nerd-font-linux/refs/heads/main/installer.sh

### Setup copilot, to authenticate with github

```
:Copilot setup
:UpdateRemotePlugins
```

### Use of CopilotChat

```
:CopilotChat
```

### Sources for Copilot Chat

https://github.com/CopilotC-Nvim/CopilotChat.nvim

https://copilotc-nvim.github.io/CopilotChat.nvim/

### Setup xdebug for php

Install vscode-php-debug extension

```
mkdir ~/php-debug && \
cd ~/php-debug && \
git clone https://github.com/xdebug/vscode-php-debug.git . && \
npm install && npm run build
```

Maybe you have to change the pathMappings for docker in the debugging.lua file

```
["/var/www/html"] = "${workspaceFolder}"
```

@source https://esvi.ai/posts/how-i-debug-php-with-neovim/

### Setup Tmux

#### Source tutorial

https://www.youtube.com/playlist?list=PLsz00TDipIfdrJDjpULKY7mQlIFi4HjdR

#### TPM plugin

https://github.com/tmux-plugins/tpm

Install tpm for plugn management

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Tmux config file

```
unbind r
bind r source-file ~/.tmux.conf \; display-message "Config reloaded..."

set -g prefix C-s

set -g mouse on

set -g set-clipboard on

set -g status-position top

set -g default-terminal "tmux-256color"

bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'tmux-plugins/tmux-yank'


# Configure the catppuccin plugin
set -g @catppuccin_flavor "mocha"
set -g @catppuccin_window_status_style "rounded"

# Make the status line pretty and add some modules
set -g status-right-length 100
set -g status-left-length 100
set -g status-left ""
set -gF  status-right "#{@catppuccin_status_directory}"
set -agF status-right "#{@catppuccin_status_session}"
set -agF status-right "#{@catppuccin_status_user}"
set -agF status-right "#{@catppuccin_status_host}"
set -agF status-right "#{E:@catppuccin_status_date_time}"

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

Install tpm plugins with `C-s + I`

### Use tmux-yank for copy to system folder

https://github.com/tmux-plugins/tmux-yank

### Main neovim keybindings

Ctrl + p: Fuzzy finder
Ctrl + e: Old files
Space + Space: Search on project (live-grep)
Alt + c: Copilot chat
Alt + enter: Autocomplete with copilot
Alt + 1: Toggle NeoTree
gcc: Comment line
gbc: Comment block
Ctrl + Alt + l: Format code
