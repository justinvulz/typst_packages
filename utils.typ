// Number of labeled equations counted before the most recent level-1 heading
// that precedes `loc`. Subtracting this from the global equation counter gives
// the per-section equation index, without relying on a counter reset (which
// would require the heading to be laid out -- touying drops it when
// new-section-slide-fn is none).
#let _eq-base(loc) = {
  let secs = query(selector(heading.where(level: 1)).before(loc))
  if secs.len() > 0 {
    counter(math.equation).at(secs.last().location()).first()
  } else {
    0
  }
}

#let math-ref= doc => {
  show math.equation:it => {
    if it.fields().keys().contains("label"){
        math.equation(
          block: true,
          numbering: num => numbering(
            "(1.1)",
            counter(heading).get().first(),
            num - _eq-base(here()),
          ),
          it
        )
    } else {
      it
    }
  }
  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(el.location(), numbering(
        "(1.1)",
        counter(heading).at(el.location()).first(),
        counter(math.equation).at(el.location()).first() + 1 - _eq-base(el.location())
      ))
    } else {
      it
    }
  }
  doc
}
