return
local -r PKT_TXT="~/dotfiles/packages.txt"
local -r AUR_TXT="~/dotfiles/aur.txt"

function mydotfiles {
	readonly cmd="$1"
	shift

	case "${cmd}" in
		install)
			case "${1}" in
				aur)
					_install_all_aur
					;;
				*)
					_install_all_pkgs
					;;
			esac
			;;
		add)
			case "${1}" in
				aur)
					shift
					_add_pkg_aur "$@"
					;;
				*)
					_add_pkg "$@"
					;;
			esac
			;;
		*)
			echo "Usage: mydotfiles install|add [aur] [PKG | ...]"
			;;
	esac
}

function _add_pkg {
	for pkg in "$@"; do
		echo $pkg
	done
}

function _add_pkg_aur {
	for pkg in "$@"; do
		echo $pkg
	done
}

function _install_all_pkgs {
	sudo pacman -S $(sort -u "${PKG_TXT}")
}

function _install_all_aur {
	yay -S $(sort -u "${AUR_TXT}")
}
