# adamancini/homebrew-tap

Personal Homebrew formulae.

```sh
brew tap adamancini/tap
brew install adamancini/tap/codebase-memory-mcp
```

| Formula | Upstream |
|---------|----------|
| `codebase-memory-mcp` | [DeusData/codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp) (prebuilt release binaries, pinned by sha256) |

## Updating a formula

1. Bump `version`, each `url` tag, and each `sha256` (from the release's `checksums.txt`).
2. `brew audit --strict --formula adamancini/tap/<name>`, then
   `brew reinstall adamancini/tap/<name> && brew test adamancini/tap/<name>`.
