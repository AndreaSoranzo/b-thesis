#import "../utility.typ": slide

#slide("VINCOLI E TECNOLOGIE ADOTTATE", [
  #align(horizon)[
    #grid(
      columns: (2fr, 1.5fr),
      gutter: 5%,
      text[
        - *F5 BIG-IP 17.5*

        - *VMWare Workstation 17*
          - Creazione macchine virtuali

        - *Burp Suite Community Edition*
          - Intercettazione e manipolazione traffico HTTP/HTTPS
        \
        - *Bash*
          - Script di simulazione attacchi DoS e Bot

        - *Python*
          - Attacchi di login-stuffing e invio richieste HTTP e analisi risposte
      ],
      [#image("../img/tech.jpg")],
    )
  ]

])
