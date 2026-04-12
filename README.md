# roblox-dev

A template repository for Roblox game development using Rojo, with tooling managed by Aftman and AI-assisted workflows via Claude Code.

## Using this template

This is a GitHub template repository. To start a new project from it:

1. Click **"Use this template"** → **"Create a new repository"**
2. Name your repo, set visibility, and create it
3. Clone your new repo and open it in VSCode
4. Rename `"Game"` in `default.project.json` to your project name
5. Follow the setup guide below

## What's included

```
aftman.toml          — pinned versions of rojo, selene, stylua
default.project.json — Rojo project config (src/ → Studio services)
wally.toml           — package manager config (add dependencies here)
selene.toml          — Luau linter config (std = "roblox")
stylua.toml          — Luau formatter config
.gitignore           — ignores build output, sourcemaps, and Wally packages
src/
  server/            → ServerScriptService
  player/            → StarterPlayerScripts
  character/         → StarterCharacterScripts
  gui/               → StarterGui
  replicatedStorage/ → ReplicatedStorage
  workspace/         → Workspace
```

Starter scripts in `src/` demonstrate the module pattern across server, client, and shared.

## Daily workflow

Each session, do this in order:

**1. Start Rojo** (VSCode terminal):
```bash
rojo serve
```
Leave this running. It watches `src/` and syncs changes into Studio in real time.

**2. Start the MCP plugin** (Roblox Studio):
1. Open your place in Studio
2. **Plugins** tab → click **MCP** → click **Start**
3. The button label changes to **Stop** when the server is running

Claude Code can now read and write to your live Studio session via the MCP connection.

**3. Connect Rojo** (Roblox Studio):
1. **Plugins** tab → click **Rojo** → **Connect**

Files are now synced. Any save in VSCode updates the place instantly.

---

## Building

To build a place file from the current source:

```bash
rojo build default.project.json --output build/game.rbxl
```

Output is written to `build/` (gitignored). Rename `"Game"` in `default.project.json` to match your project before building.

## Setup

See [SETUP.md](SETUP.md) for the full environment setup guide, including:

- Installing Aftman and project tools
- Setting up the VSCode Rojo extension and Studio plugin
- Installing the Claude Code MCP plugin for AI-assisted development
- Installing the Claude Code skills for this workflow

## Tools

| Tool | Version | Purpose |
|---|---|---|
| [Rojo](https://rojo.space) | 7.4.4 | Sync files between VSCode and Roblox Studio |
| [Selene](https://kampfkarren.github.io/selene) | 0.27.1 | Luau linter |
| [StyLua](https://github.com/JohnnyMorganz/StyLua) | 0.20.0 | Luau formatter |
| [Wally](https://wally.run) | optional | Luau package manager for runtime dependencies |

**Aftman** manages dev tools (Rojo, Selene, StyLua) — CLI binaries pinned per-project in `aftman.toml`. Run `aftman install` after cloning.

**Wally** manages game dependencies (Promise, Signal, etc.) — Luau packages that end up inside your game. Add it to `aftman.toml` if you need it, then declare packages in `wally.toml` and run `wally install`. See [SETUP.md](SETUP.md) for details.
