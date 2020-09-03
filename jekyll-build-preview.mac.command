#! /bin/bash

cd "$(dirname "$0")"

base="../web-preview.git"
site="${base}/docs"
tmp="${base}/tmp"

export PATH="$HOME/opt/homebrew/jekyll/bin":$PATH

rm -rf "${tmp}"
mkdir -pv "${tmp}"

bundle exec jekyll build --destination "${tmp}/web-preview" --baseurl "/web-preview"

export NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# Validate images and links (internal & external).
# https://github.com/gjtorikian/html-proofer

# --disable_external
bundle exec htmlproofer \
  --allow-hash-href \
  --http-status-ignore="429" \
  --url-ignore="/www.eclipse.org.embed-cdt/" \
  "${tmp}"

rm -rf "${site}"
mkdir -pv "${site}"
mv "${tmp}/web-preview"/* "${site}"
rm -rf "${tmp}"

echo
echo "Done"
