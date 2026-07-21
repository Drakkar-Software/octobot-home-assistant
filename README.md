# 🐙 OctoBot — Home Assistant Add-on Repository

Run [**OctoBot**](https://github.com/Drakkar-Software/OctoBot), the free and
open-source cryptocurrency trading bot, directly inside Home Assistant — no
separate server, no Docker commands, no terminal. Install it like any other
add-on and manage your strategies from a web interface right next to your smart
home.

[![Open your Home Assistant instance and show the add-on store with this repository pre-filled.](https://my.home-assistant.io/badges/supervisor_store.svg)](https://my.home-assistant.io/redirect/supervisor_store/?repository_url=https%3A%2F%2Fgithub.com%2Fdrakkar-software%2Foctobot-home-assistant)

---

## Why OctoBot on Home Assistant?

- **Automated trading, 24/7** — OctoBot runs your strategies around the clock on
  your own hardware. Your keys and your data never leave your machine.
- **One-click install** — add the repository, pick a channel, hit install. The
  Supervisor handles the rest.
- **Runs where your home runs** — on the same Raspberry Pi, NUC, or server as
  Home Assistant. Supports `aarch64` and `amd64`.
- **Modern Node web interface** — configure exchanges, strategies, and
  monitoring from a clean UI, reachable straight from the add-on's **Open Web UI**
  button.
- **Survives updates and reboots** — your configuration, logs, and backtesting
  data are persisted under Home Assistant's `/data`, so add-on rebuilds and
  updates keep your setup intact.

## Features

- 📈 Automated crypto trading on many major exchanges
- 🧩 Extensible via OctoBot's tentacles (strategies, evaluators, trading modes)
- 🔒 Self-hosted — API keys stay on your device
- 🖥️ Built-in Node web interface (port `8000`, path `/app`)
- 💾 Persistent user config, logs, and backtesting data
- 🏗️ Multi-architecture images (`aarch64`, `amd64`)

## Add-ons in this repository

### [OctoBot](./octobot) — stable

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]

Tracks the `stable` OctoBot Docker image channel. Recommended for everyday use —
tested releases, fewer surprises.

### [OctoBot DEV](./octobot-latest) — bleeding edge

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]

Tracks the `latest` OctoBot Docker image channel. Newest features and fixes,
straight from active development. Expect rougher edges — best for testing and
early adopters.

## Installation

1. **Add this repository** to Home Assistant — click the button above, or go to
   **Settings → Add-ons → Add-on Store → ⋮ → Repositories** and paste:
   ```
   https://github.com/drakkar-software/octobot-home-assistant
   ```
2. **Install** the **OctoBot** (stable) or **OctoBot DEV** add-on from the store.
3. **Start** the add-on.
4. Click **Open Web UI** (or browse to `http://<your-ha-host>:8000/app`) to reach
   the OctoBot Node interface and finish setup.

## Configuration

| Option            | Default | Description                                             |
| ----------------- | ------- | ------------------------------------------------------- |
| `enable_node_api` | `true`  | Enable the Node web interface / API served on port 8000 |

The web interface is exposed on port **8000** at path **`/app`**.

## Data & persistence

The add-on runs OctoBot with its working directory on Home Assistant's
persistent `/data`, so your **user configuration, logs, and backtesting data
survive rebuilds and updates**.

Tentacles are intentionally **not** persisted — they are wiped and reinstalled
fresh on every start, so each boot pulls a clean default tentacles set matching
the running OctoBot version.

## Links

- 🐙 [OctoBot project](https://github.com/Drakkar-Software/OctoBot)
- 📚 [OctoBot documentation](https://www.octobot.cloud/en/guides)
- 💬 [OctoBot community](https://www.octobot.cloud/en/discord)

<!-- shields -->
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
