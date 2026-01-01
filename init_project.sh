#!/bin/bash
set -e

# Init Project Helper
# Usage: ./init_project.sh new_project_name

if [ -z "$1" ]; then
    echo "Usage: ./init_project.sh <new_project_name>"
    exit 1
fi

NEW_NAME="$1"
OLD_NAME="my_project"
OLD_NAME_DASH="my-backend-project"

echo "🚀 Initializing new project: $NEW_NAME"

# 1. Rename Source Directory
if [ -d "src/$OLD_NAME" ]; then
    mv "src/$OLD_NAME" "src/$NEW_NAME"
    echo "✅ Renamed src directory to src/$NEW_NAME"
fi

# 2. Update pyproject.toml
sed -i "s/name = \"$OLD_NAME_DASH\"/name = \"$NEW_NAME\"/" pyproject.toml
sed -i "s/packages = \[\"src\/$OLD_NAME\"\]/packages = \[\"src\/$NEW_NAME\"\]/" pyproject.toml
# Update the entry point (start-server) to point to the new module name
sed -i "s/\"$OLD_NAME.main:main\"/\"$NEW_NAME.main:main\"/" pyproject.toml
echo "✅ Updated pyproject.toml"

# 3. Update tests
sed -i "s/import $OLD_NAME/import $NEW_NAME/" tests/test_basic.py
sed -i "s/assert $OLD_NAME/assert $NEW_NAME/" tests/test_basic.py
echo "✅ Updated tests"

# 4. Update Import in main.py (if it self-references, though our code uses relative or direct string)
sed -i "s/\"$OLD_NAME.main:app\"/\"$NEW_NAME.main:app\"/" "src/$NEW_NAME/main.py"
echo "✅ Updated main.py entry point string"

# 5. Clean up old locks and venv to ensure fresh start
rm -rf .venv uv.lock
echo "🗑️  Cleaned up old environment"

# 6. Re-generate lock and install
echo "📦 Generating new uv.lock..."
nix develop --command uv pip compile pyproject.toml -o uv.lock
echo "📦 Installing dependencies..."
nix develop --command uv pip install -e .[dev]

# 7. Reset Git
rm -rf .git
git init
git add .
git commit -m "Initial commit for $NEW_NAME"
echo "git init"

echo "🎉 Project $NEW_NAME is ready!"
echo "👉 Run 'nix develop' or 'direnv allow' to enter."
echo "👉 Run 'start-server' to launch the app."
