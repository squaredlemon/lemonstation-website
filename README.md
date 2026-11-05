# Lemon Station website

This repository contains the Lemon Station marketing site. Cloudflare Pages builds the static site at `/` and copies the current `app` branch of [Lemon-Station](https://github.com/squaredlemon/Lemon-Station) into `/test/`.

## Cloudflare Pages setup

Create a Pages project connected to this repository with:

- **Production branch:** `main`
- **Build command:** `sh scripts/build-site.sh`
- **Build output directory:** `dist`
- **Root directory:** `/`

The app repository is public, so the build can fetch its `app` branch without credentials. Add `lemonstation.com` to this Pages project's **Custom domains** after the first successful deployment. This project needs to own both routes because the app is published under the same hostname at `/test/`.

The website repo and app repo are separate. A push to the app repo alone does not trigger a Pages build here; after app changes land on the `app` branch, trigger a new deployment of this Pages project to pick them up.

## Local preview

Run `sh scripts/build-site.sh`, then serve `dist/` with any static HTTP server. The build downloads the latest public `app` branch, so it requires Git and an internet connection.

The app ZIP in `downloads/` is the project source, not a one-click desktop installer. The native desktop app currently targets macOS; the hosted web app is browser-based.
