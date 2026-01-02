set shell := ["bash", "-c"]

# Show all available recipes
default:
    @just --list

# Initialize the project (run once after cloning)
setup name="my_app":
    ./init_project.sh {{name}}

# Run the development server
dev:
    uv run uvicorn src.$(grep 'name =' pyproject.toml | head -n1 | cut -d'"' -f2 | tr '-' '_').main:app --reload

# Run tests
test:
    uv run pytest

# Check code style
lint:
    uv run ruff check .
    uv run black --check .

# Auto-format code
format:
    uv run ruff check --fix .
    uv run black .

# Clean up artifacts
clean:
    rm -rf .venv uv.lock .pytest_cache .ruff_cache __pycache__
    find . -type d -name "__pycache__" -exec rm -rf {} +
