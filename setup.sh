#!/bin/bash
# RSG Team Setup — Claude Code + Basecamp
# Run this once on a new machine: bash setup.sh

set -e

echo ""
echo "  Ready Set Grow — Claude Code Setup"
echo "  ===================================="
echo ""

# Step 1: Install Basecamp CLI
echo "→ Installing Basecamp CLI..."
curl -fsSL https://basecamp.com/install-cli | bash
source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null || true
echo "✓ Basecamp CLI installed"
echo ""

# Step 2: Git identity (required for Claude Code)
if [ -z "$(git config --global user.name)" ]; then
  read -p "  Your name (for Git): " git_name
  git config --global user.name "$git_name"
fi
if [ -z "$(git config --global user.email)" ]; then
  read -p "  Your work email: " git_email
  git config --global user.email "$git_email"
fi
echo "✓ Git configured"
echo ""

# Step 3: Authenticate with Basecamp
echo "→ Opening Basecamp login in your browser..."
basecamp auth login
echo ""

# Step 4: Install the Claude Code plugin
echo "→ Connecting Basecamp to Claude Code..."
CLAUDE=$(find ~/Library/Application\ Support/Claude/claude-code -name "claude" -type f 2>/dev/null | sort -V | tail -1)
if [ -n "$CLAUDE" ]; then
  git config --global url."https://github.com/".insteadOf "git@github.com:" 2>/dev/null || true
  "$CLAUDE" plugin marketplace add basecamp/claude-plugins 2>/dev/null || true
  "$CLAUDE" plugin install basecamp@37signals 2>/dev/null || true
  echo "✓ Claude Code plugin installed"
else
  echo "! Claude Code not found — install it first from claude.ai/download"
  echo "  Then run: basecamp setup claude"
fi
echo ""

# Step 5: Set default account (Ready Set Grow)
mkdir -p ~/.config/basecamp
cat > ~/.config/basecamp/config.json << 'EOF'
{
  "account_id": "5708130",
  "project_id": "35081390"
}
EOF
echo "✓ Default account set to Ready Set Grow / Momentum Staff HQ"
echo ""

echo "  All done! Start a new Claude Code session to use Basecamp."
echo ""
