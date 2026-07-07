#!/usr/bin/env bash
set -e

# The atelier main script guarantees it has already cd'd to the project root
# before calling this, so $PWD is the correct project root.
PROJECT_ROOT="$PWD"

# Read author-surname and short-title from book-settings.yaml.
# Both must be uncommented and filled in before running this script.
SURNAME=$(grep '^author-surname:' book-settings.yaml | sed 's/author-surname:[[:space:]]*//')
SHORT_TITLE=$(grep '^short-title:' book-settings.yaml | sed 's/short-title:[[:space:]]*//')

# Escape & and / so sed treats them as literals in the replacement string.
SURNAME=$(printf '%s' "$SURNAME" | sed 's/[&/]/\\&/g')
SHORT_TITLE=$(printf '%s' "$SHORT_TITLE" | sed 's/[&/]/\\&/g')

if [ -z "$SURNAME" ] || [ -z "$SHORT_TITLE" ]; then
  echo "Error: author-surname and short-title must be set in book-settings.yaml."
  echo "Uncomment and fill in those two lines under the SMF template section."
  exit 1
fi

cd "$PROJECT_ROOT/templates"
unzip word-smf-base.docx -d smf-work
cd smf-work
sed -i "s/SURNAME/${SURNAME}/g" word/header1.xml
sed -i "s/SHORT TITLE/${SHORT_TITLE}/g" word/header1.xml
zip -r ../word-smf.docx .
cd ..
rm -rf smf-work