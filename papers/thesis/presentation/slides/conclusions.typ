#import "../utility.typ": slide

#slide("CONCLUSIONI", [
  #align(horizon)[
    #grid(
      columns: (3fr, 2fr),
      gutter: 5%,
      text[
        - *Obiettivo raggiunto* con successo
          - Protezione NodeGoat *conforme a 10/10* standard sicurezza
        \
        - Importanza del *fine-tuning* per ridurre falsi positivi e migliorare esperienza utenti
        \
        - Possibili *miglioramenti*:
          - Integrazione WAF con sistemi *SIEM*
          - Automazione test di sicurezza *CI/CD*
          - Adozione di *threat intelligence estesa*
      ],
      image("../img/conclusion.png"),
    )
  ]
])
