# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias vim="nvim"
alias fojo="~/personal/scripts/tmux-worspaces/FoodJournalWorkspace.sh"
alias pna="~/personal/scripts/tmux-worspaces/PhoneNumberAnalyzerWorkspace.sh"

PATH="$HOME/.local/bin:$PATH:/home/bim/.dotnet/tools"

export ZSH="$HOME/.oh-my-zsh"
export MSBuildSDKsPath=$( echo /usr/share/dotnet/sdk/10.*/Sdks );
export DOTNET_ROOT=/opt/dotnet

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	archlinux
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Added by get-aspire-cli.sh
export PATH="$HOME/.aspire/bin:$PATH"
