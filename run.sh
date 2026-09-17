#!/usr/bin/env bash
# Install dependencies (if needed) and serve the site locally at http://localhost:4000
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v bundle >/dev/null 2>&1; then
    echo "Bundler not found. Install Ruby, then run: gem install bundler" >&2
    exit 1
fi

# Keep gems local to the project instead of installing system-wide.
bundle config set --local path 'vendor/bundle'
bundle install

exec bundle exec jekyll serve --livereload
