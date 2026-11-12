# Jon Zhang — Portfolio

A responsive personal portfolio for Jon Zhang, a GenAI and full-stack engineer.

**Live site:** [jon-zhang-portfolio-2026.perkyaisle4.chatgpt.site](https://jon-zhang-portfolio-2026.perkyaisle4.chatgpt.site)

## Architecture

![Hand-drawn architecture diagram showing the browser, static portfolio, GitHub integration, hosting, and source repository](docs/architecture.svg)

The portfolio is a dependency-free static site. Its JavaScript enriches the page at runtime with public GitHub activity, while the same committed source is published to ChatGPT Sites and mirrored to GitHub.

## Features

- Time-of-day sky theme with an interactive hour selector
- Selected projects and resume-backed experience
- Live weekly public activity from the GitHub Events API
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
- `dist/app.js` — theme controls, interactions, and GitHub activity
- `dist/assets/logos` — local brand assets
- `docs/architecture.svg` — architecture overview
