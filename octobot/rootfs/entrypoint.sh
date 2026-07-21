#!/bin/bash
set -e

OPTS=/data/options.json
enable_node_api() { python3 -c "import json;print(str(json.load(open('$OPTS')).get('enable_node_api',True)).lower())" 2>/dev/null || echo true; }

export ENABLE_NODE_API="$(enable_node_api)"
export AUTO_OPEN_IN_WEB_BROWSER=false

# OctoBot resolves its user/tentacles/backtesting/logs folders as plain relative
# paths against the process's current working directory (no env override exists
# for user/tentacles/backtesting). Relocating CWD to HA's persistent /data keeps
# them off the base image's inherited /octobot/{user,tentacles,logs,backtesting}
# VOLUMEs, so data survives add-on rebuilds/updates.
cd /data

# Tentacles are intentionally NOT persisted: wipe them on every start so OctoBot
# reinstalls a fresh default tentacles set each boot. user/logs/backtesting stay
# under /data and keep persisting.
rm -rf /data/tentacles

exec OctoBot "$@"
