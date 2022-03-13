set paths = [{~/perl5/bin/} $@paths {~/.emacs.d/bin} {~/.local/coursier/bin} {/opt/cuda/bin/}]
set paths = [{~/.mix/escripts/} $@paths {~/.cargo/bin}]
set paths = [{~/.yarn/bin/} $@paths {~/go/bin}]
set paths = [$@paths {~/.local/bin/} /usr/local/bin]
# eval (zoxide init elvish | slurp)
use github.com/muesli/elvish-libs/theme/powerline
use github.com/zzamboni/elvish-completions/builtins

var proxy-url = 127.0.0.1:4780
set-env http_proxy $proxy-url
set-env https_proxy $proxy-url

if (not (has-env CUDAToolkit_ROOT)) {
    set-env CUDAToolkit_ROOT "/opt/cuda/bin"
}

if (not (has-env LANG)) {
    set-env LANG en_US.UTF-8
}

if (not (has-env FZF_DEFAULT_COMMAND)) {
    set-env FZF_DEFAULT_COMMAND 'fd --type=f --hidden --follow --exclude .git'
}

if (not ?(which shasum>/dev/null)) {
    set paths = [$@paths {/usr/bin/core_perl}]
}

fn ssh {|@args|
    if (eq $E:TERM xterm-kitty) {
        kitty +kitten ssh $@args
    } else {
        e:ssh $@args
    }
}

fn cargo-update {
    put ?(cargo install (ls {~/.cargo/bin/}))
}

