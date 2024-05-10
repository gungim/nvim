#!/bin/zsh

printf "\n------------------------- LANGUAGE SERVER ------------------------------\n"

# install language-server
declare -a node_pack=("neovim"
		"sharp-cli"
		"prettier"
		"typescript"
		"typescript-language-server"
		"svelte-language-server"
		"bash-language-server"
		"@vue/language-server"
		"@tailwindcss/language-server"
		"diagnostic-languageserver"
		"vscode-langservers-extracted"
		"corepack"
		"eas-cli"
		"prisma/language-server"
		"@angular/language-server"
		"@angular/cli"
		"stylelint-lsp")

printf "\n------------------------- Install Node Package -------------------------\n"
for i in "${node_pack[@]}";
do
	printf "\nInstall $i\n"
	npm install -g $i
done

# install python pack 
declare -a python_pack=(
	"gdtoolkit==4.*"
	"pynvim"
)
printf "\n------------------------- Install Python Package ------------------------\n"
for i in "${python_pack[@]}";
do 
	printf "\nInstall $i\n"
	pip3 install $i
done
#  
#
declare -a rust_pack=(
	"rustfmt"
	"rust-src"
)
printf "\n------------------------- Install Rust Package --------------------------\n"
for i in "${rust_pack[@]}";
do 
	printf "\nInstall $i\n"
	rustup component add  $i
done
