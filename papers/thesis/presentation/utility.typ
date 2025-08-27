#import "@preview/grayness:0.3.0": image-transparency

#let myUni = "UNIPD"
#let myDepartment = "Dipartimento di Matematica"
#let myFaculty = "Corso Di Laurea in Informatica"
#let myMatricola = "2075539"
#let myName = "Soranzo Mendez Andrea Jesus"
#let myTitle = "Applicazioni web vulnerabili: Implementazione di un Web Application Firewall con F5 per la mitigazione di attacchi informatici"
#let myAA = "2024/2025"

#let date = datetime(
  year: 2025,
  month: 09,
  day: 19,
)

#let unipdColor = rgb("#9B0014")

#let slide(title, body) = {
  set text(14pt, font: "Merriweather 24pt")
  set rect(
    width: 183%,
    height: 100%,
    inset: 4pt,
  )
  set page(
    paper: "presentation-16-9",
    margin: (top: 2.3cm, bottom: 2.3cm),

    header: [#set text(fill: white)
      #grid(
        columns: 100%,
        rows: 100%,
        align(left + horizon)[#text(1.5em, weight: "bold")[#title]]
      )],

    footer: [
      #set text(0.7em, fill: black)
      #let currentPage = context (counter(page).display())
      #let lastPage = context (counter(page).final().at(0))
      #move(dx: -57pt, dy: 0pt)[#line(length: 90%, stroke: 2pt + unipdColor)]
      #grid(
        columns: (5%, 90%),
        align(left + horizon)[#currentPage/#lastPage],
        align(left + horizon)[#myTitle \ #myName #myMatricola - #date.display("[day] Settembre [year]")],
      )
    ],

    background: [
      #set rect(
        width: 183%,
        height: 10%,
        inset: 4pt,
      )

      #move(dx: 345pt, dy: -107pt)[
        #rect(fill: unipdColor)
      ]

      #move(dx: 370pt, dy: 165pt)[
        #image("../../public/media/unipd.png", width: 20%)
      ],
    ],
  )
  body
}

#let startSlide(title, nome, data) = {
  set text(fill: white)
  set page(
    margin: 2em,
    paper: "presentation-16-9",
    fill: unipdColor,
  )

  align(center)[
    #text(size: 2em)[
      #myDepartment -
      #myUni \
      #myFaculty \
      Anno Accademico #myAA
    ]
  ]

  align(center)[#v(1em) #image("../../public/media/unipd-alt.png", width: 40%) #v(1em)]

  align(center)[#text(size: 2em, weight: "bold")[#title]]

  line(length: 100%, stroke: white)

  align(center)[#text(size: 1.4em)[#myName #myMatricola \ Esame di Laurea \ #data.display("[day] Settembre [year]")]]
}
