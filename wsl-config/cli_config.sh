alias cls=clear
if [ -d ~/.local/bin ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Python
alias py='python3'

# Java
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

# NVM
if [ -d ~/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# deta
if [ -d ~/.deta/bin ]; then
    export PATH="$HOME/.deta/bin:$PATH"
fi

# bun
if [ -d ~/.bun ]; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH=$BUN_INSTALL/bin:$PATH
    # bun completions
    [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
fi

# deno
if [ -d ~/.deno ]; then
    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
fi

# Rust
if [ -f ~/.cargo/env ]; then
    . "$HOME/.cargo/env"
fi

# Julia
if [ -d ~/.julia/bin ]; then
    export PATH="$HOME/.julia/bin:$PATH"
fi

# SDKMan
if [ -f ~/.sdkman/bin/sdkman-init.sh ]; then
    export SDKMAN_DIR="$HOME/.sdkman"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
