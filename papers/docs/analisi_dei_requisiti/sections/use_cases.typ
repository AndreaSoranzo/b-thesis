= Casi d'uso
== UC1 - Visualizza applicazione
#figure(
  image("../uc/uc1.svg", width: 90%),
  caption: [UC1 - Visualizza applicazione],
)
- *Attore primario:*
  - Utente che ha accesso all'applicazione
- *Descrizione:*
  - L'utente può visualizzare e utilizzare l'applicazione normalmente
- *Precondizioni:*
  - L'utente ha accesso all'applicazione
  - Il server e il WAF sono operativi
- *Postcondizioni:*
  - L'utente è in grado di visualizzare e utilizzare l'applicazione
- *Estensioni:*
  - UC1.1 - Visualizza blocking page
  - UC1.2 - Visualizza captcha

=== UC1.1 - Visualizza blocking page
#figure(
  image("../uc/uc1.1.svg", width: 90%),
  caption: [UC1.1 - Visualizza blocking page],
)
- *Attore primario:*
  - Utente che ha accesso all'applicazione
- *Descrizione:*
  - Se un utente tenta di effettuare una richiesta HTTP che risulta sospetta o illegale (es. accesso a risorse proibite o inserimento di attacchi web),
    verra visualizzata la pagina di blocco impostata dall'admin del firewall.
- *Precondizioni:*
  - L'utente ha effettuato una richiesta HTTP al server
- *Postcondizioni:*
  - La richiesta non viene mandata al server
  - L'utente visualizza la pagina di blocco
- *Generalizzazioni:*
  - 1.1.1 - Visualizza pagina html di errore
  - 1.1.2 - Visualizza messaggio di errore

==== UC1.1.1 - Visualizza pagina html di errore
- *Attore primario:*
  - Utente che ha accesso all'applicazione
- *Descrizione:*
  - L' utente dopo aver eseguito una richiesta HTTP sospetta o illegale viene reinderizzato ad una pagina html di errore
- *Precondizioni:*
  - L'utente ha effettuato una richiesta HTTP al server
- *Postcondizioni:*
  - L'utente reinderizzato ad una nuova pagina


==== UC1.1.2 - Visualizza messaggio di errore
- *Attore primario:*
  - Utente che ha accesso all'applicazione
- *Descrizione:*
  - L' utente dopo aver eseguito una richiesta HTTP sospetta o illegale visualizza sulla stessa pagina una finestra di errore
- *Precondizioni:*
  - L'utente ha effettuato una richiesta HTTP al server
- *Postcondizioni:*
  - L'utente visualizza il messaggio di errore

=== UC1.2 - Visualizza captcha

- *Attore primario:*
  - Utente che ha accesso all'applicazione
- *Descrizione:*
  - Se il sistema rileva un potenziale attacco di tipo DoS o un'attività sospetta riconducibile a una botnet, viene presentata la pagina di test
    captcha per bloccare le richieste malevole, poiché bot automatizzati difficilmente riusciranno a completarlo.
- *Precondizioni:*
  - Vengono rilevate molte richieste in periodi ti tempo previ dallo stesso sorgente o da user agent sospetti
- *Postcondizioni:*
  - Viene presentata la paginda di test captcha


== UC2 - Gestione e creazione visual server
#figure(
  image("../uc/uc2.svg", width: 90%),
  caption: [UC2 - Gestione e creazione visual server],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


=== UC2.1 - Gestione e creazione pools
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


=== UC2.2 - Definizione regole di protezione DoS
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


=== UC2.3 - Definizione regole di protezione a Bot
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


=== UC2.4 - Gestione e creazione policy
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


=== UC2.4 - Gestione e creazione policy
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.1 - Definizione di regole per data guard
#figure(
  image("../uc/uc2.4.1.svg", width: 90%),
  caption: [UC2.4.1 - Definizione di regole per data guard],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.1.1 - Rilevamento di carte di credito
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.1.2 - Rilevamento codice fiscale
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.2 - Gestione dei parametri url
#figure(
  image("../uc/uc2.4.2.svg", width: 90%),
  caption: [UC2.4.2 - Gestione dei parametri url],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.2.1 - Decisione tipo di valore
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.2.2 - Decisione lunghezza massima
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.2.3 - Decisione di meta caratteri permessi
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*



==== UC2.4.3 - Gestione url
#figure(
  image("../uc/uc2.4.3.svg", width: 90%),
  caption: [UC2.4.3 - Gestione url],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.3.1 - Gestione url permessi
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.3.2 - Gestione url non permessi
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.4 - Gestione delle sessioni utente
#figure(
  image("../uc/uc2.4.4.svg", width: 90%),
  caption: [UC2.4.4 - Gestione delle sessioni utente],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.4.1 - Definizione dei parametri di login e logout
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.4.2 - Definizione della condizione di successo
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.4.3 - Definizione url protetti di autenticazione
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.4.4 - Definizione url di login e logout
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.5 - Gestione richieste HTTP
#figure(
  image("../uc/uc2.4.5.svg", width: 90%),
  caption: [UC2.4.5 - Gestione richieste HTTP],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.5.1 - Definizione Header permessi
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.5.2 - Definizione di file permessi in upload
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.5.3 - Definizione regole per cookie
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.6 - Gestione regole per protezioni avanzate
#figure(
  image("../uc/uc2.4.6.svg", width: 90%),
  caption: [UC2.4.6 - Gestione regole per protezioni avanzate],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.6.1 - Gestione attacchi brute force
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.6.2 - Gestione attacchi SSRF
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


===== UC2.4.6.3 - Gestione attacchi CSRF
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.7 - Definizione di attack signatures
#figure(
  image("../uc/uc2.4.7.svg", width: 90%),
  caption: [UC2.4.7 - Definizione di attack signatures],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.8 - Configurazione IP Intelligence
#figure(
  image("../uc/uc2.4.8.svg", width: 90%),
  caption: [UC2.4.8 - Configurazione IP Intelligence],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.9 - Configurazione learning modes
#figure(
  image("../uc/uc2.4.9.svg", width: 90%),
  caption: [UC2.4.9 - Configurazione learning modes],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.10 - Definizione tecnologie applicazione
#figure(
  image("../uc/uc2.4.10.svg", width: 90%),
  caption: [UC2.4.10 - Definizione tecnologie applicazione],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.10 - Definizione tecnologie applicazione
#figure(
  image("../uc/uc2.4.10.svg", width: 90%),
  caption: [UC2.4.10 - Definizione tecnologie applicazione],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.11 - Importazione threat campaign
#figure(
  image("../uc/uc2.4.11.svg", width: 90%),
  caption: [UC2.4.11 - Importazione threat campaign],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


==== UC2.4.12 - Configurazione pagine di blocco
#figure(
  image("../uc/uc2.4.12.svg", width: 90%),
  caption: [UC2.4.12 - Configurazione pagine di blocco],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
- *Precondizioni:*
- *Postcondizioni:*


== UC3 - Definizione profili di logging
#figure(
  image("../uc/uc3.svg", width: 90%),
  caption: [UC3 - Definizione profili di logging],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin ha la possibilità di creare profili e configurazioni personalizzate per la gestione e l'archiviazione di tutti i log generati dal firewall
- *Precondizioni:*
  - L'amministratore desidera creare profili personalizzati per ottimizzarne l'organizzazione
- *Postcondizioni:*
  - Il profilo di logging viene applicato al firewall


=== UC3.1 - Collegamento al server syslog
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin ha la possibilità di archiviare tutti i log generati in un server esterno per diminuire il carico e l'utilizzo della memoria utilizzata dal WAF
- *Precondizioni:*
  - L'amministratore intende minimizzare il carico del firewall spostando l'archiviazione dei dati su un server esterno
- *Postcondizioni:*
  - Il server esterno riceve i log impostati dall'admin tramite il profilo di logging

