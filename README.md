# PyGenesis ⚛️

A robust, reproducible Python project skeleton using **Nix**, **UV**, and **Direnv**.

## 🚀 Features

*   **Reproducible Environment**: Nix guarantees `python` and `uv` versions.
*   **Fast Dependencies**: UV manages PyPI packages instantly.
*   **Automated Shell**: Direnv activates the environment automatically.
*   **FastAPI Ready**: Includes a "Hello World" app out of the box.

## 🛠️ Usage (Create New Project)

1.  **Clone this template** (or copy these files to a new folder).
2.  **Run the Initialization Script**:
    ```bash
    ./init_project.sh my-new-cool-app
    ```
    This will:
    *   Rename the source package to `my-new-cool-app`.
    *   Update `pyproject.toml`.
    *   Reset Git history.
    *   Install a fresh environment.

## 💻 Development Workflow

1.  **Enter Environment**:
    ```bash
    direnv allow
    ```
    (Or `nix develop` if you don't use direnv).

2.  **Run Dev Server**:
    ```bash
    start-server
    ```
    (Or `uv run uvicorn src.my_project.main:app --reload`).

3.  **Run Tests**:
    ```bash
    pytest
    ```

4.  **Add Dependencies**:
    Edit `pyproject.toml`, then update the lockfile:
    ```bash
    uv pip compile pyproject.toml -o uv.lock
    uv sync
    ```

## 🏗️ Structure

*   `flake.nix`: The Nix environment definition.
*   `pyproject.toml`: Python dependency definition.
*   `src/`: Your source code.
*   `tests/`: Tests.

## ❓ FAQ

**Why Nix + UV?**
Nix gives us a rock-solid system foundation (glibc, openssl, python version). UV gives us instant, cached resolution of Python libraries. It's the best of both worlds for development speed.
