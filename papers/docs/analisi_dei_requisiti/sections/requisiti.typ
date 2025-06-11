#import "./glossary.typ": glos
#import "../utility.typ": Rid

= Requisiti
I requisiti del progetto sono stati definiti dopo il periodo di formazione, durante una breve riunione tra noi stagisti e i due tutor aziendali. Di seguito sono presentate le tabelle che illustrano i diversi tipi di requisiti (funzionali, di qualità e di vincolo), dove ciascun requisito è identificato da una nomenclatura che ne indica la classificazione:
- *M*: Obbligatorio
- *D*: Desiderabile
- *O*: Obbligatorio


== Requisiti funzionali

#let RF = counter("RF")

#table(
  columns: (1fr, 2fr, 1fr, 1fr),
  fill: (_, j) => {
    if calc.odd(j + 1) {
      return luma(255)
    } else {
      return luma(240)
    }
  },
  align: horizon + center,
  [*Requisito*], [*Descrizione*], [*Classificazione*], [*Fonte*],
  [RF#context { Rid(RF) }], [Il #glos("WAF") deve saper mitigare o bloccare attacchi di tipo #glos("XSS")], [O], [-],
)

== Requisiti qualitativi

#let RQ = counter("RQ")

#table(
  columns: (1fr, 2fr, 1fr, 1fr),
  fill: (_, j) => {
    if calc.odd(j + 1) {
      return luma(255)
    } else {
      return luma(240)
    }
  },
  align: horizon + center,
  [*Requisito*], [*Descrizione*], [*Classificazione*], [*Fonte*],
  [RQ#context { Rid(RQ) }], [Dato B1], [O], [-],
)


== Requisiti di vincolo

#let RV = counter("RV")

#table(
  columns: (1fr, 2fr, 1fr, 1fr),
  fill: (_, j) => {
    if calc.odd(j + 1) {
      return luma(255)
    } else {
      return luma(240)
    }
  },
  align: horizon + center,
  [*Requisito*], [*Descrizione*], [*Classificazione*], [*Fonte*],
  [RV#context { Rid(RV) }], [Dato B1], [O], [-],
)

