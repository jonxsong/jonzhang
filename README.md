<p align="center">
  <img src="docs/readme-hero.svg" alt="Jon Zhang portfolio — GenAI and full-stack engineer" width="100%" />
</p>

<p align="center">
  <a href="https://jonzhang.dev"><img alt="Live portfolio" src="https://img.shields.io/badge/VIEW_LIVE_PORTFOLIO-3367FF?style=for-the-badge&logo=safari&logoColor=white" /></a>
  <a href="https://omnigaze.jonzhang.dev"><img alt="Omnigaze" src="https://img.shields.io/badge/EXPLORE_OMNIGAZE-159D8F?style=for-the-badge&logo=googleearth&logoColor=white" /></a>
  <a href="https://afterglow.jonzhang.dev/"><img alt="Afterglow" src="https://img.shields.io/badge/EXPLORE_AFTERGLOW-C8739A?style=for-the-badge&logo=icloud&logoColor=white" /></a>
  <a href="https://courtvision.jonzhang.dev"><img alt="CourtVision" src="https://img.shields.io/badge/EXPLORE_COURTVISION-0A2030?style=for-the-badge&logo=nba&logoColor=2DDEDA" /></a>
  <a href="https://orbit.jonzhang.dev"><img alt="Orbit" src="https://img.shields.io/badge/EXPLORE_ORBIT-08111F?style=for-the-badge&logo=expo&logoColor=9FC4FF" /></a>
  <a href="https://affinity.jonzhang.dev"><img alt="Affinity" src="https://img.shields.io/badge/EXPLORE_AFFINITY-0A211A?style=for-the-badge&logo=rust&logoColor=72EFB5" /></a>
  <a href="https://relay.jonzhang.dev"><img alt="Relay" src="https://img.shields.io/badge/EXPLORE_RELAY-15152D?style=for-the-badge&logo=go&logoColor=A89CFF" /></a>
  <a href="https://axion.jonzhang.dev"><img alt="Axion" src="https://img.shields.io/badge/EXPLORE_AXION-0A2640?style=for-the-badge&logo=rust&logoColor=7FD1FF" /></a>
  <a href="https://datacurrent.jonzhang.dev"><img alt="DataCurrent" src="https://img.shields.io/badge/EXPLORE_DATACURRENT-162738?style=for-the-badge&logo=postgresql&logoColor=6ED6DF" /></a>
  <a href="https://frasi-jazz-studio.perkyaisle4.chatgpt.site/"><img alt="Frasi" src="https://img.shields.io/badge/EXPLORE_FRASI-563D7C?style=for-the-badge&logo=applemusic&logoColor=white" /></a>
</p>

<p align="center">
  <img alt="Static HTML" src="https://img.shields.io/badge/HTML-static-E34F26?style=flat-square&logo=html5&logoColor=white" />
  <img alt="CSS" src="https://img.shields.io/badge/CSS-responsive-1572B6?style=flat-square&logo=css3&logoColor=white" />
  <img alt="JavaScript" src="https://img.shields.io/badge/JavaScript-vanilla-F7DF1E?style=flat-square&logo=javascript&logoColor=111" />
  <img alt="Public deployment" src="https://img.shields.io/badge/deployment-public-28A68F?style=flat-square" />
</p>

<h1 align="center">Jon Zhang — Portfolio</h1>

<p align="center">
  A responsive, interactive portfolio for a <strong>GenAI / Full-Stack Engineer</strong><br />
  engineering AI systems that turn complex information into useful decisions.
</p>

---

## ✦ The experience

This portfolio is designed as an editorial product, not a résumé pasted into one long webpage. The homepage introduces Jon in depth, presents eight compact living project previews, and closes with evidence of activity plus a guided next step. Dedicated routes give experience, projects, and contact room to breathe—all inside the existing time-reactive visual atmosphere.

| Chapter | What visitors can explore |
| --- | --- |
| **Homepage** | Portrait-led About, eight living project previews, evidence of activity, and a guided next step |
| **Experience** | Editorial career timeline with consistent impact callouts, technical highlights, and education |
| **Projects** | Eight vertically arranged animated case cards using standardized Focus / Stack / Data / Systems / Status details |
| **Contact** | Meeting CTA plus an icon-led directory for LinkedIn, GitHub, résumé, Instagram, and Facebook |
| **Language** | Instant English and Simplified Chinese views with the visitor’s preference remembered locally |
| **Atmosphere** | A 24-hour interactive sky that shifts the page palette from sunrise through night |

## ◎ Design details

- Responsive glass-and-gradient visual system
- Clean static routes at `/experience`, `/projects`, and `/contact`
- Hash-addressable project cards that open directly from the homepage index
- Portrait-led editorial layout with compact animated project previews
- Local company and university assets
- Custom `JZ.` browser favicon
- Mobile layouts tuned independently from desktop
- Reduced-motion support for visitors who prefer it
- No application framework or runtime dependencies

## ⌁ Architecture

The portfolio is structured to answer four questions in order: **Who is Jon? What does he build? Where has he created impact? How can I connect?**

```mermaid
flowchart LR
  A["01 · Discover<br/>About + positioning"] --> B["02 · Explore<br/>Living project previews"]
  B --> C["03 · Validate<br/>Case studies + experience"]
  C --> D["04 · Connect<br/>Meeting + professional links"]

  classDef stage fill:#F5F7FF,stroke:#3367FF,color:#111827,stroke-width:2px;
  class A,B,C,D stage;
  linkStyle default stroke:#7C8DB5,stroke-width:2px;
```

The homepage gives a concise overview, then guides visitors into detailed project and experience pages. Every deeper route keeps a clear next step toward live products, source code, or a direct conversation.

## ⌘ Project map

```text
jon-portfolio/
├── .github/
│   └── workflows/
│       └── deploy-pages.yml  # GitHub Pages deployment
├── .openai/
│   └── hosting.json          # ChatGPT Sites configuration
├── dist/
│   ├── CNAME                 # jonzhang.dev custom domain
│   ├── assets/
│   │   ├── favicon.svg       # JZ. site mark
│   │   ├── jon-portrait.png  # Homepage portrait
│   │   └── logos/            # Company and university assets
│   ├── app.js                # Language, time theme, and preview animations
│   ├── contact/index.html    # Meeting and contact directory
│   ├── experience/index.html # Experience route
│   ├── projects/index.html   # Project case-card route
│   ├── index.html            # About, project grid, evidence, and next step
│   └── styles.css            # Layout and visual system
├── docs/
│   └── readme-hero.svg       # Repository artwork
└── README.md
```

## ↗ Links

- **Portfolio:** [jonzhang.dev](https://jonzhang.dev) · [source](https://github.com/jonxsong/jonzhang)
- **Omnigaze:** [omnigaze.jonzhang.dev](https://omnigaze.jonzhang.dev) · [source](https://github.com/jonxsong/omnigaze)
- **Afterglow:** [https://afterglow.jonzhang.dev](https://afterglow.jonzhang.dev) · [source](https://github.com/jonxsong/afterglow)
- **CourtVision:** [courtvision.jonzhang.dev](https://courtvision.jonzhang.dev) · [source](https://github.com/jonxsong/courtvision)
- **Orbit:** [orbit.jonzhang.dev](https://orbit.jonzhang.dev) · [source](https://github.com/jonxsong/orbit)
- **Affinity:** [affinity.jonzhang.dev](https://affinity.jonzhang.dev) · [source](https://github.com/jonxsong/Affinity)
- **Relay:** [relay.jonzhang.dev](https://relay.jonzhang.dev) · [source](https://github.com/jonxsong/Relay)
- **Axion:** [axion.jonzhang.dev](https://axion.jonzhang.dev) · [source](https://github.com/jonxsong/Axion)
- **DataCurrent:** [datacurrent.jonzhang.dev](https://datacurrent.jonzhang.dev) · [source](https://github.com/jonxsong/DataCurrent)
- **Frasi:** [frasi-jazz-studio.perkyaisle4.chatgpt.site](https://frasi-jazz-studio.perkyaisle4.chatgpt.site) · [source](https://github.com/jonxsong/Frasi)
- **GitHub:** [github.com/jonxsong](https://github.com/jonxsong)
- **LinkedIn:** [linkedin.com/in/jonxsong](https://www.linkedin.com/in/jonxsong/)

---

<p align="center">
  <sub>Designed and engineered by Jon Zhang · GenAI × Engineering × Product</sub>
</p>
