# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH="$HOME/.cargo/bin:$PATH"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

commit_markdown() {
	cd ~/md
	git add .
	git commit 
	echo "commited markdown changes. \n\
		returning to previous directory."
	cd -
}

# Aliases for common use
alias cr="cargo run"
alias cb="cargo build"
alias swayconf="nvim ~/.config/sway/config"
alias md="cd ~/md/active && nvim ."
alias mdcommit=commit_markdown
alias vi="nvim"
alias viconf='nvim ~/.dotfiles/nvim/init.lua'


# clean ps1
# PS1='\[\e[32m\]┌──(\[\e[94;1m\]\u\[\e[94m\]@\[\e[94m\]\h\[\e[0;32m\])-[\[\e[38;5;46;1m\]\w\[\e[0;32m\]] [\[\e[32m\]$?\[\e[32m\]]\n\[\e[32m\]╰─\[\e[94;1m\]\$\[\e[0m\] '
# PS1='\[\e[1;35m\]┌─[\u@\h]─[\w]\n└─\$ \[\e[0m\]'
PS1='\n\[\033[32m\]\w\n\[\033[0m\]$ '

