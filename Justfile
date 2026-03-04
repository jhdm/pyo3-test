# Build package and install in current virtual environment
_develop:
    maturin develop

# Build package for release, with glibc version in current virtual environment
_build:
    maturin build --release

# Build with specific glibc version 2.34
_build-manylinux:
    maturin build --release --manylinux 2_34

# Run the hello example
_hello name:
    python -c "from pyo3_test import hello; print(hello('{{ name }}'))"

# Example: just build 312
build version:
    VIRTUAL_ENV=py{{ version }} uv run --active just _build-manylinux

# Example: just hello 312
hello version:
    VIRTUAL_ENV=py{{ version }} uv run --active just _hello py{{ version }}
