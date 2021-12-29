set paths = [{~/perl5/bin/} $@paths {~/.emacs.d/bin} {~/.local/coursier/bin}]
set paths = [{~/.mix/escripts/} $@paths {~/.cargo/bin}]
set paths = [{~/.yarn/bin/} $@paths {~/go/bin}]
set paths = [{~/.config/yarn/global/node_modules/.bin} $@paths {~/.local/bin/}]
use github.com/muesli/elvish-libs/theme/powerline
use github.com/zzamboni/elvish-completions/builtins

if (eq $E:LANG '') {
    set E:LANG = en_US.UTF-8
}

fn ssh {|@args|
    if (eq $E:TERM xterm-kitty) {
        kitty +kitten ssh $@args
    } else {
        ssh $@args
    }
}

