# New Mac Environment Setup
1. Mac System:
    - Update OS
    - Customize Mac settings
2. Xcode:
    - Download/Install Xcode from App Store 
    - Install xcode command line tools via `xcode-select --install`. (There is a bug with xcode 12 where you just need to get the .dmg from apple's website to get the tools and cannot install through command line)
        - Note: Make sure this is done after Xcode finishes! Check with `gcc` or `xcode-select -p`
3. Git:
    - Set commit email address: `git config --global user.email "USERNAME@users.noreply.github.com"`
    - Set commit name: `git config --global user.name "NAME"`
    - (Optional) Add SSH key to computer and version control service
4. Homebrew: 
    - Install homebrew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
    - Before brewing/casking: `brew update`. `brew doctor`.
    - Cask: `brew tap homebrew/cask`. `brew search <package>`. `brew cask install <package>`.
        - Cask suggestions: google-chrome, spotify, webstorm, postman
    - Brew: `brew install <name>`
        - Brew suggestions: tree, wget
5. Terminal: import custom terminal settings (should have it uploaded in dotfiles repo)
6. Vim:
    - Make directories: `mkdir -p ~/.vim/{pack/myPlugs/start,colors}`
    - Copy over .vimrc, color schemes, plugins/packages.
7. Dotfiles:
    - Copy these over, i.e. .bash_profile
7. NVM (NPM + Node):
    - Install NVM: (make sure version is correct in the url): `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash` 
        - Note: Make sure xcode command line tools are installed and .bash_profile is present in ~ without any NVM lines (might happen if you copied over the dotfile)
        - Verify with `command -v nvm`, which should output `nvm`
    - Install latest version of node: `nvm install node`
    - Install npm stuff
