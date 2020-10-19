#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

declare -a THEMES=(
	ePapirus
	Papirus
	Papirus-Dark
	Papirus-Light
)

: "${DEST_DIR:=$SCRIPT_DIR}"
: "${SRC_DIR:=$SCRIPT_DIR/src}"
: "${BUILD_DIR:=$SCRIPT_DIR/build}"

for theme in "${THEMES[@]}"; do
	printf '=> Generate "%s" ...\n' "$theme" >&2

	dest_theme_dir="$DEST_DIR/$theme"
	build_theme_dir="$BUILD_DIR/$theme"

	rm -rf "$build_theme_dir" "$dest_theme_dir"
	mkdir -p "$build_theme_dir" "$dest_theme_dir"

	cp -R "$SRC_DIR"/* "$build_theme_dir"

	case "$theme" in
		ePapirus)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#dfdfdf/#ffffff/gI' \
				-e 's/#444444/#6e6e6e/gI' \
				-e 's/#4285f4/#4285f4/gI' '{}' \;
			;;
		Papirus)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#dfdfdf/#dfdfdf/gI' \
				-e 's/#444444/#444444/gI' \
				-e 's/#4285f4/#4285f4/gI' '{}' \;
			;;
		Papirus-Dark)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#dfdfdf/#dfdfdf/gI' \
				-e 's/#444444/#dfdfdf/gI' \
				-e 's/#4285f4/#4285f4/gI' '{}' \;
			;;
		Papirus-Light)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#dfdfdf/#444444/gI' \
				-e 's/#444444/#444444/gI' \
				-e 's/#4285f4/#4285f4/gI' '{}' \;
			;;
	esac

	# Create README.txt
	cat > "$dest_theme_dir/README.txt" <<-EOF
	${theme_name} theme for Claws Mail

	Author: Alexey Varfolomeev <https://github.com/varlesh>
	Homepage: https://github.com/PapirusDevelopmentTeam/papirus-claws-mail-theme
	License: GPL-3.0
	EOF

	# Create .claws_themeinfo
	cat > "$dest_theme_dir/.claws_themeinfo" <<-EOF
	${theme_name}
	Alexey Varfolomeev
	https://github.com/PapirusDevelopmentTeam/papirus-claws-mail-theme
	EOF

	# Convert to bitmap images
	find "$build_theme_dir" -name '*.svg' | while read -r file; do
		bitmap_file="$dest_theme_dir/$(basename -s .svg "$file").png"

		printf 'Converting "%s" -> "%s"\n' "$file" "$bitmap_file" >&2
		rsvg-convert -f png "$file" -o "$bitmap_file"
	done
done
