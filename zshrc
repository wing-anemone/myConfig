# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
myConfigPath="$HOME/myConfig"
myCache=${myConfigPath}/cache

# {{{ zinit config begin
ZINIT_HOME="${XDG_DATA_HOME:-${myCache}}/zinit/zinit.git"
if [[ ! -r $ZINIT_HOME ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# 加载 powerlevel10k 主题
zi ice depth=1; 
zi load romkatv/powerlevel10k

# 加载 OMZ 框架及部分插件
zi snippet OMZL::git.zsh
zi snippet OMZL::history.zsh
zi snippet OMZL::key-bindings.zsh
zi snippet OMZL::clipboard.zsh
zi snippet OMZL::completion.zsh
zi snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::termsupport.zsh

# 读取一个文件夹
# apt install subversion
zi ice svn 
zi snippet OMZP::extract

# 不分大小写补全
compinitCache=${myCache}/zsh/zcompdump
if [[ ! -r $compinitCache ]]; then
  mkdir -p $compinitCache
fi
autoload -Uz compinit && compinit -d $compinitCache
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zi load zsh-users/zsh-completions
zi load zsh-users/zsh-autosuggestions
zi load zsh-users/zsh-syntax-highlighting
zi load zdharma/fast-syntax-highlighting

zi snippet OMZP::git
zi snippet OMZP::cp
zi snippet OMZP::gitignore
zi snippet OMZP::colored-man-pages
zi snippet OMZP::common-aliases
zi snippet OMZP::command-not-found # brew tap homebrew/command-not-found

#zi ice wait'0' 
zi load paulirish/git-open

# 在macos中不使用
if [[ $(uname -a | awk '{print $1}') != "Darwin" ]] {
  # alzy loading for zsh-nvm,so not use zi ice wait
  #export NVM_LAZY_LOAD=true
  #zi load lukechilds/zsh-nvm
  #[[ -f ${myCache}/forNvm.zsh ]] || echo "nvm use 18 > /dev/null" > ${myCache}/forNvm.zsh
  #zi ice wait'!1' lucid
  #zi snippet ${myCache}/forNvm.zsh
}
# 补全快捷键重设
# bindkey ',' autosuggest-accept

#zi self-update # zinit 升级
#zi update #升级其他插件,网络不好的时候慎用
#zi delete --clean #清理没有加载的插件
#zi cd 

# }}} zinit config end

[[ ! -f "${myConfigPath}/p10k.zsh" ]] || source ${myConfigPath}/p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.myZsh ] && source ~/.myZsh

alias vi="nvim"
alias setproxy='export http_proxy=http://127.0.0.1:7890; export https_proxy=$http_proxy;' # 设置终端代理
alias unproxy='unset http_proxy https_proxy' # 取消终端代理
# 取消common-aliases库的rm=rm -i
unalias rm

if [[ $(uname -a | awk '{print $1}') != "Darwin" ]] {
  alias setclash="nohup $HOME/clash/clash -d $HOME/clash >/dev/null 2>&1 &!"
  alias unclash='pkill -9 clash'
}
