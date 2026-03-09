# devShell guide — nix-direnv

## How it works

`direnv` watches the current directory. When you `cd` into a project that has an `.envrc` file,
it automatically loads the Nix devShell defined in `flake.nix` — putting compilers, LSPs, and
tools into your `PATH`. When you leave the directory they disappear.

`nix-direnv` caches the shell so subsequent `cd`s are instant (no rebuild unless `flake.nix` changes).

---

## First-time setup for a project

### Option A — copy a template from this repo

```sh
# e.g. new Rust project
mkdir ~/projects/myapp && cd ~/projects/myapp
cp -r ~/nixos-config/devshells/rust/. .
git init
direnv allow          # trust this directory
```

That's it. On next `cd` the shell loads automatically.

### Option B — start from scratch in an existing project

```sh
cd ~/projects/myapp

# Write a flake.nix (copy from devshells/ or write your own)
# Then:
echo "use flake" > .envrc
direnv allow
```

---

## Directory layout of each template

```
devshells/
├── python/
│   ├── flake.nix    ← devShell definition
│   └── .envrc       ← tells direnv to load the flake (contains: use flake)
├── rust/
│   ├── flake.nix
│   └── .envrc
├── c/
│   ├── flake.nix
│   └── .envrc
├── go/
│   ├── flake.nix
│   └── .envrc
└── node/
    ├── flake.nix
    └── .envrc
```

---

## What each shell provides

| Shell  | Key tools                                                    |
|--------|--------------------------------------------------------------|
| Python | python3.13, uv, ipython, ruff, pyright                       |
| Rust   | stable rustc/cargo, rust-analyzer, clippy, cargo-watch, openssl |
| C/C++  | gcc, clang, clang-tools (clangd), cmake, ninja, gdb, valgrind |
| Go     | go, gopls, golangci-lint, delve, air                         |
| Node   | nodejs 22, pnpm, typescript, ts-language-server, prettier, eslint_d |

---

## Daily commands

```sh
# First time in a new project directory — trust the .envrc once
direnv allow

# Reload after changing flake.nix
direnv reload

# Temporarily leave the shell without cd-ing out
direnv deny

# Re-enable after deny
direnv allow

# Manually enter the shell without direnv
nix develop

# Enter a specific shell from anywhere
nix develop ~/nixos-config/devshells/rust
```

---

## Switching toolchain versions (Rust example)

In `devshells/rust/flake.nix`, change one line:

```nix
# stable latest:
rust = pkgs.rust-bin.stable.latest.default.override { ... };

# specific version:
rust = pkgs.rust-bin.stable."1.78.0".default.override { ... };

# nightly:
rust = pkgs.rust-bin.nightly.latest.default.override { ... };
```

Then `direnv reload` in the project directory.

---

## Switching Python version

In `devshells/python/flake.nix`:

```nix
# Change python313 to python312 or python311
packages = with pkgs; [
  python312
  python312Packages.pip
  ...
];
```

---

## Adding packages to an existing shell

Just add to the `packages` list in `flake.nix`:

```nix
packages = with pkgs; [
  go
  gopls
  sqlite   # new package
  litecli  # new package
];
```

Save the file — direnv reloads automatically.

---

## Committing devShell to a project

Copy the template into the project root so teammates get the same environment:

```sh
cd ~/projects/myapp
cp ~/nixos-config/devshells/rust/flake.nix .
echo "use flake" > .envrc
echo ".direnv" >> .gitignore   # don't commit the cache
git add flake.nix flake.lock .envrc .gitignore
```

Anyone who clones the repo and has direnv + nix installed gets the same shell automatically.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Shell not loading on `cd` | Run `direnv allow` in the directory |
| `error: flake.nix not found` | Make sure `flake.nix` exists in the current directory |
| Slow first load | Normal — nix is building/downloading. Next `cd` is instant (nix-direnv cache) |
| `use flake` not recognised | Make sure `nix-direnv.enable = true` is set and you've rebuilt |
| Cache stale after `flake.nix` change | `direnv reload` |
