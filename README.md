# roblox-dev

A template repository for Roblox game development using Rojo, with tooling managed by Aftman and AI-assisted workflows via Claude Code.

## Using this template

This is a GitHub template repository. To start a new project from it:

1. Click **"Use this template"** → **"Create a new repository"**
2. Name your repo, set visibility, and create it
3. Clone your new repo and open it in VSCode
4. Follow the setup guide below

## What's included

```
aftman.toml          — pinned versions of rojo, selene, stylua
default.project.json — Rojo project config (src/ → Studio services)
selene.toml          — Luau linter config (std = "roblox")
stylua.toml          — Luau formatter config
.gitignore           — ignores build output and sourcemaps
src/
  server/            → ServerScriptService
  client/            → StarterPlayerScripts
  shared/            → ReplicatedStorage
```

Starter scripts in `src/` demonstrate the module pattern across server, client, and shared.

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

All tools are managed by [Aftman](https://github.com/LPGhatguy/aftman) and pinned in `aftman.toml`. Run `aftman install` after cloning to install them.
