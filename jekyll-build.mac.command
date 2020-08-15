#! /bin/bash

cd "$(dirname "$0")"

site="../web-html.git/docs"

rm -rf "${site}"
mkdir -p "${site}"

export PATH="$HOME/opt/homebrew/jekyll/bin":$PATH
bundle exec jekyll build --destination "${site}"

export NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# Validate images and links (internal & external).
# https://github.com/gjtorikian/html-proofer
# --disable_external
bundle exec htmlproofer \
  --allow_hash_href \
  --url_ignore="/www.eclipse.org/embed-cdt/" \
  "${site}"

echo
echo "Done"
