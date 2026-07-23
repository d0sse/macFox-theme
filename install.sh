#!/usr/bin/env bash
#
# macFox-theme installer
# Copies the theme's CSS files into your Firefox profile's `chrome` folder.
#
# Usage:
#   ./install.sh                 # auto-detect the default Firefox profile
#   ./install.sh /path/to/profile  # install into a specific profile folder
#
# macOS only. After running, fully restart Firefox to apply changes.

set -euo pipefail

# CSS files that make up the theme (everything else in the repo is docs/assets).
CSS_FILES=(
	userChrome.css
	userContent.css
	variables.css
	navbar.css
	urlbar.css
	icons.css
	tabbar.css
)

# Resolve the directory this script lives in (the repo root).
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

FIREFOX_DIR="${HOME}/Library/Application Support/Firefox"

die() { printf 'Error: %s\n' "$1" >&2; exit 1; }

# --------------------------------------------------------------------------
# Determine the target profile folder.
# --------------------------------------------------------------------------
profile=""

if [[ $# -ge 1 ]]; then
	# Explicit profile path supplied.
	profile="$1"
else
	[[ -d "$FIREFOX_DIR" ]] || die "Firefox directory not found at $FIREFOX_DIR"
	ini="${FIREFOX_DIR}/profiles.ini"

	if [[ -f "$ini" ]]; then
		# Prefer the [Install*] section's Default (the profile Firefox launches).
		rel="$(awk -F= '/^\[Install/{f=1} f&&/^Default=/{print $2; exit}' "$ini" || true)"
		# Fall back to a [Profile*] entry marked Default=1.
		if [[ -z "$rel" ]]; then
			rel="$(awk -F= '
				/^\[Profile/{p=""; d=0}
				/^Path=/{p=$2}
				/^Default=1/{d=1}
				d&&p{print p; exit}' "$ini" || true)"
		fi
		[[ -n "$rel" ]] && profile="${FIREFOX_DIR}/${rel}"
	fi

	# Last resort: glob for a *.default-release folder.
	if [[ -z "$profile" ]]; then
		profile="$(find "${FIREFOX_DIR}/Profiles" -maxdepth 1 -name '*.default-release' 2>/dev/null | head -n1 || true)"
	fi
fi

[[ -n "$profile" ]] || die "Could not determine a Firefox profile. Pass one explicitly: ./install.sh /path/to/profile"
[[ -d "$profile" ]] || die "Profile folder does not exist: $profile"

# --------------------------------------------------------------------------
# Copy the CSS into <profile>/chrome/.
# --------------------------------------------------------------------------
chrome_dir="${profile}/chrome"
mkdir -p "$chrome_dir"

printf 'Installing macFox-theme into:\n  %s\n\n' "$chrome_dir"
for f in "${CSS_FILES[@]}"; do
	src="${SCRIPT_DIR}/${f}"
	[[ -f "$src" ]] || die "Missing theme file: $src"
	cp "$src" "$chrome_dir/"
	printf '  copied %s\n' "$f"
done

cat <<'EOF'

Done. Next steps:
  1. In about:config, ensure these are set to true:
       toolkit.legacyUserProfileCustomizations.stylesheets
       svg.context-properties.content.enabled
       browser.tabs.allow_transparent_browser
       layout.css.color-mix.enabled
       browser.theme.native-theme
  2. Fully restart Firefox (Cmd+Q, then reopen) to apply the theme.
EOF
