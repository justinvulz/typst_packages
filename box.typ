#import "@preview/ctheorems:1.1.3": *

#let exercise = thmbox(
  "exercise",
  "Exercise",
  stroke: black + 1pt,
  base: none,           
).with(numbering: "I") 

#let theorem = thmbox(
  "id1",
  "Theorem",
  // fill: rgb("e8e8f8"),
  base_level: 1,
  padding: (y: 0em)
).with(
  inset: 0em
)

#let property= thmbox(
  "id1",
  "Property",
  // fill: rgb("e8f8e8"),
  base_level:2,
  padding: (y: 0em)
).with(
  inset: 0em
)

#let definition = thmbox(
  "id1",
  "Definition",
  // fill: rgb("e8f8e8"),
  base_level:1,
  padding: (y: 0em)
).with(
  inset: 0em
)

#let conjecture = thmbox(
  "id1",
  "Conjecture",
  // fill: rgb("e8f8e8"),
  base_level:1,
  padding: (y: 0em)
).with(
  inset: 0em
)

#let lemma = thmbox(
  "id1",
  "Lemma",
  // fill: rgb("e8e8f8"),
  // stroke: black,
  base_level: 1,
  padding: (y: 0em)
).with(
  inset: 0em
)

#let remark = thmbox(
  "id1",
  "Remark",
  // stroke: black,
  base_level: 1,
  padding: (y: 0em)
).with(
  inset: 0em
)

#let corollary = thmbox(
  "id1",
  "Corollary",
  // fill: rgb("e8e8f8"),
  base_level: 1,
  padding: (y: 0em)
).with(
  inset: 0em
)

#let discussion = thmbox(
  "id1",
  "Discussion",
  base_level: 1,
  breakable: true,
  // stroke: black + 1pt,
  padding: (y: 0em)
).with(
  inset: 0em
)

#let proof = thmproof("pkoof","Proof").with(inset:0em)

#let example = thmplain("example","Example").with(
  inset: (top: 0.5em, bottom: 0.5em),//, left: 1em, right: 1em),
  numbering: none
)

