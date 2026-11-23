How the org's own system is used for UI. What good UI is: [main.md](./main.md). Each tool below has its own docs; this is only how they fit.

# Where a design lives
```
Figma · Main (intent) ───────────────▶ code (truth) ───nix run .#figma──▶ Figma · <repo> render (what code draws now)
   ▲ updated when the render shows                                          never read back
   └── the nicer answer ◀── compare ───────────────────────────────────────────┘
```
- **Main** ([e0V2P1cQpEFRuXTeNtEMh6](https://www.figma.com/design/e0V2P1cQpEFRuXTeNtEMh6/Main)) holds intent: one page per product macro, the `uikit` page for shared primitives. A design exists once: primitives (uikit) → patterns shared across apps (hotbar, scope picker, agent dock) → an app's parts → its frames. A frame instances parts; it never copies them.
- **Render files** are what the code draws, every page at every breakpoint, from the repo's e2e harness ([`figma-render`](https://github.com/EV-Main/web_std/tree/main/ts/figma-render)). They are a debug artefact, like a flamegraph. Where a render and Main disagree, the nicer one for the user wins: Main is updated, or the code is.
- Figma draws interaction, layout and states. Visuals the code generates (map layers, heat fields, Grafana panels) get a stand-in there, never a redraw.
- Micro elements (controls, their states, empty and error screens) are the kit's. An app design that redraws one is a missing kit component.

# The kit
[web_std](https://github.com/EV-Main/web_std): `@evinvest/uikit` (React) and `ev_lib::uikit_dioxus` / `uikit_leptos`, one component set, the same HTML.

- `tokens.css` is the contract. A product re-themes by writing token values (`:root`, `[data-brand]`, `.dark`), never by overriding a component's classes. A literal where a role token exists is a missing token ([roles](https://github.com/EV-Main/web_std/blob/main/docs/spec/roles.md)).
- Variants name a state or a consequence (`Destructive`, `Outline`), never a hue ([variants](https://github.com/EV-Main/web_std/blob/main/docs/spec/variants.md)).
- Operator tools default to the neutral dark theme, flat (no depth). Customer-facing pages wear their brand through `[data-brand]` and `--brand-font-*`; landing-page machinery is `@evinvest/marketing` and the business's own `sites_tools`.
- A component a second product needs moves into the kit; one product's stays with it.

# Keys
`@evinvest/keymap` / `ev_lib::keymap`: every chord waits behind a leader (`Alt+S`), so the page never takes a key from the browser or a field. Every action a key runs has an id, so a control can show its keycaps and an agent can run it. One undo history per page (`UndoProvider`).

# State in the URL
What a screen shows (the open object, its tab, a filter, a window) is in the URL. A state is then linkable, restorable, and reached by the render's crawl: a state no link reaches has no frame.

# Copy
English is the source; `@evinvest/i18n` refuses a translation whose English moved. Translations wait for release.

# Measuring
A UX claim that can be measured is an experiment (`@evinvest/experiments`, exposure into `@evinvest/analytics`), not an argument.
