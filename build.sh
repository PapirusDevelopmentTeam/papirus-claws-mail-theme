#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

declare -a THEMES=(
	ePapirus
	Papirus
	Papirus-Adapta
	Papirus-Adapta-Nokto
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
				-e 's/#d3dae3/#ffffff/gI' \
				-e 's/#5c616c/#6e6e6e/gI' \
				-e 's/#5294e2/#5294e2/gI' '{}' \;
			;;
		Papirus)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#d3dae3/#d3dae3/gI' \
				-e 's/#5c616c/#5c616c/gI' \
				-e 's/#5294e2/#5294e2/gI' '{}' \;
			;;
		Papirus-Dark)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#d3dae3/#d3dae3/gI' \
				-e 's/#5c616c/#d3dae3/gI' \
				-e 's/#5294e2/#5294e2/gI' '{}' \;
			;;
		Papirus-Light)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#d3dae3/#5c616c/gI' \
				-e 's/#5c616c/#5c616c/gI' \
				-e 's/#5294e2/#5294e2/gI' '{}' \;
			;;
		Papirus-Adapta)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#d3dae3/#cfd8dc/gI' \
				-e 's/#5c616c/#414c52/gI' \
				-e 's/#5294e2/#00bcd4/gI' '{}' \;
			;;
		Papirus-Adapta-Nokto)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#d3dae3/#cfd8dc/gI' \
				-e 's/#5c616c/#cfd8dc/gI' \
				-e 's/#5294e2/#00bcd4/gI' '{}' \;
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
