# Jon Zhang — Portfolio

A responsive personal portfolio for Jon Zhang, a GenAI and full-stack engineer.

**Live site:** [jon-zhang-portfolio-2026.perkyaisle4.chatgpt.site](https://jon-zhang-portfolio-2026.perkyaisle4.chatgpt.site)

## Architecture

![Hand-drawn architecture diagram showing the browser, static portfolio, profile links, hosting, and source repository](docs/architecture.svg)

The portfolio is a dependency-free static site. Its JavaScript powers the time-of-day theme and small interactions, while the same committed source is published to ChatGPT Sites and mirrored to GitHub.

## Features

- Time-of-day sky theme with an interactive hour selector
- Selected projects and resume-backed experience
- Direct links to GitHub, LinkedIn, Instagram, and Google Calendar
- Responsive layouts for desktop and mobile
- Static, dependency-free HTML, CSS, and JavaScript

## Local preview

Serve the `dist` directory with any static server. For example:

```sh
python -m http.server 4173 --directory dist
```

Then open `http://localhost:4173`.

## Structure

- `dist/index.html` — page content
- `dist/styles.css` — visual system and responsive layout
- `dist/app.js` — theme controls and interactions
- `dist/assets/logos` — local brand assets
- `docs/architecture.svg` — architecture overview
