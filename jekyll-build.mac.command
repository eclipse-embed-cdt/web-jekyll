#! /bin/bash

cd "$(dirname "$0")"

site="../web-html/docs"
export PATH="$HOME/opt/homebrew/jekyll/bin":$PATH

rm -rf "${site}"
mkdir -p "${site}"

bundle exec jekyll build --destination "${site}"

export NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# Validate images and links (internal & external).
# https://github.com/gjtorikian/html-proofer

# --disable_external
bundle exec htmlproofer \
  --allow-hash-href \
  --http-status-ignore="429" \
  --url-ignore="/www.eclipse.org.embed-cdt/" \
  "${site}"

echo
echo "Done"
