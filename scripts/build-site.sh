#!/bin/sh
set -eu

project_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
output_root="$project_root/dist"
temporary_root=$(mktemp -d "${TMPDIR:-/tmp}/lemonstation-app.XXXXXX")
app_root="$temporary_root/Lemon-Station"

cleanup() {
    rm -rf "$temporary_root"
}
trap cleanup EXIT HUP INT TERM

git clone --quiet --depth 1 --branch app \
    https://github.com/squaredlemon/Lemon-Station.git "$app_root"

mkdir -p "$output_root/assets" "$output_root/downloads" \
    "$output_root/test/assets" "$output_root/test/src/css" "$output_root/test/src/js"

cp "$project_root/index.html" "$output_root/index.html"
cp "$project_root/styles.css" "$output_root/styles.css"
cp "$project_root/script.js" "$output_root/script.js"
cp "$project_root/assets/lemon-station-mark.svg" "$output_root/assets/lemon-station-mark.svg"
cp "$project_root/downloads/Lemon-Station.zip" "$output_root/downloads/Lemon-Station.zip"

cp "$app_root/index.html" "$output_root/test/index.html"
cp "$app_root/assets/squaredlemon-profile.png" "$output_root/test/assets/squaredlemon-profile.png"
cp "$app_root/src/css/styles.css" "$output_root/test/src/css/styles.css"
cp "$app_root/src/js/"*.js "$output_root/test/src/js/"
printf 'Prepared Lemon Station website in %s\n' "$output_root"
printf '  showcase: https://lemonstation.com/\n'
printf '  app:      https://lemonstation.com/test/\n'
