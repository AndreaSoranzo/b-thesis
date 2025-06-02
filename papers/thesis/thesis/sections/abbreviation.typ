#import "@preview/wrap-it:0.1.1": wrap-content
#set heading(numbering: none)

#pagebreak()
= Acronimi e abbreviazioni

#show figure: set align(start)

#let generateAbbrFromYaml(contents) = {
  //nota: ci sono abbr che sono anche nel glossario, in tal caso sono contate sia qui che nel glossario
  if(contents!=none) {
    for (word, definition) in contents {
      let w=[#figure(kind: "word_definition",supplement: "Definizione",)[*#upper(word.at(0))#word.slice(1) :*]#label(word+"abbr")]
      let d=[#h(-.6em)#definition.
      #context (
        let i=1,
        let pages = (),
        let pagesLink = "",
        let newPage=0,
        let labelText="link",
        while i <= counter(word+"abbr").get().at(0) {
          if(counter(word).get().at(0)>0) {
            //Se la parola è anche nel glossario allora tutte label sono in formato word+link+numero
            newPage = counter(page).at(locate(label(word+"link"+str(i))))
          } else {
            //Se la parola è solo un'abbreviazione allora tutte le label sono in formato word+abbr+numero
            newPage = counter(page).at(locate(label(word+"abbr"+str(i))))
          }
          if(pages.contains(newPage)==false) {
            pages.push(newPage)
            if(counter(word).get().at(0)==0) {
              labelText="abbr"
            }
            if(i+1 <= counter(word+"abbr").get().at(0)) {
              if(i+1==counter(word+"abbr").get().at(0) and counter(page).at(locate(label(word+labelText+str(i+1))))==newPage) {
                pagesLink+=link(label(word+labelText+str(i)))[#text(fill: rgb("#2C5E77"))[#str(newPage.at(0))].]
              } else {
                pagesLink+=link(label(word+labelText+str(i)))[#text(fill: rgb("#2C5E77"))[#str(newPage.at(0))], ]
              } 
            } else {
              pagesLink+=link(label(word+labelText+str(i)))[#text(fill: rgb("#2C5E77"))[ #str(newPage.at(0))].]
            }
          }
          i+=1
        },
        pagesLink
      ).at(6)]
      wrap-content(w,d)
  }
  }
}

#generateAbbrFromYaml(yaml("../yml/abbreviation.yml"))