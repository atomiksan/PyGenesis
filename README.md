# PyGenesis ⚛️

A robust, reproducible Python project skeleton using **Nix**, **UV**, and **Direnv**.

## 🚀 Instant Start

Follow these exact steps to create and run your new project.

### 1. Create New Project
Clone this skeleton and run the setup script. Replace `my_app` with your desired project name (use underscores).

```bash
# Clone the repository
git clone git@github.com:atomiksan/PyGenesis.git my_app
cd my_app

# Run initialization (renames project, installs dependencies)
./init_project.sh my_app
```

### 2. Enter Environment
Activate the Nix environment. This guarantees you have the correct Python and tools.

```bash
nix develop
```
*(Note: If you use `direnv`, just run `direnv allow`)*

### 3. Run Server
Start the development server.

```bash
start-server
```

You should see:
```
INFO:     Uvicorn running on http://0.0.0.0:8000
```

### 4. Verify
Open http://localhost:8000 in your browser.
You'll see: `{"message": "Hello my_app! Your PyGenesis skeleton is working!"}`

### 5. Stop Server
To stop the server, press **`Ctrl + C`** in your terminal.

---

## 💻 Daily Workflow

**Start Developing**:
```bash
just dev          # Run app with reload
```


**Run Tests**:
```bash
just test
```

**Format & Lint**:
```bash
just format       # Auto-format code
just lint         # Check code style
```


**Add New Dependency**:
```bash
# 1. Add package name to pyproject.toml
# 2. Run:
uv lock
uv sync --all-extras
```

---

## 🛠️ Developer Tools

### ⚡ Justfile (Task Runner)
We use `just` to simplify common commands. Run `just --list` to see all available tasks.
- `just dev`: Runs the dev server.
- `just test`: Runs pytest.
- `just lint`: Runs ruff and black checks.
- `just format`: Auto-formats code with ruff and black.
- `just clean`: Cleans up artifacts.

### 🐳 Docker Support
A production-ready `Dockerfile` is included.
```bash
docker build -t my_app .
docker run -p 8000:8000 my_app
```

### ✅ Git Hooks (Pre-commit)
Pre-commit hooks are configured to ensure code quality.
```bash
nix develop --command pre-commit install
```
This will run linting and formatting on every commit.

---

## 🏗️ Project Structure
```
.
├── flake.nix         # System environment (Python + Tools)
├── pyproject.toml    # Python dependencies
├── src/
│   └── my_app/       # Your source code (renamed)
│       ├── __init__.py
│       └── main.py   # FastAPI app
└── tests/            # Tests
```
