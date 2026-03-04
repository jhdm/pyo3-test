# PyO3 Test

## Quick Start

### Disable VSCode Auto Activate Virtual Environment

You will activate/deactive virtual environments
for builds, then should disable VSCode's auto
activating of virtual environment as follows.

**.vscode\settings.json:**

```json
{
  "python.terminal.activateEnvironment": false
}
```

**Create virtual environment for Python version:**

```sh
uv venv .py313 --python 3.13
```

Activate it below.

**Linux:**

```sh
source .py313/bin/activate
```

**Bash (Windows):**

```sh
source .py313/Scripts/activate
```

**PowerShell (Windows):**

```powershell
.py313\Scripts\activate.ps1
```

**Install dependencies including dev group:**

```sh
# Sync dependencies
uv sync --group  dev --active
```

The `--group dev` option also includes development group dependencies. The `--active` option uses the current active virtual environment. That prevents a warning that happens if there is a managed `.venv` virtual environment.

```
warning: `VIRTUAL_ENV=.py313` does not match the project environment path `.venv` and will be ignored; use `--active` to target the active environment instead
```

**Build for Development:**

```sh
just develop
```

That builds and installs the package in the virtual environment, but it does not create distributable .`whl` file under `target/wheels/` directory. With it, you can now import the package in Python.

**Try the Hello World example:**

```sh
just hello
```

It should print out `Hello, world!`. The `hello` task  imports `pyo3_test` module and calls function: `hello("world")`.

## Development Tasks

More detailed development tasks follows.

### Build for Release Distribution

```sh
uv run build
```

It will create `.whl` file under `target/wheels/` directory.

> Note: This does not install package in the virtual environment.

## Build with Specific glibc Version

The `--manylinux` option of `maturin` lets you specify glibc version.

**Example:**

```sh
just build-manylinux
```

Without that option, it auto detects and use the glibc version in the virtual environment, by default.

To build for Python 3.13:

VIRTUAL_ENV=py313 uv run --active maturin build
