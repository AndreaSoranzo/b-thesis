#import "../utility.typ": slide

#slide("CREAZIONE E IMPLEMENTAZIONE WAF", [
  #align(horizon)[
    #grid(
      columns: (6fr, 3fr),
      gutter: 5%,
      grid(
        columns: (1fr, 1fr),
        rows: (1fr, 1fr),
        gutter: 3%,
        image("../img/vs.png"), image("../img/stuffer.png"),
        image("../img/dos.png"), image("../img/compliance10.png"),
      ),
      text[
        - Creazione *macchine virtuali*
        \
        - Configurazione iniziale F5:
          - *Policy*
          - *Virtual server*
        \
        - Conformità OWASP 2021:
        \
        - *Simulazioni attacchi*:
          - #link("../videos/dos_attack.mp4")[DoS]
          - #link("../videos/bot_attack.mp4")[BOT]
          - Credential stuffing
      ],
    )
  ]
])
