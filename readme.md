### Install

Clone this repo to `~/.config/nvim` and run `nvim`. It will install all plugins.

### Install some depedencies 

Install fd and ripgrep, for live-grep plugin. Install lazygit for git plugin

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

Install catppuccin plugin

```
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

Copy tmux/tmux.conf to ~/.tmux.conf

Install tpm plugins with `C-s + I`

### Use tmux-yank for copy to system folder

https://github.com/tmux-plugins/tmux-yank

### Make a file, to use for terminal float in tmux

Create file ``~/.local/bin/tmux-toggle-term``

Add the code inside

```
#!/bin/bash

set -uo pipefail

FLOAT_TERM="${1:-}"
LIST_PANES="$(tmux list-panes -F '#F' )"
PANE_ZOOMED="$(echo "${LIST_PANES}" | grep Z)"
PANE_COUNT="$(echo "${LIST_PANES}" | wc -l | bc)"

if [ -n "${FLOAT_TERM}" ]; then
  if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ];then
    tmux detach-client
  else
    tmux popup -d '#{pane_current_path}' -xC -yC -w90% -h80% -E "tmux attach -t popup || tmux new -s popup"
  fi
else
  if [ "${PANE_COUNT}" = 1 ]; then
    tmux split-window -c "#{pane_current_path}"
  elif [ -n "${PANE_ZOOMED}" ]; then
    tmux select-pane -t:.-
  else
    tmux resize-pane -Z -t1
  fi
fi
```

@source https://dev.to/pbnj/tmux-toggle-able-terminals-in-split-panes-or-floating-windows-17pa

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
Space + lg: Commit changes to git (lazygit)
