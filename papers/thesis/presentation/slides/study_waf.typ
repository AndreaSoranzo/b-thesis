#import "../utility.typ": slide

#slide("STUDIO WAF E F5", [
  #align(horizon)[
    #grid(
      columns: (1fr, 1fr),
      gutter: 2%,
      text[
        - *Firewall tradizionale vs WAF*
          - 2 tipi di difesa differenti
        \
        - *Modulo ASM* di F5 BIG-IP
          - Policy e la loro gestione
          - Stati policy
        \
        - *DoS* detection
        \
        - *BOT* protection
      ],
      grid(
        rows: (2fr, 1fr),
        align: center,
        image("../img/f5.png", width: 120%),
        image("../img/f5-logo.png", width: 25%),
      ),
    )
  ]
])
