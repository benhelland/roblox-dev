# Roblox Dev Environment Setup

Prerequisites: VSCode and Roblox Studio already installed.

---

## 1. Install Aftman

Aftman is a toolchain version manager that installs and pins tools like Rojo, Selene, and StyLua per-project.

1. Download the latest `aftman.exe` from the [Aftman releases page](https://github.com/LPGhatguy/aftman/releases)
2. Run it — it will self-install to `~/.aftman/bin/` and add itself to your PATH
3. **Fully quit and reopen VSCode** so the new PATH takes effect
4. Verify: `aftman --version`

---

## 2. Install project tools

Clone or open the `roblox-dev` project in VSCode, then in the integrated terminal:

```bash
cd path/to/roblox-dev
aftman install
```

This reads `aftman.toml` and downloads Rojo, Selene, and StyLua. Verify with:

```bash
rojo --version
selene --version
stylua --version
```

---

## 3. Install the VSCode Rojo extension

```bash
code --install-extension evaera.vscode-rojo
```

Reload VSCode when prompted (`Ctrl+Shift+P` → "Developer: Reload Window").

---

## 4. Install the Rojo Studio plugin

In a terminal at the project root (with `rojo` on PATH):

```bash
rojo plugin install
```

Then **restart Roblox Studio**. Open any place — the Rojo plugin will appear in the **Plugins** tab.

---

## 5. Enable HTTP Requests in your place

This is required per place for both Rojo and the MCP plugin to communicate with Studio.

1. Open your place in Studio
2. **Home** tab → **Game Settings** → **Security**
3. Toggle **Allow HTTP Requests** ON → Save

---

## 6. Install the MCP Studio plugin

1. Download the latest `.rbxmx` from the [boshyxd/robloxstudio-mcp releases page](https://github.com/boshyxd/robloxstudio-mcp/releases)
2. In Studio: **Plugins** tab → **Plugins Folder** (opens the folder in Explorer)
3. Copy the `.rbxmx` file into that folder
4. Restart Studio — the MCP plugin appears in the Plugins tab

---

## 7. Install Claude Code CLI

```bash
npm install -g @anthropic-ai/claude-code
```

Verify: `claude --version`

---

## 8. Register the MCP server with Claude Code

```bash
claude mcp add robloxstudio -- npx -y robloxstudio-mcp@latest
```

This registers the boshyxd MCP server globally so Claude Code can talk to Studio.

---

## 9. Install the Claude Code skills

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

## 10. Test the full setup

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
