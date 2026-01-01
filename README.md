# PyGenesis ⚛️

A robust, reproducible Python project skeleton using **Nix**, **UV**, and **Direnv**.

## 🚀 Features

*   **Reproducible Environment**: Nix guarantees `python` and `uv` versions.
*   **Fast Dependencies**: UV manages PyPI packages instantly.
*   **Automated Shell**: Direnv activates the environment automatically.
*   **FastAPI Ready**: Includes a "Hello World" app out of the box.

---

## ⚡ Quick Start (Try It Now!)

```bash
# 1. Clone the repository
git clone git@github.com:atomiksan/PyGenesis.git
cd PyGenesis

# 2. Enter the Nix environment (installs everything automatically)
nix develop

# 3. Run the server
start-server

# 4. Visit http://localhost:8000 → You should see:
#    {"message": "Hello my_project! Your PyGenesis skeleton is working!"}
```

---

## 🛠️ Create Your Own Project

1.  **Clone this template**:
    ```bash
    git clone git@github.com:atomiksan/PyGenesis.git my-awesome-app
    cd my-awesome-app
    ```

2.  **Run the initialization script**:
    ```bash
    ./init_project.sh my_awesome_app
    ```
    > **Note**: Use underscores for Python package names (e.g., `my_awesome_app` not `my-awesome-app`)

    This will:
    *   Rename the source package to `my_awesome_app`
    *   Update `pyproject.toml` with your project name
    *   Reset Git history for a fresh start
    *   Install all dependencies

3.  **Verify it works**:
    ```bash
    nix develop
    start-server
    # Visit http://localhost:8000 → Should show: "Hello my_awesome_app!"
    ```

---

## 💻 Development Workflow

### Enter Environment
```bash
direnv allow          # If using direnv (recommended)
# OR
nix develop           # Manual entry
```

### Run Dev Server
```bash
start-server          # Uses uvicorn with auto-reload
```

### Run Tests
```bash
pytest                # Runs all tests
```

### Add Dependencies
Edit `pyproject.toml`, then:
```bash
uv lock               # Update lockfile
uv sync --all-extras  # Install new dependencies
```

---

## 🏗️ Project Structure

```
.
├── flake.nix         # Nix environment definition
├── pyproject.toml    # Python dependencies & project config
├── src/
│   └── my_project/   # Your source code (renamed by init_project.sh)
│       ├── __init__.py
│       └── main.py   # FastAPI application
└── tests/            # Test files
```

---

## ❓ FAQ

**Why Nix + UV?**  
Nix gives us a rock-solid system foundation (glibc, openssl, python version). UV gives us instant, cached resolution of Python libraries. It's the best of both worlds for development speed.

**Why underscores in project names?**  
Python package names must be valid identifiers. Use `my_project` not `my-project`.
