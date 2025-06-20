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
  - L'admin può gestire e creare i virtual server F5, elementi fondamentali per analizzare e bilanciare tutto il traffico richiesto ai server interni che ospitano le applicazioni web
- *Precondizioni:*
  - Il servizio di BIG-IP LTM deve essere installato
- *Postcondizioni:*
  - Viene assegnato un nuovo virtual server al servizio BIG-IP LTM


=== UC2.1 - Gestione e creazione pools
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può gestire e creare pool di server. Questi raggruppamenti di server reali ricevono ed elaborano le richieste solo se non vengono bloccate dal WAF
- *Precondizioni:*
  - Il servizio di BIG-IP LTM deve essere installato
- *Postcondizioni:*
  - Viene creata una nuova pool di server


=== UC2.2 - Definizione regole di protezione DoS
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire regole di protezione contro gli attacchi DoS. Questo permette al WAF di rilevarli e mitigarli utilizzando modalità anch'esse configurate dall'amministratore
- *Precondizioni:*
  - Il servizio di BIG-IP ASM deve essere installato
- *Postcondizioni:*
  - Viene creata una nuova regola di protezione DoS


=== UC2.3 - Definizione regole di protezione a Bot
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire regole di protezione contro gli attacchi provenienti da Bot o Botnet. Questo permette al WAF di rilevarli e mitigarli utilizzando modalità anch'esse configurate dall'amministratore
- *Precondizioni:*
  - Il servizio di BIG-IP ASM deve essere installato
- *Postcondizioni:*
  - Viene creata una nuova regola di protezione per Bot e Botnet


=== UC2.4 - Gestione e creazione policy
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può gestire e creare policy di sicurezza da associare a un virtual server. Queste policy permettono di analizzare il traffico e definire regole specifiche per filtrare richieste sospette o illegali
- *Precondizioni:*
  - Il servizio di BIG-IP ASM deve essere installato
- *Postcondizioni:*
  - Viene creata una nuova policy


==== UC2.4.1 - Definizione di regole per data guard
#figure(
  image("../uc/uc2.4.1.svg", width: 90%),
  caption: [UC2.4.1 - Definizione di regole per data guard],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire regole di Data Guard che permettono al WAF di identificare e censurare automaticamente informazioni sensibili degli utenti all'interno delle
  risposte HTTP da parte del server. Questo impedisce a potenziali attaccanti di visualizzare tali dati
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - La policy possiede una regola per data guard


===== UC2.4.1.1 - Rilevamento di carte di credito
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può attivare la funzione per l'identificazione di numeri di carte di credito nelle risposte HTTP
- *Precondizioni:*
  - La funzione di rilevamento di carta di credito è disattivata
- *Postcondizioni:*
  - La funzione di rilevamento di carta di credito è attiva

===== UC2.4.1.2 - Rilevamento codice fiscale
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può attivare la funzione per l'identificazione di codici fiscali nelle risposte HTTP
- *Precondizioni:*
  - La funzione di rilevamento di codici fiscali è disattivata
- *Postcondizioni:*
  - La funzione di rilevamento di codici fiscali è attiva


==== UC2.4.2 - Gestione dei parametri url
#figure(
  image("../uc/uc2.4.2.svg", width: 90%),
  caption: [UC2.4.2 - Gestione dei parametri url],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può gestire e definire come i parametri URL devono essere strutturati in qualsiasi richiesta HTTP
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
  - Tutti i parametri URL sono permessi indipendentemente dalla loro struttura
- *Postcondizioni:*
  - La policy possiede le regole riguardanti la struttura dei parametri url


===== UC2.4.2.1 - Decisione tipo di valore
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può decidere che tipo di valore deve essere il parametro url nella richiesta HTTP
- *Precondizioni:*
  - Il tipo di valore è impostato su "qualsiasi"
- *Postcondizioni:*
  - Il tipo di valore è impostato su quello deciso dall'admin

===== UC2.4.2.2 - Decisione lunghezza massima
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può decidere la lunghezza massima del parametro url nella richiesta HTTP, per evitare attacchi di buffer overflow
- *Precondizioni:*
  - La lunghezza massima è impostata su "qualsiasi"
- *Postcondizioni:*
  - La lunghezza massima è impostata al valore deciso dall'admin


===== UC2.4.2.3 - Decisione di meta caratteri permessi
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può decidere quali meta caratteri sono permessi e quali no all'interno del valore di un input in una richiesta HTTP
- *Precondizioni:*
  - Nessun meta carattere è permesso
- *Postcondizioni:*
  - La configurazione decisa dall'admin viene applicata



==== UC2.4.3 - Gestione url
#figure(
  image("../uc/uc2.4.3.svg", width: 90%),
  caption: [UC2.4.3 - Gestione url],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può gestire e definire quali URL sono permessi e quali no, limitando così l'utente a un set ristretto di URL navigabili
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
  - Tutti gli URL sono navigabili
- *Postcondizioni:*
  - La policy possiede le regole riguardanti quali URL sono permessi e quali no


===== UC2.4.3.1 - Gestione url permessi
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire quali URL sono permessi
- *Precondizioni:*
  - Tutti gli URL sono permessi
- *Postcondizioni:*
  - Solo gli URL elencati dall'admin sono permessi


===== UC2.4.3.2 - Gestione url non permessi
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire quali URL non sono permessi
- *Precondizioni:*
  - Tutti gli URL sono permessi
- *Postcondizioni:*
  - Gli url elencati dall'admin non sono permessi


==== UC2.4.4 - Gestione delle sessioni utente
#figure(
  image("../uc/uc2.4.4.svg", width: 90%),
  caption: [UC2.4.4 - Gestione delle sessioni utente],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire e gestire regole e condizioni per impedire agli utenti di accedere a pagine che richiedono autenticazione, se non sono autenticati.
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - La policy possiede le regole e condizioni per identificare se un'utente risulta non autenticato


===== UC2.4.4.1 - Definizione della condizione di successo
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin deve definire la condizione di successo del login affinché il WAF possa riconoscere che l'accesso è avvenuto correttamente.
- *Precondizioni:*
  - Nessuna condizione definita, quindi tutti i tentativi di accesso falliscono
- *Postcondizioni:*
  - Vengono applicate le condizioni di successo definite dall'admin

===== UC2.4.4.2 - Definizione url protetti da autenticazione
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin deve definire gli URL che richiedono l'autenticazione dell'utente per essere accessibili.
- *Precondizioni:*
  - Nessun URL è definito
- *Postcondizioni:*
  - Vengono applicati dei controlli di sessione agli URL definiti


===== UC2.4.4.3 - Definizione url di login e logout
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin deve definire quali URL corrispondono alle pagine di login e logout
- *Precondizioni:*
  - Nessuna pagina è definita
- *Postcondizioni:*
  - Vengono definite gli URL di login e logout

====== UC2.4.4.3.1 - Definizione dei parametri di login
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire i parametri necessari per l'autenticazione dell'utente su un determinato URL
- *Precondizioni:*
  - Non esistono parametri di login definiti per l'URL
- *Postcondizioni:*
  - Vengono definiti i parametri di login per l'URL



==== UC2.4.5 - Gestione richieste HTTP
#figure(
  image("../uc/uc2.4.5.svg", width: 90%),
  caption: [UC2.4.5 - Gestione richieste HTTP],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può gestire e definire una serie di regole per individuare e filtrare le richieste HTTP sospette che potrebbero compromettere l'intero sistema o i dati degli utenti registrati
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - La policy possiede le regole per individuare richieste HTTP sospette


===== UC2.4.5.1 - Definizione Header permessi
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire gli header HTTP permessi in una richiesta
- *Precondizioni:*
  - La lista degli header permessi contiene solo "PUT","GET","POST"
- *Postcondizioni:*
  - Viene applicata la lista definita dall'admin


===== UC2.4.5.2 - Definizione di file permessi
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire i file permessi nelle richieste e risposte HTTP
- *Precondizioni:*
  - La lista è vuota
- *Postcondizioni:*
  - Viene applicata la lista definita dall'admin


===== UC2.4.5.3 - Definizione regole per cookie
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire regole da applicare ai cookie per prevenirne la manomissione e contrastare attacchi basati sulla loro alterazione.
- *Precondizioni:*
  - Non sono presenti regole
- *Postcondizioni:*
  - Vengono applicate le regole definite dall'admin

==== UC2.4.6 - Gestione attacchi brute force
#figure(
  image("../uc/uc2.4.6.svg", width: 90%),
  caption: [UC2.4.6 - Gestione regole per protezioni avanzate],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può gestire e creare regole per individuare e mitigare attacchi di tipo brute force
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - La policy possiede regole per individuare e mitigare attacchi di tipo brute force

==== UC2.4.7 - Gestione attacchi CSRF
#figure(
  image("../uc/uc2.4.7.svg", width: 90%),
  caption: [UC2.4.7 - Gestione attacchi CSRF],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può gestire e creare regole per individuare e mitigare attacchi di tipo CSFR
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - La policy possiede regole per individuare e mitigare attacchi di tipo CSFR

==== UC2.4.8 - Gestione attacchi SSRF
#figure(
  image("../uc/uc2.4.8.svg", width: 90%),
  caption: [UC2.4.8 - Gestione attacchi SSRF],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può gestire e creare regole per individuare e mitigare attacchi di tipo SSFR
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - La policy possiede regole per individuare e mitigare attacchi di tipo SSFR



==== UC2.4.9 - Definizione di attack signatures
#figure(
  image("../uc/uc2.4.9.svg", width: 90%),
  caption: [UC2.4.9 - Definizione di attack signatures],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire ulteriori attack signatures oltre a quelle già proposte dal modulo BIG-IP ASM
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - La policy possiede le attack signature definite dall'admin oltre a quelle già presenti di default


==== UC2.4.10 - Configurazione IP Intelligence
#figure(
  image("../uc/uc2.4.10.svg", width: 90%),
  caption: [UC2.4.10 - Configurazione IP Intelligence],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può abilitare e configurare il modulo IP Intelligence. Questo modulo utilizza un database remoto per determinare la reputazione di un indirizzo IP che effettua una richiesta HTTP, bloccando quelle provenienti da IP con reputazione negativa
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - Il modulo ti IP Intelligence viene attivato sulla policy selezionata


==== UC2.4.11 - Configurazione learning modes
#figure(
  image("../uc/uc2.4.11.svg", width: 90%),
  caption: [UC2.4.11 - Configurazione learning modes],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può configurare quali tipi di violazioni generano suggerimenti per ottimizzare le regole del WAF. Questo permette di ridurre i falsi positivi o aumentare il livello di protezione per specifiche richieste
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - Viene applicata la configurazione scelta dall'admin


==== UC2.4.12 - Definizione tecnologie applicazione
#figure(
  image("../uc/uc2.4.12.svg", width: 90%),
  caption: [UC2.4.12 - Definizione tecnologie applicazione],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può definire le tecnologie utilizzate dall'applicazione web. In questo modo, il WAF può comprendere gli attacchi più comuni specifici per quella tecnologia e proporre un set iniziale di regole sufficienti per mitigarli.
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - Vengono create delle attack signature inerenti alle tecnologie elencate
  - Viene aggiornato l'elenco delle tecnologie della policy


==== UC2.4.13 - Importazione threat campaign
#figure(
  image("../uc/uc2.4.13.svg", width: 90%),
  caption: [UC2.4.13 - Importazione threat campaign],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può importare uno o più file di threat campaign per fornire al WAF informazioni sugli attacchi più comuni o attualmente in uso.
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - Vengono generate delle attack signatures per mitigare gli attacchi elencati nei file di threat campaign


==== UC2.4.14 - Configurazione pagine di blocco
#figure(
  image("../uc/uc2.4.14.svg", width: 90%),
  caption: [UC2.4.14 - Configurazione pagine di blocco],
)
- *Attore primario:*
  - Admin del WAF F5
- *Descrizione:*
  - L'admin può personalizzare le pagine di blocco visualizzate dagli utenti quando una loro richiesta viene classificata come illegale dal WAF
- *Precondizioni:*
  - La policy alla quale si vuole assegnare queste regole deve essere presente
- *Postcondizioni:*
  - Vengono aggiornato lo stile delle pagine di blocco


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

