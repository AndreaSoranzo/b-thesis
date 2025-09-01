#import "../utility.typ": slide

#slide("REQUISITI E DIFFICOLTA", [
  #align(horizon)[
    #grid(
      columns: (2fr, 3fr),
      image("../img/req.jpg", height: 250pt),
      text[
        - Diversi tipi di requisito:
          - *Funzionali*: Visualizzare l'applicazione, definire le regole per determinati attacchi
          - *Qualitativi*: Conformità OWASP top 10 2021, bloccare attacchi
          - *Vincolo*: Utilizzo moduli F5, Rsyslog
        \
        - Difficoltà incontrate:
          - Complessità iniziale di F5 e *vasta gamma di opzioni nella GUI*
          - *Studio autonomo* di networking per configurare WAF
          - Lavoro completamente da *remoto* per un mese a causa di ristrutturazione
      ],
    )
  ]
])
