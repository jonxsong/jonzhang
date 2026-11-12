# Jon Zhang — Portfolio

A responsive personal portfolio for Jon Zhang, a GenAI and full-stack engineer.

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
