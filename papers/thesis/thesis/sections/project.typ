= Implementazione WAF <ch7>
== Creazione macchine virtuali
La fase iniziale del progetto ha richiesto la creazione di un ambiente di laboratorio isolato, composto da nuove macchine virtuali.
Questa scelta è stata motivata dalla necessità di evitare conflitti con le configurazioni preesistenti utilizzate durante il periodo di formazione, che avrebbero potuto
compromettere la stabilità e la coerenza del nuovo setup.
Per garantire un'esecuzione ottimale e una gestione efficiente delle risorse, sono state create quattro macchine virtuali, ciascuna con un ruolo specifico:
- *Client:* Per questa macchina, è stata selezionata la distribuzione Linux Lubuntu. La scelta è caduta su questa versione leggera di Ubuntu per la sua ridotta richiesta di risorse, che si è rivelata ideale per l'hardware con prestazioni limitate fornito dall'azienda.
- *Linux server:* Questo server ospita l'applicazione web NodeGoat, eseguita come immagine Docker. L'utilizzo di quest'ultimo ha permesso di semplificare notevolmente l'installazione e la gestione delle dipendenze, garantendo un ambiente standardizzato e facilmente replicabile.
- *Server F5 (WAF):* Anche la macchina virtuale F5 è stata ricreata da zero per le stesse ragioni di pulizia e organizzazione, assicurando che le sue configurazioni non fossero influenzate da setup precedenti.
- *Syslog server:* È stato dedicato un server specifico per la raccolta dei log. Utilizzando il servizio rsyslog, questa macchina ha il compito di centralizzare e archiviare tutti i log generati dal WAF, facilitando l'analisi e il monitoraggio delle attività.
Per completare la configurazione dell'infrastruttura di rete, sono state create diverse sottoreti con i relativi indirizzi IP.
Quindi riassumendo, il Client è stato collegato alla rete esterna, a quella di gestione per le operazioni amministrative e alla NAT per l'accesso a Internet. Il Linux Server,
invece, è stato connesso alla rete interna e alla NAT per lo stesso motivo. Il server F5 è stato collegato alla rete di gestione per permetterne la configurazione da
parte degli amministratori, alla rete interna, a quella esterna e alla NAT per ricevere gli aggiornamenti. Infine, il Server syslog è stato posizionato sulla rete di
gestione per garantirne l'accessibilità solo agli amministratori e non dall'esterno.

== Configurazione iniziale F5
Ho deciso di eseguire un'analisi delle vulnerabilità dell'applicazione web prima di procedere con la configurazione del WAF. A tale scopo, ho ripreso gli attacchi
studiati in precedenza e ho cercato di replicarli ovunque fosse possibile. In alcuni casi, ho anche analizzato il codice sorgente, che ho recuperato dalla pagina
ufficiale di GitHub.
Successivamente, dopo aver avviato la nuova immagine di F5, ho subito configurato le impostazioni di base. Ho creato un account con login e una nuova password,
consentendo agli amministratori di autenticarsi e apportare modifiche al WAF.
Successivamente, utilizzando il client (che funge anche da amministratore), ho effettuato l'accesso al server F5 e ho attivato le licenze fornite dall'azienda. In
particolare, ho abilitato il modulo ASM e quello di IP Intelligence, quest'ultimo utile per filtrare gli indirizzi IP sospetti o con una reputazione negativa.

=== NodeGoat Policy
Dopo aver attivato il modulo ASM, ho proceduto alla creazione della policy che verrà assegnata al WAF. La policy è stata configurata con le impostazioni e le regole
iniziali, come ad esempio la specifica delle tecnologie utilizzate dall'applicazione web in [@tech].
#figure(image("../img/project/tech.png", width: 90%), caption: [Tecnologie applicazione web]) <tech>
Questo ha permesso di applicare automaticamente alcune regole predefinite che si basano su tali tecnologie.
Per la realizzazione della policy, ho optato per il template manuale. Questa scelta, che prevede una configurazione quasi interamente a carico dell'amministratore, è
stata dettata dalla volontà di mettere in pratica e consolidare le nozioni acquisite durante il periodo di formazione.
La policy è stata inizialmente impostata in modalità *trasparent* in quanto, non avendo ancora tutte le regole definitive, la policy
necessita di ulteriori revisioni. Pertanto, invece di bloccare le richieste, è preferibile segnalarle per un'analisi successiva, che permetterà di decidere se
implementare una regola di blocco o consentire la richiesta.
Nel contesto delle impostazioni di Learning and Blocking, ho configurato il blocco automatico per tutte le richieste che non rispettano la conformità delle istruzioni
HTTP, così da filtrare immediatamente quelle sospette.
Per quanto riguarda l'apprendimento di header e parametri, ho adottato due approcci distinti.
Per gli header, ho impostato la modalità su "Never". Avendo già analizzato l'applicazione, conoscevo i metodi utilizzati e ho potuto definire preventivamente quali
consentire e quali bloccare. Per i parametri, ho scelto la modalità "Always". L'obiettivo era garantire una protezione completa contro tutti i possibili attacchi basati
sui parametri, ai quali l'applicazione poteva essere vulnerabile.

=== Virtual server
Per permettere al server F5 di operare come WAF e interporsi tra il client e il server che ospita la web application, è necessario creare un
Virtual Server. Questo componente ha il compito di ricevere le richieste dal client, esaminarle in base alle regole definite in una specifica policy e, se conformi,
inoltrarle al server reale.
Come si può vedere in [@vs] La configurazione del Virtual Server prevede l'assegnazione di un nome, la definizione della porta e del protocollo di comunicazione.
Vengono inoltre specificati gli indirizzi IP: quello di destinazione, che corrisponde al server reale, e quello di origine, che identifica l'IP a cui il client deve
collegarsi per utilizzare l'applicazione.
La configurazione include anche la selezione della policy di sicurezza da applicare, l'attivazione della funzione di IP Intelligence per filtrare indirizzi IP sospetti,
e la definizione di profili di protezione contro attacchi DoS e Bot.
Infine, è possibile gestire i profili di logging, offrendo all'amministratore la flessibilità di decidere quali log registrare e dove archiviarli.
#figure(image("../img/project/vs.png", width: 90%), caption: [NodeGoat virtual server]) <vs>

=== Logging profile
Per analizzare fin da subito i log generati dal WAF, ho creato un profilo di logging specifico che mi ha permesso di mantenere e visualizzare direttamente dalla GUI del
WAF le richieste sospette. Questo approccio ha facilitato la comprensione e l'individuazione rapida di soluzioni.
Oltre alla memorizzazione locale, ho configurato il sistema per inoltrare tutti i log, anche quelli non sospetti, a un server remoto. Questa scelta garantisce la
ridondanza e la persistenza dei dati. Per la trasmissione, ho utilizzato il protocollo UDP che sebbene non sia affidabile, offre una comunicazione
veloce e la potenziale perdita di un pacchetto relativo a un log è considerata accettabile.
I log generati dal WAF sono formattati in CSV, un formato che ne semplifica la lettura e l'analisi. La scelta di questo formato mi ha permesso
di selezionare manualmente le informazioni rilevanti da conservare, scartando quelle meno utili. In particolare, ho deciso di includere i seguenti campi:
- *policy_name:* Il nome della policy attiva al momento della generazione del log.
- *violations:* Il tipo di violazione commessa per le richieste sospette.
- *date_time:* La data e l'ora precise della richiesta che ha generato il log.
- *client_ip:* L'indirizzo IP del client che effettua la richiesta.
Il formato CSV facilita inoltre la trasmissione dei dati al server remoto, che utilizzando rsyslog ed è in grado di ricevere pacchetti UDP con questo tipo di contenuto
senza richiedere ulteriori configurazioni.

== Conformità OWASP top 10 2021
Questa sezione illustrerà come ho raggiunto la conformità con i top 10 di OWASP, soddisfacendo così l'obiettivo principale del progetto.

=== A01
Poiché l'applicazione web non esponeva chiamate API, l'accesso a queste non rappresentava un problema di
sicurezza rilevante. Tuttavia, ho ritenuto importante prestare particolare attenzione alla gestione
dell'autenticazione utente e alla protezione delle pagine riservate, poiché l'esistenza di URL non
adeguatamente protetti avrebbe potuto consentire la visualizzazione di file privati, aprendo la strada ad
attacchi di tipo path traversal.
Per mitigare tali vulnerabilità e garantire la conformità alla categoria OWASP A01, ho configurato un modulo di
login enforcement, che permette di definire regole rigide per il controllo delle sessioni utente, come spiegato
nella sezione @stud_ses.
#figure(image("../img/project/login.png", width: 90%), caption: [Configurazione login enforcement]) <loge>
Come in [@loge], ho impostato come pagina dedicata all'autenticazione quella preposta
all'accesso dell'utenza e ho elencato esplicitamente le altre pagine protette, in modo da impedire l'accesso
senza autenticazione.
Inoltre, per prevenire attacchi di tipo path traversal, ho attivato firme specifiche che includono una
whitelist di URL consentiti a livello globale, vietando qualsiasi altro accesso non autorizzato. Ho inoltre
configurato delle regole per bloccare il caricamento e l'accesso a file con estensioni non consentite,
rafforzando così la sicurezza complessiva dell'applicazione.

=== A02
Per mitigare le vulnerabilità legate alla protezione dei dati sensibili
ho innanzitutto configurato la funzionalità di Data Guard, al fine di mascherare eventuali informazioni
sensibili che transitano tra client e server. Successivamente, ho definito regole specifiche per parametri,
header e cookie, con l'obiettivo di proteggere valori sensibili e impedire che possano essere accessibili da
potenziali attaccanti.
Un esempio significativo riguarda il cookie "connect.sid", utilizzato per mantenere la sessione utente.
#figure(image("../img/project/cookie.png", width: 90%), caption: [Configurazione connect.sid cookie]) <sescook>
Oltre a inserirlo nella lista dei cookie protetti dal WAF, ho attivato su di esso alcune impostazioni di
sicurezza fondamentali, tra cui il cookie tampering protection, visibili in [@sescook]:
- HttpOnly, che impedisce l'accesso al cookie tramite JavaScript, riducendo anche il rischio di furto tramite attacchi di tipo XSS.
- Secure, che rende possibile la trasmissione del cookie utilizzando il protocollo HTTPS
- SameSite=Strict, che vieta l'invio del cookie in richieste provenienti da siti esterni, aumentando la protezione contro attacchi di CSRF.
Un'ulteriore misura di sicurezza adottata riguarda l'utilizzo del protocollo HTTPS per tutte le comunicazioni
tra client e server, garantendo così la cifratura dei dati in transito e prevenendo intercettazioni o
manipolazioni. A tal fine, ho creato un virtual server dedicato esclusivamente alla gestione delle connessioni
HTTPS.

=== A03
Per mitigare le vulnerabilità riguardati gli attacchi di tipo injection ho attivato tutte le
firme di rilevamento riguardanti i principali tipi di attacchi di injection, tra cui SQL Injection, LDAP
Injection, XPath Injection, Command Injection, XSS e Remote File Injection.
In parallelo, ho configurato la validazione e il filtraggio di tutti i parametri immessi dagli utenti
attraverso i numerosi form presenti nell'applicazione, utilizzati sia per la ricerca di informazioni sia per
l'inserimento di dati personali. L'operazione più comune che ho eseguito su quasi tutti i parametri consiste
nel definire i meta-caratteri consentiti, disabilitando specificamente quei caratteri maggiormente sfruttati
negli attacchi SQL e XSS, quali ad esempio * > * , * < *, * : *, * ; *, * - * e le sequenze di URL
encoding basate sul simbolo *%*.
Oltre alla gestione dei meta-caratteri, ho anche definito con rigore il tipo di dato accettato per ciascun
parametro e la lunghezza massima consentita. Queste restrizioni consentono di prevenire non solo l'iniezione di
codice malevolo, ma anche di evitare input errati che potrebbero causare malfunzionamenti o errori
nell'applicazione.

=== A04 <A04>
Poiché questo tipo di vulnerabilità è principalmente legato all'analisi dei casi d'uso dell'applicazione e alla
sua progettazione e implementazione, un WAF può offrire un supporto limitato.
Le uniche configurazioni che ho potuto applicare in questa categoria riguardano la definizione degli URL
consentiti e l'attivazione della funzionalità di information leakage detection. Quest'ultima consente di
notificare l'amministratore qualora l'applicazione web rivelasse informazioni sensibili, come commenti o
messaggi di errore generati dai programmatori, che potrebbero facilitare lo sfruttamento di alcune
vulnerabilità.

=== A05
Per mitigare le vulnerabilità derivanti da configurazioni insicure, ho innanzitutto abilitato le firme relative
agli attacchi di tipo XXE, con l'obiettivo di bloccare e ridurre i rischi associati alla manipolazione di
contenuti XML.
Inoltre, ho definito una lista ristretta di metodi HTTP consentiti, limitandomi esclusivamente a GET, POST e
HEAD, poiché sono gli unici effettivamente utilizzati dall'applicazione. Di conseguenza, tutti gli altri metodi
sono stati vietati per minimizzare ulteriormente i rischi di attacco.
Parallelamente, ho abilitato la protezione contro il clickjacking su tutti gli URL precedentemente inseriti
nella whitelist, in modo da impedire che un attaccante possa inserire iframe malevoli tramite attacchi XSS.
Tali iframe, se cliccati, potrebbero eseguire azioni dannose o reindirizzare l'utente verso siti esterni non
autorizzati.
Infine, ho configurato regole restrittive per le richieste CORS, disabilitandole completamente poiché
l'applicazione non ne fa uso. Questo intervento è stato effettuato per evitare l'introduzione di potenziali
vulnerabilità legate a richieste cross-origin non autorizzate.

=== A06
Per ridurre i rischi connessi all'utilizzo di componenti, framework o librerie vulnerabili o non aggiornate, ho
abilitato specifiche firme per il rilevamento di attacchi noti relativi alle tecnologie impiegate
dall'applicazione.
Parallelamente, ho integrato la policy del WAF con strumenti di scansione delle vulnerabilità, capaci di
effettuare un monitoraggio continuo e automatizzato delle librerie e delle dipendenze applicative. Questo
processo di scansione permette di identificare tempestivamente eventuali versioni obsolete o vulnerabili,
fornendo notifiche immediate all'amministratore e facilitando così una pronta risposta ai rischi emergenti.
Tuttavia, è fondamentale sottolineare che, come le vulnerabilità legate a @A04, il WAF rappresenta un livello
di difesa aggiuntivo e non può in alcun modo sostituire le pratiche di gestione e mantenimento del ciclo di
vita del software.
La responsabilità della corretta manutenzione, aggiornamento e risoluzione delle vulnerabilità delle dipendenze
rimane sempre in capo al team di sviluppo e progettazione. Tenere costantemente aggiornate le librerie,
applicare le patch di sicurezza e adottare metodologie di sviluppo sicuro sono pratiche imprescindibili per una
difesa completa ed efficace. Il WAF, infatti, può mitigare solo in parte i rischi derivanti da componenti
vulnerabili, ma non può eliminarli alla radice; per questo motivo, un approccio integrato e sinergico tra
sicurezza applicativa e sicurezza infrastrutturale è indispensabile.

=== A07
Per contrastare le vulnerabilità presenti durante l'autenticazione dell'utente, oltre a configurare e
definire le regole per il controllo delle sessioni già descritte in precedenza, ho implementato specifiche
regole per contrastare gli attacchi di tipo brute force.
#figure(image("../img/project/brute.png", width: 90%), caption: [Configurazione brute force]) <brute>
Il funzionamento di questa protezione visibile in [@brute] è semplice ma efficace:
nel momento in cui il sistema rileva un numero di tentativi di accesso superiore al limite
configurato, vengono eseguite due azioni distinte per verificare l'autenticità del client. In primo luogo,
viene richiesto al client di eseguire del codice JavaScript, con l'obiettivo di accertare che non si tratti
di un bot automatizzato. In secondo luogo, se necessario, viene presentato un CAPTCHA, ulteriore barriera
per impedire l'accesso a tentativi automatizzati.
Queste misure sono integrate con una protezione dedicata contro il credential stuffing.
Il sistema è in grado di riconoscere richieste sospette basate su tali insiemi noti di credenziali e, in
risposta, bloccare definitivamente l'indirizzo IP del client che le invia, limitando così il potenziale
danno.

=== A08
Anche questo tipo di vulnerabilità non può essere efficacemente mitigato esclusivamente tramite un WAF. Pertanto,
per cercare di ridurre al minimo i rischi legati a difetti nel codice o nella configurazione dell'infrastruttura,
ho provveduto ad abilitare specifiche firme di rilevamento per attacchi quali buffer overflow e command execution.
Queste firme consentono di bloccare preventivamente le richieste contenenti payload malevoli, fornendo così un
ulteriore livello di protezione contro vulnerabilità di basso livello nel sistema.

=== A09
Inizialmente, la conformità a questo requisito era parzialmente soddisfatta, poiché prevedeva il reindirizzamento
dei log verso un server remoto, configurato già all'inizio del progetto per le ragioni precedentemente illustrate.
L'unica configurazione aggiuntiva che ho dovuto implementare è stata l'attivazione del logging dettagliato, al
fine di consentire all'amministratore un'analisi più approfondita e accurata di ciascun evento registrato.

=== A10
Per mitigare il rischio di attacchi di tipo SSRF ho implementato diverse regole e contromisure.
In primo luogo, ho abilitato le firme di attacco dedicate alla rilevazione di SSRF, progettate
per individuare pattern comuni e bloccare le richieste sospette.
Successivamente, ho definito una lista di URL consentiti, da considerarsi esemplificativa e non
esaustiva, che comprende principalmente le pagine dell'applicazione e alcune risorse esterne
pubbliche precedentemente verificate. Ho preso questa decisione in quanto la lista andrebbe
costruita in collaborazione con l'intero team, al fine di identificare in modo condiviso le
destinazioni ritenute sicure.
Grazie a questa configurazione, solo gli URL specificati possono comparire all'interno di un
parametro, mentre qualsiasi altro URL viene automaticamente bloccato.
Infine, per un parametro specifico di tipo URI, ho implementato un controllo rigoroso sul
valore fornito, impedendo l'inserimento di URI arbitrari che potrebbero essere sfruttati per
accedere in modo non autorizzato a risorse private.

== Simulazione attacco DoS
Per mitigare gli attacchi più rilevanti, come nel caso specifico di un attacco DoS, ho configurato e creato un nuovo profilo di protezione DoS che ho successivamente
assegnato al virtual server.
#figure(image("../img/project/dos.png", width: 90%), caption: [Configurazione DoS protection]) <tpsd>
Come si può notare dall'immagine sovrastante [@tpsd], ho attivato entrambi i metodi di rilevamento degli attacchi DoS, in modo da prevenire la maggior parte di questi
attacchi. Tuttavia, la componente più importante per questo tipo di progetto è il metodo basato su TPS, poiché le richieste verso questa applicazione sono generalmente
leggere e mirate a ricerche su dataset piccoli e ben definiti.
A scopo di testing, dato che i valori definitivi andrebbero concordati con il team e in base alle esigenze del cliente, ho deciso di impostare i seguenti parametri:
- Incremento soglia traffico: 1%
- Massimo numero di transazioni per secondo: 2
In questo modo, il WAF riconoscerà un possibile attacco DoS quando il volume di richieste supera l'1% rispetto al normale traffico o quando si registrano più di 2
richieste al secondo.
La strategia di mitigazione prevede il blocco delle richieste provenienti dall'IP sospetto per un periodo di 120 secondi dal momento del rilevamento dell'attacco, con
uno sblocco automatico solo dopo 2 ore dalla fine dell'attacco, a condizione che non si verifichino nuovi tentativi.
Per verificare l'efficacia della configurazione, ho sviluppato uno script Bash che simula un attacco DoS.
#figure(image("../img/project/dos.svg", width: 90%), caption: [Script per attacco DoS])
Lo script consente di scegliere se generare traffico verso un singolo URL (nel mio caso, /login) oppure verso più URL elencati in un file di testo.
Una volta selezionata la modalità, lo script invia ripetutamente 10.000 pacchetti HTTP per 300 cicli, generando così un carico di traffico elevato e per un tempo
prolungato.
Questo permette di osservare il comportamento del WAF in condizioni di stress, valutare eventuali rallentamenti e raccogliere dati utili per la generazione di un grafico
delle richieste durante l'attacco DoS.
Da notare che, nel caso si selezioni la modalità che invia richieste a tutti gli URL elencati, è necessario specificare anche il valore del cookie di sessione. Questo
perché l'applicazione protegge tutte le pagine tramite autenticazione, rendendo impossibile inviare richieste valide senza un cookie di sessione attivo.
Di conseguenza, per poter testare questa modalità è necessario disabilitare le protezioni di cookie tampering e il login enforcement; ciò dimostra come, grazie alla
struttura stessa dell'applicazione, queste due misure siano già in grado di bloccare efficacemente questo tipo di attacco.

== Simulazione attacco BoT
Come ultima operazione, ho deciso di configurare e creare un profilo di protezione specifico contro attacchi provenienti da bot e botnet, che, analogamente al profilo di
protezione DoS, ho successivamente assegnato al virtual server.
La creazione di questo profilo è stata molto più semplice e veloce rispetto a quella dedicata agli attacchi DoS, poiché il WAF integra già automaticamente firme e
algoritmi proprietari per identificare se una richiesta proviene da un bot. Inoltre, il sistema è in grado di eseguire test di verifica lato client, tramite JavaScript,
per confermare se si tratta effettivamente di un bot.
Di conseguenza per questo progetto, mi sono soprattutto concentrato sulle tecniche di mitigazione.
#figure(image("../img/project/bot.png", width: 90%), caption: [Configurazione BoT protection]) <botp>
In figura [@botp] sono illustrate le strategie di mitigazione adottate: per i bot considerati fidati o non fidati il WAF genera un log di allarme accessibile solo
dagli amministratori. Questo permette di monitorare le richieste provenienti da bot non fidati e confrontarle con quelle dei bot fidati, al fine di identificare
eventuali falsi positivi.
Per i bot sospetti, invece, il WAF impone al client una verifica tramite CAPTCHA per accertare se la richiesta proviene da un vero utente (falso positivo) o da un bot,
nel qual caso la richiesta viene bloccata. I bot maliziosi, invece, vengono direttamente bloccati senza alcun test, poiché è altamente probabile che rappresentino una
minaccia; eventuali modifiche alle regole restano a discrezione dell'amministratore.
Per quanto riguarda i bot non riconosciuti invece, ho applicato un limite di frequenza, lasciando all'amministratore il compito di analizzare ulteriormente il traffico
per decidere se bloccarli ulteriormente o meno.
Analogamente a quanto fatto per gli attacchi DoS, ho creato uno script Bash per simulare un attacco da bot e verificare il corretto funzionamento delle protezioni.
#figure(image("../img/project/botatt.svg", width: 90%), caption: [Script per attacco BoT])
In sintesi, l'utente dello script può scegliere se simulare un attacco con bot maliziosi o meno. Lo script genera richieste HTTP in cui lo
user-agent gioca un ruolo fondamentale nella simulazione: si utilizzano due file di testo distinti, uno contenente user-agent comuni dei browser “user_agents.txt”, che
non vengono bloccati poiché non riconosciuti come bot, e un altro contenente user-agent tipicamente associati a bot o sospetti "user_agents_bot,txt", le cui richieste
vengono invece bloccate dal WAF.

=== Credential stuffing
Per concludere, sempre in ambito di attacchi di tipo bot, ho eseguito una semplice e rapida simulazione di un
attacco di credential stuffing per mettere in pratica quanto appreso durante il periodo di formazione sugli
attacchi e per testare ulteriormente il profilo di protezione bot che avevo configurato.\
Lo script utilizzato è molto semplice:
#figure(image("../img/project/stuffer.svg", width: 90%), caption: [Script per attacco credential stuffing])
richiede in input un file di testo contenente tutte le possibili coppie username e password, organizzate una per
riga e separate dal carattere *-*.
Successivamente, lo script scorre l'intera lista di coppie e, per ciascuna, costruisce un payload con username e
password estratti dal file. Utilizzando la libreria Python “requests”, invia una richiesta POST alla pagina di
login con il payload appena creato.
Nel caso specifico di questa applicazione, se il server risponde con codice di stato 200, che corrisponde al
normale comportamento in caso di login riuscito, significa che la coppia username-password è corretta e consente
l'accesso all'applicazione; in questo caso le credenziali vengono stampate a console.
Testando quanto descritto e avendo configurato il WAF secondo le impostazioni precedenti, queste richieste vengono
correttamente bloccate, impedendo così il successo dell'attacco.
