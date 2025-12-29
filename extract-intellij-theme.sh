#!/bin/bash
# Extract IntelliJ theme files from local installation
# Usage: ./extract-intellij-theme.sh [theme-name] [output-dir]
#
# Examples:
#   ./extract-intellij-theme.sh darcula /tmp
#   ./extract-intellij-theme.sh expUI_dark /tmp

set -euo pipefail

THEME_NAME="${1:-darcula}"
OUTPUT_DIR="${2:-.}"

# Find IntelliJ installation
INTELLIJ_PATHS=(
    "$HOME/Applications/IntelliJ IDEA.app"
    "/Applications/IntelliJ IDEA.app"
    "$HOME/Applications/IntelliJ IDEA CE.app"
    "/Applications/IntelliJ IDEA CE.app"
)

INTELLIJ_PATH=""
for path in "${INTELLIJ_PATHS[@]}"; do
    if [[ -d "$path" ]]; then
        INTELLIJ_PATH="$path"
        break
    fi
done

if [[ -z "$INTELLIJ_PATH" ]]; then
    echo "Error: Could not find IntelliJ IDEA installation" >&2
    exit 1
fi

APP_JAR="$INTELLIJ_PATH/Contents/lib/app.jar"

if [[ ! -f "$APP_JAR" ]]; then
    echo "Error: Could not find app.jar at $APP_JAR" >&2
    exit 1
fi

echo "Found IntelliJ at: $INTELLIJ_PATH"

# List available themes
echo ""
echo "Available themes in app.jar:"
unzip -l "$APP_JAR" 2>/dev/null | grep -E "\.theme\.json$" | awk '{print $4}' | sed 's|themes/||' | sed 's|\.theme\.json||'
echo ""

# Extract the theme file
THEME_FILE="themes/${THEME_NAME}.theme.json"

if ! unzip -l "$APP_JAR" 2>/dev/null | grep "$THEME_FILE" > /dev/null; then
    echo "Error: Theme '$THEME_NAME' not found in app.jar" >&2
    echo "Try one of the themes listed above" >&2
    exit 1
fi

OUTPUT_FILE="$OUTPUT_DIR/${THEME_NAME}.theme.json"
unzip -p "$APP_JAR" "$THEME_FILE" > "$OUTPUT_FILE"

echo "Extracted: $OUTPUT_FILE"

# Also extract the color scheme XML if available
SCHEME_FILE="DefaultColorSchemesManager.xml"
SCHEME_OUTPUT="$OUTPUT_DIR/$SCHEME_FILE"

if unzip -l "$APP_JAR" 2>/dev/null | grep "$SCHEME_FILE" > /dev/null; then
    unzip -p "$APP_JAR" "$SCHEME_FILE" > "$SCHEME_OUTPUT"
    echo "Extracted: $SCHEME_OUTPUT"
    echo ""
    echo "Note: The color scheme XML contains syntax highlighting colors."
    echo "Search for 'name=\"Darcula\"' or similar to find the scheme section."
fi

echo ""
echo "Done!"
