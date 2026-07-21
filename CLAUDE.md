# OctoBot Home Assistant Add-on Repository

Home Assistant add-on repository wrapping the OctoBot Docker image. Two add-ons:

- `octobot/` — **stable**, tracks `drakkarsoftware/octobot:stable`.
- `octobot-latest/` — **DEV**, tracks `drakkarsoftware/octobot:latest`.

Each add-on is a thin wrapper: its `Dockerfile` is `FROM drakkarsoftware/octobot:<channel>` plus `rootfs/entrypoint.sh`. The add-on carries **no** OctoBot code — the base image provides core (`octobot_services`), and tentacles are re-downloaded from `tentacles.octobot.online` on every boot (`entrypoint.sh` wipes `/data/tentacles`).

## Releasing / triggering a rebuild

**Pushing a rebuild is version-driven, not content-driven.** CI only rebuilds an add-on when a *monitored* file under that add-on's directory changes.

### Monitored files (the rebuild trigger)

`.github/workflows/builder.yaml` defines:

```
MONITORED_FILES: "config.json config.yaml config.yml Dockerfile rootfs"
```

CI (`builder.yaml` → `build-app.yaml`) rebuilds add-on `X` **only if** a changed file matches `X/<monitored-file>`. Consequences:

- Editing a **monitored** file under `octobot/` or `octobot-latest/` (most simply, its `config.yaml`) → that add-on rebuilds.
- Editing the root `README.md`, `repository.yaml`, or anything **not** under an add-on dir → **no rebuild.** (Exception: changing `builder.yaml`/`build-app.yaml` itself rebuilds *all* add-ons.)

So a README-only or repository.yaml-only push publishes nothing. To ship a new image you must bump a version.

### How to bump the version (do this every release)

Bump **both** add-ons in lockstep so `octobot/` and `octobot-latest/` never drift:

1. `octobot/config.yaml` → bump `version:` (e.g. `"1.1.1"` → `"1.1.2"`).
2. `octobot-latest/config.yaml` → bump `version:` to the **same** value.
3. Commit both, push to `main`.

On push to `main`, CI builds each changed add-on for `aarch64` + `amd64`, tags the image with both the new `version` and `latest`, and publishes the multi-arch manifest to `ghcr.io/drakkar-software/addon-octobot{,-latest}`.

> Home Assistant Supervisor keys "update available" off the `version:` field. Without a bump, users' Supervisors won't offer the update even if the image is republished.

### Checklist

- [ ] Bumped `octobot/config.yaml` `version:`
- [ ] Bumped `octobot-latest/config.yaml` `version:` to the same value
- [ ] Both committed and pushed to `main`
- [ ] CI (`Builder` workflow) green; images published to GHCR

### Base-image skew — important

Rebuilding an add-on only re-pulls the **base image** (`drakkarsoftware/octobot:<channel>`) at build time. If the crash is a mismatch between the base image's core and the CDN tentacles (e.g. a tentacle referencing a `octobot_services` constant the base image predates), an add-on rebuild **only helps if the base `:stable`/`:latest` image already contains the fix.** Otherwise the base image must be rebuilt in the OctoBot repo first, then the add-on version bumped here.
