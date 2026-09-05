---
name: typst-doc
description: Create a Typst file from the typst_packages templates cloned into the project — lecture notes / handouts (lecture.typ), slide decks (slide.typ), academic posters (poster.typ), standalone cropped figures (drawimg.typ). Use when asked for a new .typ document, lecture notes, presentation, beamer-style slides, or a poster.
---

# Typst templates

The templates are cloned into the project as `typst_packages/`, and documents sit
beside it at the project root:

```
PROJECT/
  typst_packages/    <- this repo (lecture.typ, slide.typ, poster.typ, ...)
  notes.typ          <- the document you create
```

So the import is always `./typst_packages/<template>.typ`, and `typst compile notes.typ`
works with no `--root` flag. If the document is nested deeper, adjust the relative path
and compile with `--root PROJECT`.

Each template exposes a `conf` show-rule plus theorem environments and math shorthands.

| Want | Template | Page |
|---|---|---|
| notes, handout, homework | `lecture.typ` | A4, numbered |
| presentation | `slide.typ` | 16:9, touying university theme |
| conference poster | `poster.typ` | A0, 2 columns |
| one cropped figure | `drawimg.typ` | page shrunk to content |

If `typst_packages/` is missing from the project, clone it before writing the document.

## Keep the content concise

Write the document the way the user would: plain and to the point. The template already
handles the styling — do not decorate on top of it.

- Say the thing once. No filler intros, no summary sections restating what was said, no
  "In this section we will...".
- Use the template's own constructs (`#theorem`, `#definition`, `= `) instead of hand-built
  `#block`/`#rect`/colored boxes.
- No extra `#set`/`#show` rules, custom colors, fonts, or spacing tweaks unless asked —
  they fight the template.
- Slides: a handful of lines per slide, not paragraphs.
- Only fill in content the user actually gave you. Leave a short `// TODO` where they need
  to supply something rather than inventing filler text.

## Skeletons

### lecture.typ

```typst
#import "./typst_packages/lecture.typ": *
#show: conf.with(title: "Title", subtitle: "Subtitle", author: "Name")
#makeTitle

= Section
#definition[A *foo* is ...]
#theorem[Every foo is bar.]
#proof[Immediate.]

$ a^2 + b^2 = c^2 $ <pyth>
By @pyth, ...
```

`conf` takes `title:`, `subtitle:`, `author:` — all optional. `#makeTitle` is separate;
omit it for a title-less handout. Fonts are New Computer Modern + CJK fallback with
fake-bold for Han characters.

### slide.typ

```typst
#import "./typst_packages/slide.typ": *
#show: conf.with(
  title: "Short title",        // header/footer
  subtitle: "Subtitle",
  author: "Name",
  title-full: [Full Title],    // title slide only
  author-full: [Full Name],
  size: 21pt,                  // body text size
)

= Section                      // groups slides; renders no slide of its own
== Slide title                 // starts a new slide, shown in the colored header
- point one
#pause
- point two
```

`==` creates slides, `=` only groups. `#pause` / `#meanwhile` for overlays.
`---` is *not* a slide break here.

### poster.typ

```typst
#import "./typst_packages/poster.typ": *
#show: conf.with(
  "Poster Title", "Author Name",
  advisor: "Advisor Name",                 // optional
  main_color: rgb(35, 80, 120),            // title band + heading color
  logo_left: image("l.png", width: 8cm),   // optional
  logo_right: image("r.png", width: 8cm),  // optional
)

= Introduction
Body text flows in two columns.
```

Title and author are **positional**. Body is 32pt; `= ` headings get a colored rule.

### drawimg.typ

```typst
#import "./typst_packages/drawimg.typ": *
#show: conf
#rect(width: 5cm, height: 3cm)[content]
```

Page is measured to the content — use it to export a single figure for embedding.

## Shared features

- **Theorem boxes** (`box.typ`, re-exported by `lecture.typ`; redefined in `slide.typ`):
  `theorem`, `lemma`, `corollary`, `proposition`, `definition`, `conjecture`, `property`,
  `remark`, `discussion`, `example`, `hypothesis`, `proof`, `exercise`.
  All except `exercise`/`proof` share one counter numbered `<section>.<n>`.
  Usage: `#theorem[...]` or `#theorem("Named")[...]`.
- **Equation numbering** (`utils.typ`, `math-ref`): a display equation is numbered
  `(section.n)` **only if it carries a label** — `$ ... $ <name>` — and `@name`
  renders as a clickable `(1.2)`. Unlabeled equations stay unnumbered.
- **Math shorthands** (`symbol.typ`): `st`, `implies`, `leq`, `iso`, `tensor`, `wedge`,
  `cir`, `cl(A)`, `pair(a,b)`, `dval(f,a)`, `coinv(a,b)`, `ocinv(a,b)`, `diam`, `supp`.
- **lecture.typ extras**: `scr(X)` script letters, `textb`/`textr` for CJK bold/regular,
  `heading-without-number[Title]`.
- **Drawing**: `poster.typ` and `drawimg.typ` re-export `cetz` (0.5.2) and fletcher's
  `diagram` / `node` / `edge` (0.5.8), ready to use. `lecture.typ` and `slide.typ` do not —
  import them yourself, or draw in a `drawimg.typ` file and `image()` the PDF in.

## Compile

```
typst compile notes.typ      # -> notes.pdf
typst watch notes.typ        # live rebuild
```

Always compile after writing and report errors.
