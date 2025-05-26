if status is-interactive
    # Commands to run in interactive sessions can go here
    oh-my-posh init fish --config /home/jeswins/.config/oh-my-posh/themes/eva.omp.json | source
end

# Aliases
alias ls lsd
alias ll "lsd -alhtr"
alias vi vim
alias bat batcat
alias cheat "cht.sh"
alias cheat.sh "cht.sh --shell"
alias top btop
alias tmux "tmux -f $HOME/.config/tmux/tmux.conf"
alias cls clear
alias fd fdfind
alias zj zellij
alias zjr zellij-runner
alias df dysk

# Environment Variables
set EDITOR vim
set -Ux FZF_DEFAULT_COMMAND 'find . -type f -print' # Modify fzf to seach for all files
set -x COLORTERM 24bit # set extended color support for terminal using given var

# cd for windows paths
function cd
    if test (count $argv) -gt 0
        if test $argv[1] = --win
            set -e argv[1]
            set -l win_path $argv[1]
            set -l wsl_path (printf '%s\n' $win_path | sed -e 's/\\\/\//g' -e 's/C:/\/mnt\/c/g')
            builtin cd $wsl_path
            return
        end
    end
    builtin cd $argv
end

function pdm
    set cmd $argv[1]

    if test "$cmd" = shell
        eval (pdm venv activate)
    else
        command pdm $argv
    end
end

# Show docker-compose logs in lnav
# On passing 0 args, 'fzf' will show a list of running services
# Only accepts one ARG (service name), if supplied
# NOTE: Must be run inside the project folder containing the docker-compose.yml file
function dlnav
    if test (count $argv) -eq 0
        set services (docker-compose config --services)
        set selected_service (echo $services | tr ' ' '\n' | fzf --header="Select Service to view logs")
        docker-compose logs -f $selected_service | lnav
    else
        docker-compose logs -f $argv | lnav
    end
end

set -x EDGE_PATH "/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"
set distro_name "$(lsb_release -i | grep ID | awk -F' ' '{print$NF}')-$(lsb_release -r | grep Release | awk -F' ' '{print$NF}')"

# Function to open files in Edge browser from WSL
function edge
    set filename $argv[1]
    set fullpath (pwd)"/"$filename
    set wslpath "\\\\wsl.localhost\\$distro_name"(string replace -ar '/' '\\\\\\\\' "$fullpath")
    $EDGE_PATH $wslpath
end

# Remove Welcome Message
set fish_greeting

# Show neofetch on Terminal Startup (only if the user has started a session and not processes like ftp or ssh)
if status --is-interactive
    neofetch
end

# nvm use node lts
nvm use --lts >/dev/null

# pnpm
set -gx PNPM_HOME "/home/jeswins/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Set Maven Home
set -x MAVEN_HOME /usr/local/bin/apache-maven
# Add Maven bin directory to the PATH
set -x PATH $MAVEN_HOME/bin $PATH
# Set JAVA_HOME
set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk-amd64
# Set batcat as the man pager
set -x MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | batcat -p -lman'"
# Zellij Runner Banners directory
set -x ZELLIJ_RUNNER_BANNERS_DIR ~/.config/zellij/banners

# Zoxide
zoxide init fish | source

# Pyenv
set -x PYENV_ROOT $HOME/.pyenv
if test -d "$PYENV_ROOT/bin"
    set -x PATH $PYENV_ROOT/bin $PATH
end
pyenv init - | source
