My dotfiles that I want to have consistent across all environments, in particular
`~/.zshrc`, `~/.vimrc`, and `~/.tmux.conf` files. It will also pull in
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for zsh customization.

The are managed by [homeshick](https://github.com/andsens/homeshick). You 
will probably need to bootstrap this on every server. I use the following shell
script:

```bash
#!/bin/bash -ex

### Install homeshick ###
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

GIT_SSL_NO_VERIFY=true homeshick --batch clone http://svrvmw-lfkntxxa-monit.ipnms.net/chalverson/dotfiles.git

### Clone public repos ###
homeshick clone --batch robbyrussell/oh-my-zsh

### Link it all to $HOME ###
homeshick link --force

ln -s $HOME/.homesick/repos/oh-my-zsh $HOME/.oh-my-zsh

echo "Log in again to start your proper shell"
```
