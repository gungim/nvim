#!/bin/zsh

# install language-server
declare -a node_pack=("neovim"
	"prettier"
	"typescript"
	"typescript-language-server"
	"svelte-language-server"
	"@vue/language-server"
	"@vue/typescript-plugin"
	"@tailwindcss/language-server"
	"diagnostic-languageserver"
	"vscode-langservers-extracted"
	"corepack"
	"prisma/language-server"
	"@angular/language-server"
	"@angular/cli"
	"stylelint-lsp"
	"bash-language-server"
)

declare -a python_pack=(
	"gdtoolkit==4.*"
	"pynvim"
)

declare -a rust_pack=(
	"rustfmt"
	"rust-src"
)

function build_command() {
	cmt="$1"
	pack_list="$2"

	for i in "${pack_list[@]}"; do
		cmt+=" $i"
	done
	$cmt
}

function install_pack() {
	printf "\n------------------------- Install RUST Package --------------------------\n"
	build_command "rustup component add" $rust_pack
	printf "\n------------------------- Install PYTHON Package --------------------------\n"
	build_command "pip3 install" $python_pack
	printf "\n------------------------- Install NODE Package --------------------------\n"
	build_command "npm install -g" $node_pack
}

function install_macos_package() {
	declare -a os_pack=(
		"lazygit"
		"lua"
		"lua-language-server"
		"luarocks"
		"stylua"
		"luajit"
		"shfmt"
	)
	printf "\n------------------------- Install OS Package --------------------------\n"
	cmt="$1"

	for i in "${os_pack[@]}"; do
		cmt+=" $i"
	done
	$cmt
}

function install_os_pack() {
	unamestr=$(uname)
	OS=""
	case "${unamestr}" in
	Darwin*) OS="Mac" ;;
	Linux*) OS="Linux" ;;
	MINGW*) OS="Windows" ;;
	*) OS="Unknow" ;;
	esac

	case "${OS}" in
	Mac)
		install_macos_package "brew install"
		;;
	*)
		command ...
		;;
	esac
}

install_macos_package
install_pack
