$env.path ++= ["/usr/local/bin" "/opt/homebrew/bin" "/opt/homebrew/opt/llvm/bin" "~/.local/bin" "~/.bun/bin" "~/.cargo/bin" "~/tools"]
$env.config.buffer_editor = "hx"
$env.config.show_banner = false

source ./catppuccin_mocha.nu

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

alias fzf = fzf --preview 'bat -n --color=always {}' --style full

alias c = pbcopy

alias p = pbpaste

