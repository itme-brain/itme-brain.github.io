set shell := ["bash", "-euo", "pipefail", "-c"]

# Show available project workflows.
default:
    @just --list

# Build the production site into _site.
build:
    jekyll build

# Serve the site locally with automatic rebuilds.
serve:
    jekyll serve --livereload

# Verify that Jekyll renders the complete site.
check:
    jekyll build --strict_front_matter --trace
    test -f _site/index.html
    test -f _site/blog.html
