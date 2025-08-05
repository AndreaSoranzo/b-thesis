= Tipi di attacchi studiati e vulnerabilità da proteggere <ch6>
Il periodo di studio, supportato dal testo @FDOC, ha incluso un'analisi approfondita delle tipologie di attacchi più diffuse, frequentemente impiegate per sfruttare le
vulnerabilità presenti nelle moderne applicazioni web.
Questa fase di ricerca è stata cruciale per assimilare in maniera dettagliata il comportamento e le implicazioni funzionali di questi attacchi nella prospettiva
dell'attaccante, elementi indispensabili per la successiva implementazione di misure difensive.
Le seguenti sezioni illustreranno gli attacchi specifici oggetto di studio durante il periodo di formazione.

== XSS
Gli attacchi Cross-Site Scripting rientrano nella categoria degli attacchi di iniezione, dove script malevoli vengono iniettati all'interno di siti web altrimenti
innocui e ritenuti affidabili.
Questi attacchi si verificano quando un attaccante sfrutta un'applicazione web per eseguire codice dannoso, generalmente sotto forma di script javascript, sul browser
dell'utente finale. Le vulnerabilità che permettono il successo di tali attacchi sono piuttosto diffuse e si manifestano ovunque un'applicazione web utilizzi l'input
fornito da un'utente senza validarlo o codificarlo adeguatamente.
Il browser dell'utente finale non ha modo di riconoscere che lo script non è attendibile e, di conseguenza, lo eseguirà. Poiché il browser percepisce lo script come proveniente da una fonte fidata,
il codice malevolo può accedere a cookie, token di sessione o altre informazioni sensibili conservate dal browser e associate a quel sito.
#figure(image("../img/attacks/xss.svg", width: 90%), caption: [Attacco XSS @XSS-IMG]) <xssi>
Un attacco di questo tipo può essere diviso in tre fasi come illustrato in [@xssi]:
+ L'attaccante inserisce il payload, spesso racchiuso in tag <script>, nell'input vulnerabile o nell'URL.
+ Quando un altro utente visualizza la pagina contenente il payload iniettato, il browser della vittima esegue lo script malevolo.
+ Lo script può quindi eseguire varie azioni dannose nel contesto del browser della vittima.

== SQL Injection
L'SQL Injection è una tecnica di attacco che rientra nella categoria degli attacchi di iniezione. Consiste nell'inserimento di frammenti o intere query SQL malevole
attraverso i campi di input di un'applicazione web o client, sfruttando una gestione impropria dei dati.
Quando un attacco SQL Injection ha successo, le sue implicazioni possono essere estremamente gravi, permettendo all'attaccante di ottenere un controllo significativo
sul database e, in alcuni casi, sull'intero sistema che lo ospita. Nello specifico è possibile:
- Leggere dati sensibili e riservati presenti nel database.
- Modificare, inserire o eliminare dati nel database compromettendone l'integrità.
- Eseguire operazioni di amministrazione sul DBMS come ad esempio l'arresto dell'intero servizio.
- Recuperare il contenuto di file arbitrari presenti sul file system del server.
#figure(image("../img/attacks/sql.svg", width: 90%), caption: [Attacco SQL Injection @SQL-IMG]) <sqli>
Anche in questo caso, le vulnerabilità si manifestano ovunque un'applicazione web utilizzi l'input fornito da un'utente senza una valida sanitizzazione o validazione.
Come si può analizzare dalla [@sqli], il processo di attacco è composto in due fasi principali, analoghe ad un attacco XSS.

== Brute force
L'attacco brute force è una delle metodologie più antiche e persistenti nel panorama della sicurezza informatica. Sebbene non si basi su vulnerabilità
logiche o di programmazione complesse, la sua efficacia deriva dalla sua estrema semplicità e dalla capacità di testare sistematicamente un numero elevato di
possibilità. L'obiettivo primario di questo tipo di attacco è scoprire informazioni sconosciute (come password, chiavi crittografiche, PIN o nomi utente) provando
metodicamente ogni combinazione possibile fino a identificare quella corretta.
Per sua natura, l'unica difficoltà per l'aggressore risiede nell'efficacia della propria strategia: configurare un insieme di valori predeterminati, inviare
ripetutamente richieste al server utilizzando sistematicamente tali valori e, infine, analizzare le risposte per identificare una corrispondenza valida.
Esistono due diverse metodologie per configurare e provare questi valori:
- *Dictionary Attack:* si basa sull'utilizzo di liste predefinite di parole comuni, password o combinazioni spesso utilizzate.
- *Modo tradizionale:* questo approccio esamina metodicamente tutte le possibili combinazioni di caratteri.

=== Credential stuffing
Il credential stuffing è un tipo di attacco brute force che consiste nell'iniezione automatizzata di coppie di username e password rubate all'interno dei moduli di
login dei siti web, con l'obiettivo di ottenere accesso fraudolento agli account utente.
Data la diffusa tendenza di molti utenti a riutilizzare la stessa password e combinazione di username o email su più servizi, quando tali credenziali vengono esposte
ad esempio, a seguito di una violazione di database o di un attacco di phishing, la semplice sottomissione di queste credenziali rubate su decine o centinaia di altri
siti può consentire a un attaccante di compromettere altri account sempre legati allo stesso utente.
Gli attaccanti possono anche sfruttare le informazioni pubbliche per reimpostare le password, in particolare per gli account aziendali.
Poiché le informazioni sulle aziende sono spesso pubbliche, è più facile per gli aggressori ottenere numeri di telefono, indovinare indirizzi email e raccogliere altri
dati rilevanti. Questo metodo spesso sfrutta domande di sicurezza, email di recupero o altre informazioni personali permettendo all'attaccante di assumere il controllo
degli account anche se le password originali non sono state utilizzate.

== Path traversal
#figure(image("../img/attacks/path.png", width: 90%), caption: [Attacco path traversal @PATHT-IMG]) <pathi>
Un attacco di Path Traversal ha l'obiettivo di accedere a file e directory che sono archiviati al di fuori della cartella root del server web. Manipolando variabili che
fanno riferimento a file tramite sequenze come "../" e le sue varianti come meglio illustrato in [@pathi], oppure utilizzando percorsi di file assoluti, diventa
possibile accedere a file e directory arbitrarie presenti sul file system. Ciò include potenzialmente il codice sorgente dell'applicazione, file di configurazione
cruciali o persino file di sistema critici.
È importante notare, tuttavia, che l'accesso ai file è limitato dai controlli di accesso operativi del sistema.

== Session hijacking
L'attacco consiste nello sfruttamento del meccanismo di controllo delle sessioni web, che è tipicamente gestito tramite un token o cookie di sessione.
Poiché la comunicazione HTTP si basa su molteplici connessioni TCP distinte, il server web necessita di un metodo per riconoscere le connessioni di ogni singolo utente.
Il metodo più efficace si avvale di un token che il server web invia al browser del client dopo un'autenticazione riuscita. Un token di sessione è generalmente composto
da una stringa di larghezza variabile e può essere utilizzato in diversi modi: può essere incluso nell'URL, nell'header della richiesta HTTP (come un cookie o in altre
sezioni dell'header), o persino nel corpo della richiesta HTTP.
L'attacco di Session Hijacking compromette il token di sessione, rubando o prevedendo un token di sessione valido, al fine di ottenere accesso non autorizzato al server
web.
Esistono vari modi per effettuare questo tipo di attacco, quello più rischioso e semplice da effettuare per un attaccante è il session sniffing.
#figure(image("../img/attacks/session.jpg", width: 90%), caption: [Session hijacking @SESH-IMG]) <sesi>
Nell'esempio in [@sesi], è possibile osservare come l'attaccante utilizza innanzitutto un dispositivo di intercettazione (sniffer) per catturare un token di sessione
valido, denominato "Session ID".
Successivamente, impiega tale token di sessione valido per ottenere accesso non autorizzato al server web.

== CSRF
#figure(image("../img/attacks/CSRF.svg", width: 90%), caption: [Attacco CSRF @CSFR-IMG]) <csrfi>
È una tipologia di attacco che costringe un'utente finale a eseguire azioni indesiderate su un'applicazione web in cui è attualmente autenticato. Con un minimo aiuto di
tecniche di social engineering (come l'invio di un link tramite email o chat), un attaccante può ingannare gli utenti di un'applicazione web, inducendoli a eseguire
azioni scelte dall'aggressore stesso come è illustrato in [@csrfi].
Se la vittima è un'utente comune, un attacco CSRF riuscito può forzarla a effettuare richieste che modificano lo stato del proprio account, come trasferire fondi,
cambiare il proprio indirizzo email, e così via. Se invece la vittima è un account con privilegi amministrativi, un attacco CSRF può arrivare a compromettere l'intera
applicazione web.

== SSRF
#figure(image("../img/attacks/SSFR.png", width: 90%), caption: [Attacco SSRF @SSRF-IMG]) <ssrfi>
È un attacco che permette a un attaccante di indurre un server lato applicazione a effettuare richieste HTTP (o altre richieste di protocollo) arbitrarie a una risorsa
specificata dall'aggressore. A differenza del CSRF che sfrutta la fiducia del browser dell'utente, SSRF abusa della fiducia che il server dell'applicazione ha verso
le proprie risorse interne o verso altri server e servizi. Questo significa che l'attacco viene eseguito dal server stesso, agendo come una sorta di proxy per conto
dell'attaccante.
L'applicazione target potrebbe possedere funzionalità che permettono l'importazione o la pubblicazione di dati da/verso un URL, o la lettura di dati da esso, e queste
funzionalità possono essere manipolate. L'attaccante modificando le chiamate a queste funzioni e fornendo un URL completamente diverso o intervenendo sulla modalità di
costruzione degli URL, come in [@ssrfi], può riuscire a leggere dati da servizi che non sono direttamente esposti su internet come ad esempio:
- Meta-dati del server cloud
- Interfacce REST

== Bot
#figure(image("../img/attacks/dos.png", width: 90%), caption: [Attacco DoS @DOS-IMG]) <boti>
Un attacco bot in generale si riferisce all'uso di software automatizzato (bot) per interagire con un'applicazione web in modi che vanno oltre l'attività umana
legittima, spesso con intenti malevoli o abusivi. Non è un singolo tipo di attacco, ma una categoria ampia che racchiude diverse minacce, tutte basate sull'automazione.
Mentre gli utenti umani interagiscono con un sito in modo relativamente lento e imprevedibile, i bot possono operare a velocità e volumi enormi, eseguendo migliaia o
milioni di richieste in pochi secondi o minuti.

== DoS
L'attacco Denial of Service ha come obiettivo principale quello di rendere una risorsa (come un sito web, un'applicazione o un server) non disponibile per lo scopo per
cui è stata progettata.
Questi attacchi causano ritardi di risposta elevati, perdite eccessive di dati e interruzioni del servizio, con un impatto diretto e devastante sulla disponibilità
della risorsa.
Esistono numerosi modi per rendere un servizio inaccessibile agli utenti legittimi, sfruttando vulnerabilità a vari livelli: dalla manipolazione dei pacchetti di rete e
difetti di programmazione, a problemi logici o a una gestione inefficiente delle risorse. Ad esempio, un servizio può diventare irraggiungibile se subisce un numero
eccessivamente elevato di richieste, spesso sfruttando dei bot come si può osservare in [@boti], portando così al suo sovraccarico. Allo stesso modo, può
interrompersi se viene sfruttata una vulnerabilità di programmazione o se la modalità di gestione delle risorse da parte del servizio è difettosa.
In alcuni casi, l'attaccante può persino iniettare ed eseguire codice arbitrario mentre effettua un attacco DoS, non solo per causare un disservizio, ma anche per
accedere a informazioni critiche o eseguire comandi sul server.
