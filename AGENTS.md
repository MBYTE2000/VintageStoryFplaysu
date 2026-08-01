# AGENTS.md

## Project
Nix flake packaging the [Vintage Story](https://www.vintagestory.at/) game for Linux. No application source code — only Nix derivations.

## Commands
- Build: `nix build .`
- Run client: `nix run .`
- Run server: `nix run .#server`
- Format: `nix fmt` (uses `nixfmt-rfc-style`)
- Dev shell: `nix develop`

## Style
- Follow [Nixpkgs conventions](https://nixos.org/manual/nixpkgs/unstable/#python-venv); use `rec` only when needed.
- Use RFC-style Nix formatting (handled by `nixfmt-rfc-style`).
- Attribute names use `snake_case`; string literals use double quotes.
- Keep `package.nix` attributes ordered: `pname`/`version`, `src`, `nativeBuildInputs`, `runtimeLibs`, `installPhase`, `preFixup`, `meta`.
- Set `meta` fields (`description`, `homepage`, `license`, `platforms`, `mainProgram`) on all packages.
- No tests or linters; validate by building (`nix build .`) and confirming the wrapper runs.
