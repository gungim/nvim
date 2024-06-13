#!/bin/zsh

# install language-server
function install_node_pack() {
	declare -a node_pack=("neovim"
		"prettier"
		"typescript"
		"typescript-language-server"
		"svelte-language-server"
		"@vue/language-server"
		"@tailwindcss/language-server"
		"diagnostic-languageserver"
		"vscode-langservers-extracted"
		"corepack"
		"prisma/language-server"
		"@angular/language-server"
		"@angular/cli"
		"stylelint-lsp"
		"bash-language-server")

	printf "\n------------------------- Install Node Package -------------------------\n"
	for i in "${node_pack[@]}"; do
		printf "\nInstall $i\n"
		npm install -g $i
	done
}

# install python pack
function install_python_pack() {
	declare -a python_pack=(
		"gdtoolkit==4.*"
		"pynvim"
	)
	printf "\n------------------------- Install Python Package ------------------------\n"
	for i in "${python_pack[@]}"; do
		printf "\nInstall $i\n"
		pip3 install $i
	done
}

function install_rust_package() {
	declare -a rust_pack=(
		"rustfmt"
		"rust-src"
	)
	printf "\n------------------------- Install Rust Package --------------------------\n"
	for i in "${rust_pack[@]}"; do
		printf "\nInstall $i\n"
		rustup component add $i
	done
}

function install_macos_package() {
	declare -a macos_pack=(
		"chafa"
		"lazygit"
		"lua"
		"lua-language-server"
		"luarocks"
		"stylua"
		"shfmt"
	)
	printf "\n------------------------- Install Macos Package --------------------------\n"
	cmt="brew install"

	for i in "${macos_pack[@]}"; do
		cmt+=" $i"
	done
	$cmt
}

install_node_pack
