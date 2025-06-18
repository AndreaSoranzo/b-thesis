= Casi d'uso
== UC1 - Visualizza applicazione
#figure(
  image("../uc/uc1.svg", width: 90%),
  caption: [UC1 - Visualizza applicazione],
)
- *Attore primario:*
  - Utente ha accesso all'applicazione
- *Descrizione:*
  - L'utente può visualizzare e utilizzare l'applicazione normalmente
- *Precondizioni:*
  - L'utente ha accesso all'applicazione
  - Il server e il WAF sono operativi
- *Postcondizioni:*
  - L'utente è in grado di visiualizzare e utilizzare l'applicazione
- *Scenario principale:*
  - L'utente si collega ad all'applicazione
- *Estensioni:*
  - UC1.1 - Visualizza blocking page
  - UC1.2 - Visualizza captcha

=== UC1.1 - Visualizza blocking page
#figure(
  image("../uc/uc1.2.svg", width: 90%),
  caption: [UC1.1 - Visualizza blocking page],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*
- *Generalizzazioni:*

=== UC1.1.1 - Visualizza pagina html di errore
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

=== UC1.1.2 - Visualizza messaggio di errore
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*


== UC2 - Gestione e creazione visual server
#figure(
  image("../uc/uc2.svg", width: 90%),
  caption: [UC2 - Gestione e creazione visual server],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

=== UC2.1 - Gestione e creazione pools
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

=== UC2.2 - Definizione regole di protezione DoS
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

=== UC2.3 - Definizione regole di protezione a Bot
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

=== UC2.4 - Gestione e creazione policy
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

=== UC2.4 - Gestione e creazione policy
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.1 - Definizione di regole per data guard
#figure(
  image("../uc/uc2.4.1.svg", width: 90%),
  caption: [UC2.4.1 - Definizione di regole per data guard],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.1.1 - Rilevamento di carte di credito
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.1.2 - Rilevamento codice fiscale
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.2 - Gestione dei parametri url
#figure(
  image("../uc/uc2.4.2.svg", width: 90%),
  caption: [UC2.4.2 - Gestione dei parametri url],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.2.1 - Decisione tipo di valore
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.2.2 - Decisione lunghezza massima
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.2.3 - Decisione di meta caratteri permessi
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*


==== UC2.4.3 - Gestione url
#figure(
  image("../uc/uc2.4.3.svg", width: 90%),
  caption: [UC2.4.3 - Gestione url],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.3.1 - Gestione url permessi
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.3.2 - Gestione url non permessi
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.4 - Gestione delle sessioni utente
#figure(
  image("../uc/uc2.4.4.svg", width: 90%),
  caption: [UC2.4.4 - Gestione delle sessioni utente],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.4.1 - Definizione dei parametri di login e logout
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.4.2 - Definizione della condizione di successo
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.4.3 - Definizione url protetti di autenticazione
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.4.4 - Definizione url di login e logout
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.5 - Gestione richieste HTTP
#figure(
  image("../uc/uc2.4.5.svg", width: 90%),
  caption: [UC2.4.5 - Gestione richieste HTTP],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.5.1 - Definizione Header permessi
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.5.2 - Definizione di file permessi in upload
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.5.3 - Definizione regole per cookie
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.6 - Gestione regole per protezioni avanzate
#figure(
  image("../uc/uc2.4.6.svg", width: 90%),
  caption: [UC2.4.6 - Gestione regole per protezioni avanzate],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.6.1 - Gestione attacchi brute force
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.6.2 - Gestione attacchi SSRF
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

===== UC2.4.6.3 - Gestione attacchi CSRF
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.7 - Definizione di attack signatures
#figure(
  image("../uc/uc2.4.7.svg", width: 90%),
  caption: [UC2.4.7 - Definizione di attack signatures],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.8 - Configurazione IP Intelligence
#figure(
  image("../uc/uc2.4.8.svg", width: 90%),
  caption: [UC2.4.8 - Configurazione IP Intelligence],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.9 - Configurazione learning modes
#figure(
  image("../uc/uc2.4.9.svg", width: 90%),
  caption: [UC2.4.9 - Configurazione learning modes],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.10 - Definizione tecnologie applicazione
#figure(
  image("../uc/uc2.4.10.svg", width: 90%),
  caption: [UC2.4.10 - Definizione tecnologie applicazione],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.10 - Definizione tecnologie applicazione
#figure(
  image("../uc/uc2.4.10.svg", width: 90%),
  caption: [UC2.4.10 - Definizione tecnologie applicazione],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.11 - Importazione threat campaign
#figure(
  image("../uc/uc2.4.11.svg", width: 90%),
  caption: [UC2.4.11 - Importazione threat campaign],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

==== UC2.4.12 - Configurazione pagine di blocco
#figure(
  image("../uc/uc2.4.12.svg", width: 90%),
  caption: [UC2.4.12 - Configurazione pagine di blocco],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

== UC3 - Definizione profili di logging
#figure(
  image("../uc/uc3.svg", width: 90%),
  caption: [UC3 - Definizione profili di logging],
)
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*

=== UC3.1 - Collegamento al server syslog
- *Attore primario:*
- *Descrizione:*
- *Postcondizioni:*
- *Scenario principale:*
