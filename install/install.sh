printf "\n------------------------- Install Dependencies -------------------------\n"
brew install git curl gcc python3-pip cmake ripgrep python-is-python3 > /dev/null

if ! command -v nvim &> /dev/null
then
    printf "\n------------------------- Install Neovim -------------------------\n"
		brew install neovim
fi

# https://github.com/nodesource/distribuions/blob/master/README.md#debinstall
if ! command -v node &> /dev/null
then
    printf "\n------------------------- Install NodeJS-------------------------\n"
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - > /dev/null
    brew install node
fi

if ! command -v nvim &> /dev/null 
then
    printf "\n------------------------- Backup existing config --------------------------\n"
		mkdir ~/.config/nvim-bak
    mv  ~/.config/nvim ~/.config/nvim-bak
fi

printf "\n------------------------- Download gungim neovim config --------------------------\n"
git clone git@github.com:gungim/nvim.git ~/.config/nvim

if [ ! -d $HOME/.fonts/CascadiaCode ]; then
    printf "\n------------------------- Install nerdfont --------------------------\n"

    TEMP_NAME=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; printf '')
    TEMP_DIR="/tmp/$TEMP_NAME"
    mkdir $TEMP_DIR
    curl -o "$TEMP_DIR/CascadiaCode.zip" -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip > /dev/null
    unzip "$TEMP_DIR/CascadiaCode.zip" -d "$TEMP_DIR/CascadiaCode" > /dev/null
    mkdir -p ~/.fonts > /dev/null
    mv "$TEMP_DIR/CascadiaCode" ~/.fonts/ > /dev/null
fi

printf "\n-------------------------- Install NodeJs Package -----------------\n"

