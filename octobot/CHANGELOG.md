<!-- https://developers.home-assistant.io/docs/apps/presentation#keeping-a-changelog -->
## 1.1.0

- Tentacles are no longer persisted: they are wiped on every start so OctoBot
  reinstalls a fresh default tentacles set each boot. User config, logs and
  backtesting data still persist under `/data`.

## 1.0.0

- Initial release: wraps `drakkarsoftware/octobot:stable`, exposes the Node
  web interface on port 8000 with a web UI button, persists OctoBot data
  under `/data`.
