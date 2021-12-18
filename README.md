# dotfiles
My dotfiles



## Tmux

Create tmux config directory:
```
mkdir -p ~/.config/tmux/plugins
```

Go to tmux plugins directory:

1. Clone tmux plugins manager ([tpm](https://github.com/tmux-plugins/tpm)):  
```
git clone https://github.com/tmux-plugins/tpm
```

2. Clone [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible):  
```
git clone https://github.com/tmux-plugins/tmux-sensible
```

3. Clone powerline theme for tmux([tmux-power](https://github.com/wfxr/tmux-power)):  
```
git clone https://github.com/wfxr/tmux-power
```

4. Clone plugin that highlights when you press tmux prefix key([tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)):  
```
git clone https://github.com/tmux-plugins/tmux-prefix-highlight
```


Go to this repository and run:  
```
stow tmux -t ~/.config/tmux
```


