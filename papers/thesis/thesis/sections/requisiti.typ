#import "../utility.typ": Rid

== Requisiti
I requisiti del progetto sono stati definiti dopo il periodo di formazione, durante una breve riunione tra noi stagisti e i due tutor aziendali. Di seguito sono presentate le tabelle che illustrano i diversi tipi di requisiti (funzionali, di qualità e di vincolo), dove ciascun requisito è identificato da una nomenclatura che ne indica la classificazione:
- *M*: Obbligatorio
- *D*: Desiderabile
- *O*: Opzionale


=== Requisiti funzionali

#let RF = counter("RF")

#table(
  columns: (1.2fr, 4fr, 1.6fr, 1.2fr),
  fill: (_, j) => {
    if calc.odd(j + 1) {
      return luma(255)
    } else {
      return luma(240)
    }
  },
  align: horizon + center,
  [*Requisito*], [*Descrizione*], [*Classificazione*], [*Fonte*],
  // user
  [RF#context { Rid(RF) }], [L'utente deve visualizzare la applicazione web normalmente], [M], [UC1],
  [RF#context { Rid(RF) }],
  [L'utente deve visualizzare il CAPTCHA nel caso il WAF rilevi troppe richieste in brevi periodi di tempo],
  [M],
  [UC1.2],

  [RF#context { Rid(RF) }],
  [L'utente deve visualizzare una pagina di blocco nel caso in cui una richiesta venga rilevata sospetta e venga bloccata dal WAF],
  [M],
  [UC1.1],
  // admin - vs
  [RF#context { Rid(RF) }],
  [L'admin F5 deve gestire e creare dei virtual server in modo da permettere gli utenti di collegarsi all'applicazione web],
  [M],
  [UC2],

  [RF#context { Rid(RF) }], [L'admin F5 deve gestire e creare i server pools], [M], [UC2.1],
  [RF#context { Rid(RF) }], [L'admin F5 deve definire le regole per la protezione da attacchi DoS], [M], [UC2.2],
  [RF#context { Rid(RF) }],
  [L'admin F5 deve definire le regole di protezione da attacchi da parte di BOT e BOTNET],
  [M],
  [UC2.3],
  // admin - policy
  [RF#context { Rid(RF) }],
  [L'admin F5 deve gestire e creare le policy da assegnare al WAF in modo che riesca a filtrare le richieste sospette],
  [M],
  [UC2.4],

  [RF#context { Rid(RF) }],
  [L'admin F5 deve definire le regole per la protezione dei dati personali contenute nelle risposte del server],
  [M],
  [UC2.4.1],

  [RF#context { Rid(RF) }],
  [L'admin F5 deve definire le regole per il rilevamento di numeri di carte di credito],
  [M],
  [UC2.4.1.1],

  [RF#context { Rid(RF) }], [L'admin F5 deve definire le regole per il rilevamento di codici fiscali], [M], [UC2.4.1.2],
  [RF#context { Rid(RF) }],
  [L'admin F5 deve definire regole da applicare ai parametri che vengono passati al server tramite URL],
  [M],
  [UC2.4.2],

  [RF#context { Rid(RF) }], [L'admin F5 deve definire il tipo di valore consentito per parametro], [M], [UC2.4.2.1],
  [RF#context { Rid(RF) }], [L'admin F5 deve definire la massima lunghezza del valore per parametro], [M], [UC2.4.2.2],
  [RF#context { Rid(RF) }],
  [L'admin F5 deve definire quali meta-caratteri sono consentiti per parametro],
  [M],
  [UC2.4.2.3],

  [RF#context { Rid(RF) }], [L'admin F5 deve definire quali URL sono permessi e visibili all'utente], [M], [UC2.4.3.1],
  [RF#context { Rid(RF) }],
  [L'admin F5 deve definire quali URL non sono permessi e non visibili all'utente],
  [M],
  [UC2.4.3.2],

  [RF#context { Rid(RF) }], [L'admin F5 deve definire come vengono gestite le sessioni utente], [M], [UC2.4.4],
  [RF#context { Rid(RF) }], [L'admin F5 deve definire la condizione di successo per il login], [M], [UC2.4.4.1],
  [RF#context { Rid(RF) }],
  [L'admin F5 deve definire gli URL accessibili solo dopo l'autenticazione dell'utente],
  [M],
  [UC2.4.4.2],

  [RF#context { Rid(RF) }], [L'admin F5 deve definire gli URL di login e logout], [M], [UC2.4.4.3],
  [RF#context { Rid(RF) }], [L'admin F5 deve definire i parametri di login e logout], [M], [UC2.4.4.3.1],
  [RF#context { Rid(RF) }],
  [L'admin F5 deve creare regole per filtrare determinati tipi di richieste HTTP],
  [M],
  [UC2.4.5],

  [RF#context { Rid(RF) }], [L'admin F5 deve definire quali header sono permessi], [M], [UC2.4.5.1],
  [RF#context { Rid(RF) }], [L'admin F5 deve definire quali file sono consentiti], [M], [UC2.4.5.2],
  [RF#context { Rid(RF) }],
  [L'admin F5 deve definire regole per garantire l'autenticazione dei cookie],
  [M],
  [UC2.4.5.3],

  [RF#context { Rid(RF) }],
  [L'admin F5 deve gestire come vengono mitigati gli attacchi di tipo brute force],
  [M],
  [UC2.4.6],

  [RF#context { Rid(RF) }], [L'admin F5 deve gestire come vengono mitigati gli attacchi CSRF], [M], [UC2.4.7],
  [RF#context { Rid(RF) }], [L'admin F5 deve gestire come vengono mitigati gli attacchi SSRF], [M], [UC2.4.8],
  [RF#context { Rid(RF) }], [L'admin F5 deve definire le attack signatures], [M], [UC2.4.9],
  [RF#context { Rid(RF) }], [L'admin F5 deve configurare il modulo di IP Intelligence], [M], [UC2.4.10],
  [RF#context { Rid(RF) }], [L'admin F5 deve configurare le modalità di apprendimento del WAF], [M], [UC2.4.11],
  [RF#context { Rid(RF) }], [L'admin F5 deve definire le tecnologie utilizzate dall'applicazione web], [M], [UC2.4.12],
  [RF#context { Rid(RF) }], [L'admin F5 deve importare le threat campaign], [M], [UC2.4.13],
  [RF#context { Rid(RF) }], [L'admin F5 deve creare e definire le pagine di blocco], [M], [UC2.4.14],

  // admin - log
  [RF#context { Rid(RF) }], [L'admin F5 deve creare dei profili di logging], [M], [UC3],
  [RF#context { Rid(RF) }],
  [L'admin F5 deve instaurare il collegamento con il server syslog per memorizzare tutti i log creati dal WAF],
  [D],
  [UC3.1],
)

#pagebreak()

=== Requisiti qualitativi

#let RQ = counter("RQ")

#table(
  columns: (1.2fr, 4fr, 1.6fr, 1.2fr),
  fill: (_, j) => {
    if calc.odd(j + 1) {
      return luma(255)
    } else {
      return luma(240)
    }
  },
  align: horizon + center,
  [*Requisito*], [*Descrizione*], [*Classificazione*], [*Fonte*],
  [RQ#context { Rid(RQ) }], [La policy assegnata al WAF deve essere conforme alla top 10 di OWASP], [M], [Progetto],
  [RQ#context { Rid(RQ) }],
  [Il WAF deve essere testato tramite il tool f5-waf-tester per verificarne la sua efficacia],
  [M],
  [Progetto],
  // mitigazione attacchi
  [RQ#context { Rid(RQ) }],
  [Il WAF deve essere in grado di bloccare gli attacchi di tipo JS e SQL injection],
  [M],
  [Progetto],

  [RQ#context { Rid(RQ) }],
  [Il WAF deve essere in grado di bloccare gli attacchi di manomissione dei cookie e delle sessioni utente],
  [M],
  [Progetto],

  [RQ#context { Rid(RQ) }], [Il WAF deve essere in grado di bloccare gli attacchi XSS], [M], [Progetto],
  [RQ#context { Rid(RQ) }], [Il WAF deve essere in grado di bloccare gli attacchi IDOR], [O], [Decisione personale],
  [RQ#context { Rid(RQ) }],
  [Il WAF deve essere in grado di mascherare le informazioni sensibili degli utenti],
  [M],
  [Progetto],

  [RQ#context { Rid(RQ) }], [Il WAF deve essere in grado di rilevare e bloccare attacchi DoS], [M], [Progetto],
  [RQ#context { Rid(RQ) }],
  [Il WAF deve essere in grado di rilevare e bloccare attacchi di brute force],
  [M],
  [Progetto],
)


=== Requisiti di vincolo

#let RV = counter("RV")

#table(
  columns: (1.2fr, 4fr, 1.6fr, 1.2fr),
  fill: (_, j) => {
    if calc.odd(j + 1) {
      return luma(255)
    } else {
      return luma(240)
    }
  },
  align: horizon + center,
  [*Requisito*], [*Descrizione*], [*Classificazione*], [*Fonte*],
  [RV#context { Rid(RV) }],
  [Utilizzo del modulo LTM di BIG-IP per abilitare funzioni di bilanciamento delle risorse e monitoraggio dello stato],
  [M],
  [Progetto],

  [RV#context { Rid(RV) }],
  [Utilizzo del modulo ASM di BIG-IP per analizzare i pacchetti HTTP e HTTPS in modo tale da proteggere l'applicazione da attacchi],
  [M],
  [Progetto],

  [RV#context { Rid(RV) }],
  [Utilizzo di RSYSLOG per il server dedicato al tracciamento di tutti i log del WAF],
  [D],
  [Decisione personale],
)

