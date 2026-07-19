# Home Assistant Add-on: OctoBot

## How to use

This add-on runs [OctoBot](https://github.com/Drakkar-Software/OctoBot), an
open-source cryptocurrency trading bot, from the official
`drakkarsoftware/octobot:stable` Docker image.

Click **OPEN WEB UI** (or go to `http://<host>:8000/app`) to reach the OctoBot
Node web interface. The web interface is served without a login by default;
configure exchanges, strategies and password protection from within OctoBot
itself once it's running.

> The Node web interface is being rolled out as OctoBot's default UI. If
> `/app` returns a 404 on your installed OctoBot version, the node web bundle
> isn't baked into that build yet — uncomment the `5001/tcp` port in this
> add-on's config and point the web UI button at
> `http://<host>:5001` (the classic dashboard) as a fallback.

## Configuration

### Option: `enable_node_api`

Enables OctoBot's Node API/web interface service on port 8000. Leave this on
unless you only need the classic dashboard on 5001.

## Data persistence

OctoBot's user config, installed tentacles, logs and backtesting data are all
stored under this add-on's persistent `/data` folder, so they survive add-on
updates and rebuilds.

## Want the bleeding edge instead?

Install the **OctoBot DEV** add-on instead, which tracks
`drakkarsoftware/octobot:latest`.
