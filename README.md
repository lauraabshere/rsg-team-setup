# RSG Team Setup — Claude Code + Basecamp

Get Claude Code fully set up and connected to all RSG tools in about 5 minutes.

## Prerequisites

1. **Claude Code** installed — download from [claude.ai/download](https://claude.ai/download)
2. **A Basecamp account** under Ready Set Grow (ask Laura to add you)
3. **A HubSpot account** under RSG (ask Laura to add you)

## Step 1 — Run the installer

Open Terminal and run:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lauraabshere/rsg-team-setup/main/setup.sh)
```

This will:
- Install the Basecamp CLI and log you in
- Configure Git (required for Claude Code)
- Connect the Basecamp plugin to Claude Code
- Set Ready Set Grow as your default account

## Step 2 — Connect your integrations

Open **Claude Code → Settings → Integrations** and connect:

| Integration | What it does |
|-------------|-------------|
| **Google Calendar** | Claude sees your schedule in every day plan |
| **Gmail** | Claude surfaces action emails and approvals |
| **HubSpot** | Claude shows your tasks, tickets, and pipeline |

## Step 3 — Install the Personal Assistant skill

In a new Claude Code session, run:

```bash
claude plugin install personal-assistant@lauraabshere
```

Then type **"set me up"** — Claude will automatically find your HubSpot owner ID and calendar IDs from your connected integrations and configure everything for you.

## Step 4 — Start your first sweep

Type **"start my day"** and you're live.

---

## What's included

| File | Purpose |
|------|---------|
| `setup.sh` | One-command installer for new machines |
| `.claude/settings.json` | Shared Claude Code config — Basecamp plugin + permission allowlist |

## Need help?

Reach out to Laura in Basecamp → Momentum Staff HQ.
