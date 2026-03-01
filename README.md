# PyO3 Test

## Development Commands

### Quick Start Commands

```sh
# Install dependencies
pixi install

# Build for Development
pixi run develop

# Try the Hello World example
pixi run hello
```

The `hello` task makes Python `hello("world")` function call. It should print out `Hello, world!`.

More details follow.

### Install Dependencies

```sh
pixi install
```

With specific virtual environment:

```sh
pixi install -e py314
```

Substitute `py314` with the actual virtual environment.

### Build for Development

```sh
pixi run develop
```

With specific virtual environment:

```sh
pixi run -e py314 develop
```

That builds and installs the package in the virtual environment.

### Build for Release Distribution

```sh
pixi run build
```

With specific virtual environment:

```sh
pixi run -e py314 build
```

This does not install package in the virtual environment.

## Maturin --manylinux Option

The `--manylinux` option of `maturin` lets you specify glibc version.

**Example:**

```sh
maturin build --release --manylinux 2_34
```

The `2_34` specifies `glibc` `2.34`.
