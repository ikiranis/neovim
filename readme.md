### Install

Clone this repo to `~/.config/nvim` and run ``nvim``. It will install all plugins.

### Install fd and ripgrep, for live-grep plugin

```
sudo pamac install fd ripgrep
```

### Sources

Based on the following tutorials/code

#### Main tutorial

https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn

#### Github repo 

https://github.com/cpow/neovim-for-newbs

### Install nerd-fonts, for icons. Run the following script

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

version='2.1.0'
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
