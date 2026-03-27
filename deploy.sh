#!/bin/bash
# ABOUTME: Builds the Quartz note garden and deploys the output to the gh-pages branch.
# ABOUTME: Run this from the repo root whenever you want to publish new or updated notes.

set -e

echo "Building garden..."
npx quartz build

echo "Deploying to gh-pages..."
# Use a temporary directory to stage the built output cleanly
DEPLOY_DIR=$(mktemp -d)
cp -r public/. "$DEPLOY_DIR"

# Push the built output to the gh-pages branch
cd "$DEPLOY_DIR"
git init
git checkout -b gh-pages
git add .
git commit -m "deploy: $(date '+%Y-%m-%d %H:%M')"
git remote add origin git@github.com:tux234/men-without-a-map-garden.git
git push --force origin gh-pages

cd -
rm -rf "$DEPLOY_DIR"

echo "Done. Garden live at https://tux234.github.io/men-without-a-map-garden"
