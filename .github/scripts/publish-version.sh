#!/usr/bin/env bash
#
# Copy a built Jupyter Book into <SLUG>/ on the gh-pages branch of REMOTE,
# leaving every other version directory untouched, and regenerate the root
# version index.
#
# Env:
#   SLUG        subpath to publish into, e.g. "main" or "v1.0.0"   (required)
#   BUILD_DIR   directory holding the built HTML                   (required)
#   REMOTE      git URL to push to; a local path works for testing (required)
#   SOURCE_REF  short ref/sha used in the commit message           (optional)
#   DRY_RUN     if "1", do everything except the final push        (optional)
#
set -euo pipefail

: "${SLUG:?SLUG is required}"
: "${BUILD_DIR:?BUILD_DIR is required}"
: "${REMOTE:?REMOTE is required}"
SOURCE_REF="${SOURCE_REF:-unknown}"
DRY_RUN="${DRY_RUN:-0}"

if [ ! -d "$BUILD_DIR" ]; then
  echo "BUILD_DIR '$BUILD_DIR' does not exist" >&2
  exit 1
fi

# Reject slugs that would escape the site root or collide with git's own dir.
case "$SLUG" in
  ""|.|..|.git|*/*|*..*)
    echo "Refusing unsafe SLUG '$SLUG'" >&2
    exit 1
    ;;
esac

site="$(mktemp -d)"
trap 'rm -rf "$site"' EXIT

# Check out gh-pages, or start it as an empty orphan branch.
if git clone --depth 1 --branch gh-pages "$REMOTE" "$site" 2>/dev/null; then
  echo "Cloned existing gh-pages branch."
else
  echo "No gh-pages branch yet, creating one."
  rm -rf "$site"
  git clone --depth 1 "$REMOTE" "$site"
  git -C "$site" checkout --orphan gh-pages
  git -C "$site" rm -rf --quiet --ignore-unmatch . >/dev/null 2>&1 || true
  # An orphan checkout leaves the old worktree on disk; clear it.
  find "$site" -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +
fi

git -C "$site" config user.name "github-actions[bot]"
git -C "$site" config user.email "41898282+github-actions[bot]@users.noreply.github.com"

# Replace only this version's directory.
rm -rf "${site:?}/${SLUG:?}"
mkdir -p "$site/$SLUG"
cp -a "$BUILD_DIR/." "$site/$SLUG/"

# Sphinx output contains _static/, _sources/ ... which Jekyll would drop.
touch "$site/.nojekyll"

# Root landing page listing whatever versions now exist.
{
  echo '<!doctype html>'
  echo '<html lang="en"><head><meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width, initial-scale=1">'
  echo '<title>CDA Partner Guide OpenSearch</title>'
  echo '<style>body{font-family:system-ui,sans-serif;max-width:40rem;margin:4rem auto;padding:0 1rem;line-height:1.6}</style>'
  echo '</head><body>'
  echo '<h1>CDA Partner Guide OpenSearch</h1>'
  echo '<p>Published versions:</p><ul>'
  for dir in "$site"/*/; do
    name="$(basename "$dir")"
    printf '<li><a href="%s/">%s</a></li>\n' "$name" "$name"
  done
  echo '</ul></body></html>'
} > "$site/index.html"

git -C "$site" add -A
if git -C "$site" diff --cached --quiet; then
  echo "Nothing changed, skipping push."
  exit 0
fi
git -C "$site" commit --quiet -m "Publish $SLUG from $SOURCE_REF"

if [ "$DRY_RUN" = "1" ]; then
  echo "DRY_RUN=1, not pushing. Resulting tree:"
  git -C "$site" ls-tree -r --name-only HEAD | sed 's/^/  /'
  exit 0
fi

git -C "$site" push origin gh-pages
