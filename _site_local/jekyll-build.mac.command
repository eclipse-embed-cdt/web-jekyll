#! /bin/bash

cd "$(dirname "$0")"

site="../web-html.git"

export PATH="$HOME/opt/homebrew/jekyll/bin":$PATH
bundle exec jekyll build --destination "${site}"

export NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# Validate images and links (internal & external).
 bundle exec htmlproofer \
    "${site}"

echo
echo "Done"
