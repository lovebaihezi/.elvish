set paths = [{~/perl5/bin/} $@paths {~/.emacs.d/bin} {~/.local/coursier/bin} {/opt/cuda/bin/}]
set paths = [{~/.mix/escripts/} $@paths {~/.cargo/bin}]
set paths = [{~/.yarn/bin/} $@paths {~/go/bin}]
# set paths = [{~/.config/yarn/global/node_modules/.bin} $@paths {~/.local/bin/}]

use github.com/muesli/elvish-libs/theme/powerline
use github.com/zzamboni/elvish-completions/builtins

if (eq $E:CUDAToolkit_ROOT '') {
    set E:CUDAToolkit_ROOT = "/opt/cuda/bin"
}

if (eq $E:LANG '') {
    set E:LANG = en_US.UTF-8
}

if (eq $E:FZF_DEFAULT_COMMAND '') {
    set E:FZF_DEFAULT_COMMAND = 'fd --type=f --hidden --follow --exclude .git'
}

if (not ?(which shasum>/dev/null)) {
    set paths = [$@paths {/usr/bin/core_perl}]
}

fn ssh {|@args|
    if (eq $E:TERM xterm-kitty) {
        kitty +kitten ssh $@args
    } else {
        ssh $@args
    }
}

fn cargo-update {
    put ?(cargo install (ls {~/.cargo/bin/}))
}

