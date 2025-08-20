#import "@preview/wrap-it:0.1.1": wrap-content
#set heading(numbering: none)

= Glossario <glossario>

#show figure: set align(start)
#show figure: set block(breakable: true)
#set text(hyphenate: false)

#let defCounter = counter("oc")

#let pages = state("pages", ())

#let generateGlossaryFromYaml(contents) = {
  for (word, definition) in contents {
    let w = [#figure(
        kind: "word_definition",
        supplement: "Definizione",
      )[*#upper(word.at(0))#word.slice(1) :*]#label(word)]

    let d = [#h(-.6em)#definition.
      #context (
        let i = 1,
        let pages = (),
        let pagesLink = "",
        while i <= counter(word).get().at(0) {
          let newPage = counter(page).at(locate(label(word + "link" + str(i))))
          if (pages.contains(newPage) == false) {
            pages.push(newPage)
            if (i + 1 <= counter(word).get().at(0)) {
              if (
                i + 1 == counter(word).get().at(0)
                  and counter(page).at(locate(label(word + "link" + str(i + 1)))) == newPage
              ) {
                pagesLink += link(label(word + "link" + str(i)))[#text(fill: rgb("#2C5E77"))[ #str(newPage.at(0))].]
              } else {
                pagesLink += link(label(word + "link" + str(i)))[#text(fill: rgb("#2C5E77"))[#str(newPage.at(0))], ]
              }
            } else {
              pagesLink += link(label(word + "link" + str(i)))[#text(fill: rgb("#2C5E77"))[ #str(newPage.at(0))].]
            }
          }
          i += 1
        },
        pagesLink,
      ).at(4)]

    wrap-content(w, d)
    linebreak()
  }
}

#let glossary = yaml("../yml/glossary.yml")
#let abbr = yaml("../yml/abbreviation.yml")

// se c'è l'abbr porta sempre all'abbr, altrimenti deve portare al glossario. Data un'abbreviazione, la prima volta viene automaticamente scritta per esteso. Se una parola compare sia in glossario che in abbr, la pagina in cui è presente sarà contata in entrambe le sezioni

#let glos(word) = {
  let labelText = word + "abbr"
  let abbrFound = true
  let abbrOnly = false

  if (word in glossary and word in abbr) {
    counter(word).step()
    counter(word + "abbr").step()
    labelText = word
  } else if (word in glossary) {
    counter(word).step()
    labelText = word
    abbrFound = false
  } else {
    counter(word + "abbr").step()
    abbrOnly = true
  }
  context (
    let output = "",
    let linkText = word,
    if (abbrFound == true and counter(word + "abbr").get().at(0) == 1) {
      linkText = [#abbr.at(word) (#word)]
    },
    if (abbrOnly == true) {
      output = text(style: "italic", fill: rgb("#2C5E77"))[#link(label(labelText))[#linkText#sub(size: 0.7em)[a]]#label(
          word + "abbr" + str(counter(word + "abbr").get().at(0)),
        )]
    } else {
      output = text(style: "italic", fill: rgb("#2C5E77"))[#link(label(labelText))[#linkText#sub(size: 0.7em)[g]]#label(
          word + "link" + str(counter(word).get().at(0)),
        )]
    },
    output,
  ).at(4)
}

#generateGlossaryFromYaml(glossary)
