= Analisi tecnica e studio di F5 BIG-IP <ch3>
Durante le prime due settimane, ho consolidato e ampliato le mie competenze pregresse in materia di reti informatiche, dedicandomi in particolare al funzionamento dei
firewall e dei WAF, sottolineando anche le loro distinzioni. Ho iniziato con una panoramica generale sui firewall, per poi analizzare in dettaglio il modulo F5 BIG-IP ASM
e la sua funzione nel trasformare il software in un WAF. Questo percorso di studio è stato cruciale per acquisire le conoscenze teoriche e pratiche necessarie alla
realizzazione del progetto finale e alla loro futura applicazione in contesti produttivi.

#include "techs.typ"

== Formazione F5
La formazione relativa alla tecnologia F5 è stata condotta avvalendosi del libro digitale ufficiale @FDOC, fornito dall'azienda. Tale risorsa è stata concepita con una
progressione didattica che facilita l'apprendimento anche per utenti privi di precedenti esperienze con tecnologie analoghe come nel mio caso. Un elemento distintivo del
percorso è stata l'inclusione di esercitazioni pratiche al termine di ogni capitolo, volte a consentire l'immediata applicazione delle nozioni apprese.
Ulteriormente, sono stati integrati due mini-progetti, uno a metà e uno a conclusione del corso, i quali hanno svolto un ruolo cruciale nel riepilogo e nel
consolidamento delle nozioni acquisite.

=== Firewall VS WAF
Una distinzione fondamentale, delineata nei capitoli iniziali del volume, concerne la differenza tra un firewall di rete tradizionale e un WAF.
==== Firewall tradizionale
Un firewall di rete tradizionale è un dispositivo di sicurezza posizionato al perimetro di una rete, il cui ruolo primario è la protezione del confine di rete. Esso opera
ispezionando e filtrando il traffico in transito tra una rete esterna e una interna, separando così una zona protetta da una meno sicura. Tipicamente, un firewall di
questa categoria esamina principalmente gli header dei pacchetti, determinando l'autorizzazione al transito in base all'indirizzo IP sorgente e alla porta. Esistono
tuttavia versioni evolute che estendono tale funzionalità, includendo l'ispezione del payload dei pacchetti per identificare con maggiore accuratezza potenziali minacce.
Questo tipo di firewall operando a livello 3 e 4 del modello OSI (network layer e transport layer rispettivamente) dimostra l'efficacia nel rilevare attacchi che sfruttano
vulnerabilità di protocolli come DNS, FTP e SSH.
==== WAF
Un WAF, è un tipo di firewall specificamente progettato per proteggere singole applicazioni web e API.
A differenza di un firewall tradizionale, il WAF opera ispezionando il traffico di rete, ma si concentra esclusivamente sull'identificazione e sul blocco
di attacchi che sfruttano vulnerabilità intrinseche dell'applicazione o delle tecnologie impiegate per la sua realizzazione.
Il WAF opera a livello 7 del modello OSI (application layer), analizzando principalmente le richieste HTTP/HTTPS dirette alle applicazioni web.
L'obiettivo è rilevare tentativi di attacco comuni come XSS e SQL Injection. Inoltre, i WAF sono in grado di intercettare tentativi di furto di dati sensibili o
personali, bloccando tali richieste o notificando l'amministratore.
==== Differenze
#figure(image("../img/study/fvswaf.png", width: 90%), caption: [Firewall vs WAF @FVSWAF])
Le differenze tra i 2 tipi di firewall si possono esprimere in 2 punti:
- *Tipo di protezione:*
  - *WAF:* Protegge la singola applicazione
  - *Firewall tradizionale:* Protegge l'intera rete nel quale è installato filtrando i client esterni alla rete
- *OSI Layer:*
  - *WAF:* Lavora a layer 7, riuscendo a ispezionare potenziali attacchi basati su SQL e Javascript
  - *Firewall tradizionale:* Lavora a livello 3 e 4, proteggendo il trasferimento di pacchetti guardando IP e Porte

=== Modulo ASM
Considerando che l'obiettivo del progetto era principalmente la creazione e configurazione di un WAF, il libro @FDOC si concentrava sulla spiegazione di tutte le funzionalità
offerte dal modulo ASM di F5. Questo modulo, infatti, trasforma il software BIG-IP in un vero e proprio WAF, aggiungendo anche alcune funzionalità extra specifiche del
modulo stesso.
Di seguito, ho deciso di presentare le funzionalità più importanti, nonché quelle che ho utilizzato con maggiore frequenza durante la realizzazione del progetto.

==== Policy
#figure(image("../img/study/policy.png", width: 90%), caption: [Policy])
Il modulo ASM consente la creazione di una o più policy da assegnare a uno o più virtual server. In questo contesto, le policy sono semplicemente l'insieme di regole
definite dall'amministratore per filtrare le richieste che transitano attraverso il WAF.

Tra tutte le opzioni configurabili, le principali e più rilevanti sono:
- *Stato della policy:* La policy può assumere 2 stati differenti:
  - *Blocking:* Le regole della policy vengono applicate e, se rilevate come sospette o illegali, le richieste vengono bloccate.
  - *Trasparent:* Le regole della policy vengono applicate, ma nessuna richiesta viene bloccata, anche se illegale. Questo stato viene solitamente impostato manualmente e serve per eseguire i primi test e, successivamente, per eseguire del fine-tuning.
- *Definizione delle tecnologie:* Si definiscono tutte le tecnologie utilizzate dall'applicazione web, in modo da preparare il WAF a intercettare immediatamente le richieste che potrebbero sfruttare vulnerabilità dell'applicazione stessa.
- *Template:* È possibile configurare un WAF utilizzando i template predefiniti di F5, che offrono configurazioni quasi complete per facilitare e velocizzare il processo di creazione. Tali template richiedono comunque una fase iniziale di testing da parte dell'amministratore.
- *Staging e periodo di staging:* È possibile specificare se una policy debba andare in staging e, in tal caso, per quanto tempo manterrà tale stato.
  Lo staging è uno stato in cui una determinata regola o una policy non blocca alcuna richiesta, anche se illegale. Questo stato consente di testare
  le regole, preferibilmente analizzando il traffico di più utenti, per poi modificarle se necessario. Il periodo di staging definisce la durata di questo stato; al termine
  di tale periodo, la regola uscirà dallo staging e verrà applicato il suo stato operativo originale.

===== Learning mode
#figure(image("../img/study/learning.png", width: 90%), caption: [Learning page])
Quando una policy viene applicata a un virtual server, il WAF analizza il traffico e, basandosi sulle regole definite, tenta di apprendere la struttura delle richieste.
In particolare, per quelle categorizzate come illegali, il WAF suggerisce miglioramenti applicabili alle regole, con l'obiettivo di evitare blocchi inappropriati e
minimizzare i falsi positivi. Spetta poi all'amministratore decidere se implementare tali suggerimenti o ignorarli, qualora non li ritenga affidabili o utili al
raggiungimento dell'obiettivo.
Questo processo di apprendimento continuo da parte del WAF è denominato Learning Mode. È possibile configurare quali tipi di richieste illegali debbano attivare questa
modalità tramite il pannello delle Learning and Blocking Settings aggiungendo o rimuovendo la spunta dalla casella contrassegnata con la label "learn".
#figure(image("../img/study/learning-blocking.png", width: 90%), caption: [Learning and Blocking Settings])
Questo pannello mostra tutti i tipi di richieste categorizzate come illegali dal WAF. Oltre a modificare l'opzione di "learn", come spiegato in precedenza, puoi anche
configurare le opzioni di "block" e "alarm".
L'opzione "block" impedisce che la richiesta illegale venga inoltrata al server reale, bloccandola. L'opzione "alarm", invece, fa sì che la richiesta venga registrata nei
log a disposizione dell'amministratore, permettendo di visualizzare tutte le informazioni ad essa associate.

===== Attack signatures
#figure(image("../img/study/att-sig.png", width: 90%), caption: [Attack signatures])
Le attack signatures costituiscono la sezione più cruciale e frequentemente impiegata del modulo ASM. Come suggerisce il nome, si tratta di firme di attacco, ovvero
specifici pattern rilevati nel payload di una richiesta, che vengono riconosciuti come potenziale attacco e, di conseguenza, bloccati in via precauzionale dal WAF.
Queste firme variano in natura in base al tipo di attacco e alla tecnologia coinvolta; ad esempio, firme per XSS potrebbero includere comandi
JavaScript, quelle per SQL Injection conterranno comandi SQL, mentre quelle per attacchi di Path Traversal dovranno controllare se venga richiesto di accedere a file o
cartelle specifiche.
Al momento dell'installazione, il modulo ASM importa una vasta gamma di firme predefinite, che coprono le tecnologie più diffuse e le relative vulnerabilità, assicurando una
protezione di base per l'applicazione. L'amministratore ha inoltre la facoltà e il dovere di creare firme personalizzate per mitigare ulteriormente lo sfruttamento di
vulnerabilità specifiche.
Anche le attack signatures, analogamente alle policy, possono essere configurate nello stato di staging per un periodo definito e sono anch'esse soggette al Learning Mode
quando attivo. Infatti, durante la creazione di una firma, è obbligatorio specificare due parametri che aiutano il WAF a formulare suggerimenti:
- *Accuracy:* Indica l'abilità della firma di rilevare l'attacco, considerando anche la possibilità di un falso positivo.
- *Risk:* Indica il potenziale danno che quel tipo di attacco potrebbe comportare.
Entrambi i parametri presentano tre livelli ("high", "medium", "low"). In base a questi livelli, il WAF suggerirà possibili modifiche da apportare alla firma quando
una richiesta viene segnalata.
Infine, l'amministratore può raggruppare le firme in set, a seconda della loro natura, per mantenerle organizzate.

===== Data Guard
#figure(image("../img/study/data-guard.png", width: 90%), caption: [Data Guard])
In molte applicazioni, è comune che sia nelle richieste sia, soprattutto, nelle risposte del server, siano presenti dati sensibili come codici fiscali o numeri di carte
di credito.
Data Guard è una funzionalità ormai quasi essenziale che consente di identificare questi dati e mascherarli efficacemente. Questo assicura che né l'amministratore né un
potenziale attaccante che intercetta le risposte possano visualizzarli in chiaro. Per raggiungere questo obiettivo, Data Guard analizza gli header delle comunicazioni e
cerca corrispondenze con i pattern o le espressioni regolari specificate dall'amministratore in fase di configurazione.
È anche possibile configurare Data Guard per analizzare il tipo di file fornito in risposta, consentendo di limitare o gestire specifici formati di file che potrebbero
contenere dati sensibili al loro interno.

===== Parametri
#figure(image("../img/study/parameters.png", width: 90%), caption: [Configurazione Parametri])
I parametri, essendo componenti chiave delle richieste web, necessitano di protezione per prevenire attacchi che potrebbero compromettere la privacy degli utenti e, in
alcuni casi, l'intera applicazione.
Per affrontare questa esigenza, il modulo ASM consente di definire e configurare i parametri specificando un insieme di regole. Queste regole stabiliscono i criteri che
il parametro inviato dal client deve rispettare affinché la richiesta sia inoltrata al server reale. È possibile definire il tipo di parametro, il tipo di valore
accettato e la sua lunghezza massima e minima, affinando così la validazione dei valori e prevenendo attacchi.
La configurazione dei parametri include anche la gestione dei meta-caratteri permessi e negati, un ulteriore livello di difesa contro specifici tipi di attacchi.
Per facilitare la configurazione dei parametri, esistono tre modalità di apprendimento:
- *Never:* In questa modalità, il WAF non fornisce alcun suggerimento. Spetta all'amministratore aggiungere manualmente tutti i parametri ai quali desidera applicare regole specifiche.
- *Compact:* Il WAF suggerisce di applicare regole e di aggiungere solo i parametri che sono più frequentemente utilizzati dall'applicazione.
- *Always:* Il WAF propone di applicare regole e di aggiungere tutti i parametri che vengono rilevati durante l'analisi del traffico.

===== Header
#figure(image("../img/study/headers.png", width: 90%), caption: [Configurazione Headers])
Un'altra funzione importante riguarda la configurazione degli header HTTP/HTTPS e la definizione dei metodi di richiesta consentiti. È fondamentale prestare particolare
attenzione ai metodi utilizzati, poiché alcuni di essi, seppur non intrinsecamente vulnerabili, potrebbero essere sfruttati per compromettere lo stato interno dei dati,
consentire ad un attaccante di ottenere informazioni private (anche di amministratori) o addirittura permettere il pieno controllo dell'applicazione.
Per mitigare questi rischi, è possibile specificare quali metodi HTTP sono consentiti per una determinata richiesta, limitando così le operazioni che un utente può
eseguire.
Vengono considerati metodi sicuri:
- GET
- HEAD
- OPTIONS
Questi metodi sono ritenuti sicuri perché non alterano la struttura o lo stato del server.
Al contrario, i metodi considerati rischiosi o meno sicuri includono:
- PUT
- POST
- DELETE
A differenza di quelli sicuri, questi metodi possono modificare lo stato del server e, di conseguenza, potrebbero potenzialmente comprometterlo.
È importante sottolineare che, se un'applicazione richiede l'uso di un metodo rischioso, spetta al team di sviluppatori garantirne la validità tramite validazioni,
sanificazioni e controlli specifici.

===== Cookie
#figure(image("../img/study/cookie.png", width: 90%), caption: [Configurazione Cookie])
Le applicazioni web fanno ampio uso dei cookie per memorizzare informazioni e riutilizzarle in future operazioni. Un esempio classico è l'autenticazione utente: per
evitare di richiedere le credenziali ad ogni accesso, si utilizza un cookie di sessione che autentica automaticamente l'utente se effettua un altro accesso al sito entro
un certo intervallo di tempo.
Tuttavia, i cookie sono vulnerabili a modifiche malevole durante le richieste. Ad esempio, un utente malintenzionato potrebbe sostituire il proprio cookie di
autenticazione con quello di un altro utente per ottenere accesso non autorizzato, oppure tentare attacchi di tipo CSRF.
Per contrastare queste minacce, F5 offre una soluzione che rende la modifica dei cookie estremamente difficile, se non impossibile, durante una richiesta. Internamente,
il WAF lega ad ogni cookie un cookie aggiuntivo, proprietario, contenente un token/hash (generato tramite un algoritmo proprietario F5) del cookie originale da
proteggere.
Se il cookie protetto viene modificato e l'hash non corrisponde, viene rilevata un'illegalità e la richiesta viene bloccata. Lo stesso accade se viene modificato l'hash
stesso.

===== Sessioni
#figure(image("../img/study/session.png", width: 90%), caption: [Configurazione sessioni])
Oltre alla protezione dei cookie, è possibile migliorare la sicurezza delle sessioni configurando le pagine di autorizzazione. Questo implica specificare il metodo di
autenticazione richiesto agli utenti, che può avvenire tramite un classico form HTML con email e password, un form AJAX o altre modalità. Successivamente, si definiscono
tutte le pagine che necessitano di autenticazione per essere accessibili.
In questo modo, se un utente tenta di accedere a una pagina protetta senza essere passato preventivamente dalla pagina di autenticazione specificata, il WAF rileva
l'anomalia e blocca la richiesta. Per tracciare la sessione e verificare lo stato di autenticazione dell'utente, anche in questo caso il WAF genera e utilizza un
cookie contenente un token.

===== Profili di logging
#figure(image("../img/study/logs.png", width: 90%), caption: [Configurazione profili di logging])
Il WAF fornisce all'amministratore log dettagliati di tutte le richieste client, rendendole ispezionabili e tracciabili per rilevare eventuali anomalie. Questi log
includono sia le richieste accettate, sia quelle considerate sospette o illegali, sia quelle bloccate dal WAF.
Per impostazione predefinita, tutte le richieste vengono loggate. Tuttavia, l'amministratore ha la flessibilità di creare nuovi profili di logging personalizzati. Ad
esempio, è possibile configurare il WAF per loggare solo le richieste sospette o bloccate, o anche includere le risposte del server.
Una delle funzionalità più importanti è la reindirizzazione dei log. L'amministratore può scegliere se mantenere i log in locale, sulla stessa macchina del WAF, oppure
inoltrarli a un server esterno dedicato che utilizza la tecnologia syslog. Optare per un server esterno offre il vantaggio di liberare memoria sulla macchina del WAF e
permette all'amministratore di selezionare specifici elementi da loggare, come URL, tipo di violazione, metodo HTTP, indirizzo IP, e altro ancora.
All'interno dello stesso profilo, oltre alla configurazione dei log standard, è possibile personalizzare anche i log relativi agli attacchi DoS e Bot, per un monitoraggio
ancora più mirato.

==== DoS Detection
#figure(image("../img/study/dos.png", width: 90%), caption: [Configurazione rilevamento DoS])
La protezione dei server da attacchi DoS è cruciale per garantirne la disponibilità e la continuità operativa. Tali attacchi mirano a sovraccaricare le risorse del server,
impedendone l'accesso e l'utilizzo agli utenti legittimi per un determinato periodo. I WAF F5 rappresentano una soluzione fondamentale per mitigare questa minaccia,
attraverso una configurazione che prevede il rilevamento degli attacchi e l'applicazione di misure di mitigazione specifiche.
Esistono principalmente due tipologie di rilevamento configurabili:
- *Attacchi basati su TPS:* Questa metodologia si concentra sull'identificazione di un elevato volume di richieste in un intervallo di tempo predefinito. Se il numero di richieste supera una soglia configurata entro un determinato lasso di tempo, il traffico viene classificato come potenziale attacco.
- *Attacchi basati sull'attività:* Questa tipologia di attacco si basa sull'invio di richieste che, sebbene non necessariamente elevate in numero, richiedono un consumo significativo di risorse del server e tempi di risposta prolungati. Il WAF monitora l'impatto delle richieste sulle risorse del server per identificare attività anomale indicative di un tentativo di esaurimento delle risorse.
Una volta rilevato un attacco DoS, il WAF applica una delle seguenti strategie di mitigazione, scelte dall'amministratore, per neutralizzare la minaccia e ripristinare la
normale operatività del server:
- *Blocco delle Richieste:* Questa è la misura più diretta, che consiste nel bloccare le richieste provenienti dalla fonte identificata come origine dell'attacco.
- *CAPTCHA:* Per distinguere tra traffico legittimo e malevolo (spesso generato da bot), il WAF può richiedere la risoluzione di un test CAPTCHA agli utenti sospetti. Solo dopo aver superato questa verifica, le richieste vengono autorizzate a procedere.
- *Browser Testing:* Questo metodo prevede che il server invii al client una richiesta per eseguire del codice JavaScript. L'esecuzione riuscita di tale codice attesta che la richiesta proviene da un browser web legittimo e non da un bot automatizzato, consentendo al WAF di filtrare il traffico indesiderato.

==== BoT Protection
#figure(image("../img/study/bot.png", width: 90%), caption: [Configurazione rilevamento bot])
Negli ultimi anni, l'incremento nell'utilizzo dei bot, in particolare quelli dedicati al web scraping, ha evidenziato nuove sfide per la sicurezza informatica. Mentre
alcuni bot possono svolgere funzioni legittime, un numero crescente viene impiegato per attività dannose, come il furto di dati sensibili o informazioni di mercato.
Queste informazioni vengono spesso riportate su siti esterni, consentendo ai concorrenti di mantenere un vantaggio sleale. Altri bot, invece, possono essere orchestrati
per sferrare attacchi più complessi, fungendo da "agenti" per attacchi DoS distribuiti, il furto di credenziali o l'esecuzione di richieste mirate
volte a prendere il controllo della vittima.
Per contrastare queste minacce, il WAF F5 offre funzionalità avanzate per la protezione dai bot.
Permette di configurare regole specifiche che definiscono le azioni da intraprendere quando viene rilevato un bot sospetto o malevolo.
Per garantire un'efficace protezione, il WAF si connette a servizi esterni (ad esempio, quelli forniti da F5) e aggiorna il proprio database di bot noti e sospetti ogni
10 minuti. Questo costante aggiornamento permette al WAF di identificare rapidamente le nuove minacce e di adattare le proprie difese.
Infine, il WAF consente di definire un periodo di "detenzione" basato sull'indirizzo IP o sul Device ID (l'identificativo unico del dispositivo che ha generato la
richiesta). Questo significa che, se una determinata fonte viene identificata come malevola, l'amministratore può configurare il WAF per rallentare o bloccare
definitivamente le richieste provenienti da quella specifica origine per un lasso di tempo predefinito.

=== OWASP Top 10 2021
L'organizzazione OWASP svolge annualmente un ruolo cruciale nella sicurezza informatica, analizzando le applicazioni web pubbliche per identificare e classificare le
dieci vulnerabilità più comuni e critiche.
#figure(image("../img/study/owasp-map.png", width: 90%), caption: [OWASP changelog])
Questo report, noto come OWASP Top 10, rappresenta un riferimento fondamentale per l'industria del software, fornendo alle
aziende un aggiornamento costante sulle principali minacce. La sua finalità è quella di sensibilizzare gli sviluppatori, incoraggiandoli a integrare pratiche di sicurezza
che limitino l'esposizione a tali rischi.
Per la realizzazione di questo progetto, è stata adottata come riferimento la versione del 2021 della OWASP Top 10.
#figure(image("../img/study/owasp.png", width: 70%), caption: [OWASP top 10 2021])
Tale scelta è stata motivata dalla solidità della
documentazione disponibile e dalla sua rilevanza, in quanto le vulnerabilità principali non hanno subito variazioni sostanziali rispetto alle versioni più recenti. L
decisione è stata presa in accordo con il tutor aziendale, al fine di mantenere la coerenza con la bibliografia @FDOC e le linee guida del progetto.
Il WAF sviluppato è quindi specificatamente progettato per riconoscere e bloccare le tipologie di attacco associate a tali vulnerabilità, contribuendo in modo
significativo a rafforzare la postura di sicurezza delle applicazioni web.
Di seguito è presentata una panoramica delle vulnerabilità identificate nella OWASP Top 10 2021, con riferimento alla documentazione pubblicata sul sito ufficiale @TOP10.

==== A01:2021 - Broken Access Control
La vulnerabilità in esame concerne il controllo degli accessi, ovvero la capacità degli utenti di eseguire azioni che eccedono le loro autorizzazioni definite.
La carenza o la non corretta implementazione di questi meccanismi di controllo può condurre a serie ripercussioni, tra cui la divulgazione, l'alterazione o la cancellazione
non autorizzata di informazioni, e l'esecuzione di operazioni che superano i limiti di competenza dell'utente.
Le vulnerabilità di questo tipo più comuni sono:
- Accesso ad API private
- Accesso a pagine senza autenticazione
- Manipolazione di account altrui

==== A02:2021 - Cryptographic Failures
Questa vulnerabilità concerne la protezione dei dati sensibili sia durante il loro transito,tra il client e il server, che nella loro conservazione.
Dati particolarmente sensibili, quali password, dettagli di carte di credito, registrazioni sanitarie, informazioni personali e segreti aziendali, impongono l'adozione di
protezioni supplementari. Ciò assume maggiore rilevanza quando tali dati sono disciplinati da normative sulla privacy, come il Regolamento GDPR dell'Unione Europea, o da
standard regolamentari specifici, quali il PCI DSS per la sicurezza dei dati finanziari.

==== A03:2021 - Injection
Le vulnerabilità di tipo Injection sono strettamente connesse ai linguaggi di programmazione impiegati nello sviluppo delle applicazioni moderne. Questa tipologia di
attacco spesso consente l'esecuzione di codice non autorizzato sul server, potendo potenzialmente comprometterne lo stato e la sicurezza.
Tra le forme più diffuse di iniezione si annoverano le SQL Injection, NoSQL Injection e l'OS Command Injection.
Per l'identificazione di queste vulnerabilità, la revisione del codice sorgente rappresenta la metodologia più efficace. È inoltre vivamente raccomandata
l'implementazione di test automatizzati che coprano tutti i parametri, gli header, gli URL, i cookie e gli input di dati (come JSON, SOAP e XML).
Un'applicazione è considerata vulnerabile agli attacchi di Injection quando:
- I dati forniti dall'utente non sono adeguatamente validati o filtrati.
- I comandi di query vengono accettati anche in presenza di strutture sospette.

==== A04:2021 - Insecure Design
La progettazione insicura (Insecure Design) è una categoria ampia che racchiude diverse vulnerabilità, definite come "mancanza o inefficacia nella progettazione dei
controlli di sicurezza".
È fondamentale distinguere tra progettazione insicura e implementazione insicura, poiché queste presentano radici e soluzioni diverse. Un design sicuro può comunque
contenere difetti di implementazione che portano a vulnerabilità sfruttabili. Tuttavia, una progettazione intrinsecamente insicura non può essere corretta da
un'implementazione perfetta, in quanto i controlli di sicurezza necessari per difendersi da attacchi specifici non sono mai stati previsti. Uno dei fattori che
contribuiscono a una progettazione insicura è la carenza nella profilazione del rischio aziendale inerente al software o al sistema in fase di sviluppo, che si traduce
nell'incapacità di determinare il livello di sicurezza richiesto.

==== A05:2021 - Security Misconfiguration
La vulnerabilità in questione è una categoria ampia che include debolezze derivanti da impostazioni di sicurezza assenti, incomplete o inappropriate a livello di
applicazione o del suo ambiente di deployment. Nonostante non sia un difetto nel codice sorgente, essa riflette un'implementazione non ottimale o trascurata delle
configurazioni di sicurezza attraverso i vari livelli dello stack tecnologico.
L'applicazione viene considerata vulnerabile se:
- Non vengono applicate le configurazioni di sicurezza raccomandate su server, database, framework, librerie o servizi cloud.
- Vengono lasciate attive o installate funzionalità, porte, servizi, pagine o account che non sono essenziali per il funzionamento dell'applicazione in ambiente di produzione.
- L'applicazione rivela informazioni sensibili (es. stack trace, versioni del software, percorsi di file) tramite messaggi di errore verbosi.
- Il server non invia o configura correttamente gli header HTTP di sicurezza.

==== A06:2021 - Vulnerable and Outdated Components
Questo tipo di vulnerabilità si concentra sui rischi derivanti dall'impiego di componenti software che presentano vulnerabilità note o che non ricevono più un supporto attivo dagli sviluppatori.
Nell'attuale panorama delle applicazioni moderne, che sono quasi interamente assemblate mediante librerie, framework e moduli di terze parti (sia open source che commerciali),
questa problematica costituisce una minaccia in crescente aumento.
Infatti l'applicazione viene considerata vulnerabile se:
- Non è disponibile un inventario chiaro delle versioni dei componenti in uso.
- Non vengono effettuate scansioni periodiche per la rilevazione di vulnerabilità.
- Non vengono eseguiti test di compatibilità tra i componenti e l'applicazione.
- Si utilizzano librerie o moduli provenienti da fonti non affidabili.

==== A07:2021 - Identification and Authentication Failures
Ci si concentra su tutte quelle vulnerabilità legate alla gestione dell'identità, all'autenticazione degli utenti e alla gestione delle sessioni.
Queste falle permettono agli attaccanti di compromettere password, chiavi, token di sessione o di sfruttare debolezze nei meccanismi di identificazione per assumere l'identità di altri utenti.
Tali vulnerabilità possono manifestarsi se:
- Non è implementato un metodo di autenticazione a più fattori.
- Viene impiegato un metodo di cifratura o hash debole per le password.
- Viene riutilizzato il medesimo token di sessione senza adeguata invalidazione o rigenerazione.
- L'applicazione consente l'utilizzo di password deboli.
- Vengono impiegati metodi di recupero delle credenziali insicuri o deboli.

==== A08:2021 - Software and Data Integrity Failures
Ci si riferisce a difetti nel codice e nell'infrastruttura che non riescono a proteggere l'integrità dei dati e del software.
Un esempio lampante si verifica quando un'applicazione dipende da plugin, librerie o moduli provenienti da fonti e repository non affidabili.
Un altro scenario critico è dato da una pipeline CI/CD (Continuous Integration/Continuous Delivery) insicura, la quale può introdurre il rischio di accessi non autorizzati, codice malevolo o
compromissione del sistema.
Inoltre, molte applicazioni odierne dispongono di funzionalità di aggiornamento automatico, dove gli update vengono scaricati e applicati a un'applicazione precedentemente fidata senza un'adeguata
verifica dell'integrità. Questo apre la strada a potenziali attacchi in cui malintenzionati potrebbero
caricare i propri aggiornamenti dannosi per distribuirli ed eseguirli su tutte le installazioni.

==== A09:2021 - Security Logging and Monitoring Failures
E' una vulnerabilità che riguarda l'assenza o l'inefficacia dei sistemi di logging e monitoraggio a livello infrastrutturale e di rete,
inclusi server, firewall e altri dispositivi di sicurezza, e non primariamente l'applicazione stessa.
Questa si manifesta quando tali sistemi sono assenti, inadeguati o inefficaci, compromettendo la capacità di rilevare, gestire e rispondere prontamente a incidenti di sicurezza.
Di conseguenza, l'assenza di un'efficace registrazione e monitoraggio può permettere alle violazioni di perdurare inosservate per tempi estesi, amplificando il potenziale impatto negativo.

==== A10:2021 - Server-Side Request Forgery
È un tipo di attacco che sfrutta una vulnerabilità specifica: si verifica ogni volta che un'applicazione web recupera una risorsa remota senza convalidare
adeguatamente l'URL fornito dall'utente. Questo consente a un attaccante di forzare l'applicazione a inviare una richiesta manipolata verso una destinazione inattesa,
anche se protetta da firewall, VPN o altre liste di accesso di rete.
Nel panorama attuale delle applicazioni web, l'incremento delle funzionalità utente che implicano il recupero di risorse remote ha reso lo scenario SSRF sempre più
comune. Ciò ha determinato un aumento dell'incidenza di questa vulnerabilità e del relativo tipo di attacco.

#include "arch.typ"
