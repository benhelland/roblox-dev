# Roblox Dev Environment Setup

Prerequisites: VSCode and Roblox Studio already installed. You have already cloned this repo and opened it in VSCode.

---

## 1. Name your project

Open `default.project.json` and change `"name": "Game"` to your actual project name. This is what the place will be called in Roblox Studio.

---

## 2. Install Aftman

Aftman is a toolchain version manager — it installs and pins CLI tools like Rojo, Selene, and StyLua per-project. Think of it like `nvm` but for Roblox dev tools.

1. Download the latest `aftman.exe` from the [Aftman releases page](https://github.com/LPGhatguy/aftman/releases)
2. Run it — it will self-install to `~/.aftman/bin/` and add itself to your PATH
3. **Fully quit and reopen VSCode** so the new PATH takes effect
4. Verify: `aftman --version`

---

## 3. Install project tools

In the VSCode integrated terminal at the project root:

```bash
aftman install
```

This reads `aftman.toml` and downloads Rojo, Selene, and StyLua. Verify with:

```bash
rojo --version
selene --version
stylua --version
```

---

## 4. Install Wally (optional)

Wally is the package manager for Luau libraries — it installs community packages (like Promise, Signal, Knit) into your game as runtime code. It's separate from Aftman: Aftman manages your dev tools, Wally manages your game's dependencies.

To add Wally, first add it to `aftman.toml`:

```toml
wally = "UpliftGames/wally@0.3.2"
```

Then re-run `aftman install` to download it. To install packages, add them to `wally.toml` and run:

```bash
wally install
```

Packages are written to `Packages/` (gitignored). Rojo syncs them into your game automatically.

Also update the `[package]` name in `wally.toml` to match your project (e.g. `"your-name/game-name"`).

Skip this step if you don't need external packages.

---

## 5. Install the VSCode Rojo extension

```bash
code --install-extension evaera.vscode-rojo
```

Reload VSCode when prompted (`Ctrl+Shift+P` → "Developer: Reload Window").

---

## 6. Install the Rojo Studio plugin

In a terminal at the project root (with `rojo` on PATH):

```bash
rojo plugin install
```

Then **restart Roblox Studio**. Open any place — the Rojo plugin will appear in the **Plugins** tab.

---

## 7. Enable HTTP Requests in your place

This is required by the MCP plugin to communicate with Studio. Rojo does not need it.

1. Open your place in Studio
2. **Home** tab → **Game Settings** → **Security**
3. Toggle **Allow HTTP Requests** ON → Save

---

## 8. Install the MCP Studio plugin

1. Download the latest `.rbxmx` from the [boshyxd/robloxstudio-mcp releases page](https://github.com/boshyxd/robloxstudio-mcp/releases)
2. In Studio: **Plugins** tab → **Plugins Folder** (opens the folder in Explorer)
3. Copy the `.rbxmx` file into that folder
4. Restart Studio — the MCP plugin appears in the Plugins tab

---

## 9. Install Claude Code CLI

```bash
npm install -g @anthropic-ai/claude-code
```

Verify: `claude --version`

---

## 10. Register the MCP server with Claude Code

```bash
claude mcp add robloxstudio -- npx -y robloxstudio-mcp@latest
```

This registers the boshyxd MCP server globally so Claude Code can talk to Studio.

---

## 11. Install the Claude Code skills

Clone the skills repo and copy the skill folders into your Claude skills directory:

```bash
git clone https://github.com/benhelland/roblox-claude-skills
```

Then copy each skill folder into `~/.claude/skills/`:

```
~/.claude/skills/
  rojo-sync/SKILL.md
  luau-lint/SKILL.md
  roblox-api/SKILL.md
  script-scaffold/SKILL.md
  world-builder/SKILL.md
  studio-debug/SKILL.md
```

On Windows, `~/.claude/` is at `C:\Users\<you>\.claude\`.

---

## 12. Test the full setup

1. In VSCode terminal: `rojo serve` (leave running)
2. In Studio: open a place with HTTP Requests enabled
3. **Plugins tab** → click **Rojo** → Connect
4. **Plugins tab** → click **MCP plugin** → Start
5. Open Claude Code in VSCode (`Ctrl+Shift+P` → "Claude Code") and ask: *"What place is open in Studio?"*

Claude should respond with your place name — confirming the MCP connection works end to end.

---

## Available Claude skills

| Skill | Trigger | What it does |
|---|---|---|
| `/rojo-sync` | "start rojo", "serve the project" | Starts/stops Rojo dev server, builds place files |
| `/luau-lint` | "lint this", "format the code" | Runs selene + stylua, fixes warnings |
| `/roblox-api` | "how do I use X service" | Looks up Roblox API docs without hallucinating |
| `/script-scaffold` | "create a new script for X" | Generates Luau files with correct Rojo naming |
| `/world-builder` | "spawn a part", "build a floor grid" | Creates and manipulates 3D objects in Studio via MCP |
| `/studio-debug` | "run this code", "check the output log" | Executes Luau and inspects runtime state via MCP |
