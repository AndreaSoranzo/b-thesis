#let cover(
  doc,
) = {
  set text(lang: "it")
  set align(center)
  set list(indent: 10pt)
  set text(18pt, font: "Merriweather 24pt")
  set par(justify: true)
  set rect(stroke: rgb("#5e5e5e"))
  show link: set text(fill: rgb(0, 0, 255), weight: "bold")

  let logo = "../../public/media/unipd.png"


  image(logo, width: 30%)

  v(15pt)

  text()[Università degli Studi di Padova \ ]

  v(5pt)

  text()[Corso di Laurea in Informatica \ ]

  v(20pt)

  text(30pt, weight: "bold")[Analisi Dei Requisiti\ ]

  v(10pt)

  text(15pt)[Azienda: \ ]
  text()[KIREY Srl]

  v(80pt)

  text()[Soranzo Mendez Andrea Jesus\ ]
  text()[2075539]

  v(80pt)

  set page(
    margin: (top: 15%, bottom: 10%, left: 13%, right: 13%),
    numbering: "1",
    header: [
      #v(1em)
      #set text(11pt)
      #table(
        stroke: none,
        columns: (50%, 35%, 15%),
        rows: (20%, 20%, 20%),
        table.cell(align: left, inset: (x: 0%))[Soranzo Mendez Andrea Jesus], table.cell(
          align: right,
        )[Università], table.cell(rowspan: 3, align: right + horizon)[#image(logo, height: 130%)],
        table.cell(align: left, inset: (x: 0%))[2075539], table.cell(align: right)[degli Studi],
        table.cell(align: left, inset: (x: 0%))[Piano di Lavoro stage c/o KIREY Srl], table.cell(
          align: right,
        )[di Padova]
      )
      #line(length: 100%)
    ],
    footer: [
      #set text(11pt)
      #set align(center)
      #line(length: 100%)
      #context [
        Pagina #counter(page).display(page.numbering) di #counter(page).final().first()
      ]
    ],
  )

  set align(left)
  set text(12pt)
  set heading(numbering: "1.")
  counter(page).update(1)
  pagebreak()

  show outline.entry: it => {
    v(1.5em, weak: true)
    strong(it)
  }

  outline(title: [#v(1pt) Indice #v(15pt)])
  pagebreak()

  set text(11pt)
  show heading: set block(above: 20pt, below: 10pt)
  set par(leading: 1em) //sarebbe line height ma 1.5em per me è veramente tanto
  outline(title: "Elenco delle figure", target: figure.where(kind: image))
  pagebreak()
  doc
}


#let Rid(counter) = {
  counter.step()
  counter.display()
}
