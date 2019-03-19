# New Mac Environment Setup
0. Go through Mac settings and customize them (will provide more details in the future)
1. Update OS
2. Get Xcode from App Store 
3. Install xcode command line tools via `xcode-select --install`.
    - This does not need to be done if already installed via Xcode. Check with `gcc` or `xcode-select -p`
4. Change commit email address with `git config --global user.email "ehu23@users.noreply.github.com"`
5. Install homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
    - brew update. brew doctor.
    - Cask: `brew tap caskroom/cask`. `brew search <package>`. `brew cask install <package>`.
    - Cask suggestions: google-chrome, spotify, webstorm, 
    - brewing: `brew install <name>`
6. Set terminal settings (will detail this later)
7. Vim: folder path = ~/.vim/pack/myplugs/start and ~/.vim/colors (details later)
8. Copy over other dotfiles.
9. Install nvm to get node and npm:
    - (make sure version is correct): `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash` 
    - Install latest version of node: `nvm install node`
    - install npm stuff

