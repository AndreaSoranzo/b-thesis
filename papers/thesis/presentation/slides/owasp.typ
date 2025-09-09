#import "../utility.typ": slide

#slide("OWASP TOP 10", [
  #align(horizon)[
    #grid(
      columns: (2.5fr, 2fr),
      grid(
        rows: (1fr, 2fr),
        align: center,
        image("../img/owasp-ogo.png", width: 50%),
        image("../img/owasp10.png", width: 80%),
      ),
      text[
        - Organizzazione che analizza e classifica le *10 principali vulnerabilità* delle applicazioni web
        \
        - WAF sviluppato *progettato per riconoscere e bloccare questi attacchi* specifici
        \
        - Rapporto aggiornato *annualmente*
        \
        - Versione *2021* adottata come standard per il progetto
      ],
    )
  ]
])
