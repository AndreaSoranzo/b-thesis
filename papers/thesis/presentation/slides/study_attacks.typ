#import "../utility.typ": slide

#slide("STUDIO SUGLI ATTACCHI PIÙ COMUNI", [
  #align(horizon)[
    #grid(
      columns: (0.1fr, 3fr, 2fr),
      gutter: 4%,
      text[],
      text[
        - *XSS*

        - *SQL Injection*
        - *Brute force*
          - Credential stuffing
        - *Path traversal*
        - *Session hijacking*
        - *CSFR*
        - *SSRF*
      ],
      place(bottom)[#image("../img/attack.jpg")],
    )
  ]
])
