#!/bin/zsh

declare -a node_pack=("neovim")

declare -a python_pack=(
	"gdtoolkit==4.*"
	"pynvim"
)

declare -a os_pack=(
	"lazygit"
	"luarocks"
	"luajit"
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
	printf "\n------------------------- Install OS Package --------------------------\n"
	install_macos_package "brew install" $os_pack
}

install_pack

nvim --headless -c "MasonInstall clang-format shfmt rustfmt prettier stylua shellcheck" -c "qall"
