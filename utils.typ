#let math-ref= doc => {
  show math.equation:it => {
    if it.fields().keys().contains("label"){
        math.equation(
          block: true,
          numbering: num => numbering("(1.1)", counter(heading).get().first(), num),
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
        counter(math.equation).at(el.location()).first() + 1
      ))
    } else {
      it
    }
  } 
  doc
}
