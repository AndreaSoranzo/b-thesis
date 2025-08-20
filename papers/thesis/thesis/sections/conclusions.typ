= Conclusioni
== Riepilogo e consultivo finale
Il progetto descritto in questa tesi, proposto dall'azienda, consiste nell'implementazione di un WAF basato sulla tecnologia F5. L'obiettivo principale è proteggere
un'applicazione web in conformità con le linee guida OWASP 2021, che individuano le dieci vulnerabilità più comuni e sfruttate dagli attaccanti per compromettere il
sistema, sottrarre dati sensibili o rendere il servizio indisponibile. Parallelamente, il progetto mira anche a formare nuove risorse capaci di utilizzare efficacemente
il WAF.
Il periodo di stage si è articolato in due fasi principali. La prima fase, della durata di circa due settimane, è stata interamente dedicata alla formazione,
concentrandosi sullo studio della tecnologia, dei principali attacchi informatici e sul funzionamento delle reti a un livello generale. In questo periodo ho seguito la
documentazione fornita dall'azienda, composta da un manuale con lezioni teoriche e pratiche che permettevano di mettere in pratica quanto appreso.
La seconda fase, invece, è durata cinque settimane ed è stata focalizzata sull'implementazione concreta del WAF, con l'obiettivo di raggiungere quanto stabilito
all'inizio del progetto. L'applicazione web scelta per questo scopo è stata OWASP NodeGoat, selezionata perché ampiamente documentata in termini di vulnerabilità e
coerente con quanto appreso durante la fase formativa.
Le attività si sono svolte seguendo un approccio iterativo articolato in tre fasi: prima la verifica delle vulnerabilità, poi la mitigazione tramite la configurazione
del WAF, infine la validazione delle contromisure adottate mediante test mirati, volti a verificare l'efficacia delle regole implementate.
Per ciascuna delle dieci vulnerabilità individuate dall'OWASP 2021, ho eseguito test mirati e simulazioni di attacco per individuare i punti deboli dell'applicazione,
definendo di conseguenza regole specifiche in grado di bloccare tali attacchi. Tra le funzionalità più utili implementate troviamo: le attack signature, la definizione
di parametri, li cookie tampering protection, i meccanismi di login enforcement e prevenzione dei tentativi di brute force, Data Guard, il rilevamento di attacchi DoS e
la protezione contro bot.
Purtroppo durante l'intero periodo di stage si sono verificati alcuni piccoli problemi che hanno rallentato la gestione delle tempistiche e il completamento delle
attività pianificate. Queste difficoltà si sono manifestate sia all'inizio del percorso sia durante la fase di formazione.
Le principali criticità erano correlate ai rischi precedentemente segnalati nella @risk e, in parte, alla stesura della tesi. In particolare, l'analisi dei requisiti e
la definizione degli Use Case hanno inizialmente creato qualche incertezza. Non ero infatti certo se includerli, considerando che il progetto non riguardava lo sviluppo
applicativo, ma si focalizzava principalmente sullo studio, la formazione e la configurazione del WAF per mettere alla prova le competenze acquisite.
A queste problematiche si sono aggiunti alcuni problemi hardware riscontrati nei computer portatili forniti all'inizio dello stage.
Proprio a causa di tali difficoltà, alcune attività pianificate hanno dovuto essere rimandate e riorganizzate nel corso delle settimane. Nonostante questo, sono lieto di
confermare che tutte le attività previste sono state comunque portate a termine con successo e il risultato finale è stato pienamente raggiunto, garantendo la protezione
contro tutte e dieci le vulnerabilità elencate nell'OWASP 2021.
#figure(image("../img/project/compliance10.png", width: 90%), caption: [Conformità OWASP 2021])
Questo traguardo ha rappresentato non solo la validazione tecnica delle attività svolte, ma anche il completamento con successo dell'obiettivo formativo previsto per lo
stage.

== Sviluppi e miglioramenti futuri
Sebbene il progetto abbia raggiunto l'obiettivo prefissato di ottenere una conformità pari a 10/10 nella protezione di NodeGoat, è comunque possibile potenziare
ulteriormente la sicurezza aggiungendo nuove regole e servizi al WAF.
Un primo importante miglioramento potrebbe essere l'integrazione del WAF con sistemi SIEM. L'adozione di un sistema SIEM consente di centralizzare la raccolta, la
gestione e l'analisi degli eventi di sicurezza generati dal WAF e da altre componenti infrastrutturali. Questo non solo facilita il monitoraggio in tempo reale, ma offre
anche strumenti avanzati per l'analisi comportamentale, il riconoscimento di pattern sospetti e la correlazione di eventi che potrebbero indicare attacchi complessi o
tentativi di intrusione. Grazie a questa integrazione, gli amministratori di sicurezza possono avere a disposizione dashboard intuitive e alert configurabili, che li
aiutano a individuare tempestivamente anomalie e minacce emergenti, migliorando così la capacità di risposta agli incidenti. In sintesi, integrare il WAF con un SIEM
significa passare da una gestione reattiva a una proattiva della sicurezza, rendendo il controllo più efficace, strutturato e scalabile nel tempo.
Un altro aspetto su cui lavorare riguarda l'integrazione con le pipeline di sviluppo e deployment (CI/CD), così da automatizzare i test di sicurezza. In questo modo si
potrebbe evitare l'introduzione di vulnerabilità durante le fasi di sviluppo e rilascio, garantendo una protezione costante lungo l'intero ciclo di vita del software,
come spiegato nella sezione dedicata alla @CICD.
Un ulteriore e significativo miglioramento riguarda l'adozione di meccanismi di threat intelligence più avanzati, che vadano oltre la semplice IP intelligence
attualmente utilizzata. Integrare diverse fonti di threat intelligence permette al WAF di accedere a informazioni aggiornate e contestualizzate su minacce emergenti,
indicatori di compromissione e tattiche, tecniche e procedure impiegate dagli attaccanti. Questi dati possono provenire da feed commerciali o open source, da community
di sicurezza o da sistemi di threat intelligence interni all'organizzazione. Grazie a questa ricchezza informativa, il WAF potrà applicare filtri più sofisticati e
tempestivi, bloccando richieste che provengano da fonti sospette o malevole non riconducibili semplicemente a indirizzi IP già noti, ma anche identificando richieste
anomale sulla base di indicatori quali payload malevoli, anomalie nei pattern di traffico, user agent sospetti o tentativi di exploit. Inoltre, l'adozione di threat
intelligence estesa può supportare il riconoscimento di compromissioni più complesse, come attacchi multi-vettore o tentativi di persistenza, sia a livello del server
che nelle comunicazioni degli utenti.
Un punto di miglioramento, sebbene non applicabile nello specifico al mio progetto, che era indirizzato a un singolo utente, è la disponibilità del team di sviluppo
dell'applicazione stessa. Molte configurazioni del WAF, per essere efficaci ed efficienti, richiedono una stretta collaborazione con il team di sviluppo o, in alcuni
casi, con il cliente. Questo permette di comprendere meglio le esigenze, verificare le vulnerabilità e risolverle quanto più possibile direttamente sul server, poiché il
WAF deve essere considerato come un sistema di sicurezza aggiuntivo e non come l'unica linea di difesa.
In definitiva, i possibili sviluppi individuati dimostrano come la sicurezza delle applicazioni non sia un obiettivo statico, ma bensì un processo continuo che richiede
costante aggiornamento e collaborazione tra tecnologie utilizzate, processi e persone.

== Considerazioni finali

L'esperienza di stage si è rivelata estremamente preziosa, permettendomi di avvicinarmi concretamente a quello che è il vasto mondo della cybersicurezza, un ambito che
ho sempre desiderato approfondire. Durante questo periodo ho avuto l'opportunità di studiare e comprendere nel dettaglio i principali tipi di attacchi informatici,
analizzandone il funzionamento tecnico e le modalità con cui si propagano. Questa conoscenza mi ha permesso di affrontare con maggiore consapevolezza le strategie di
difesa, esaminando quali contromisure è possibile adottare per prevenire o mitigare tali minacce.
Un aspetto fondamentale che ho potuto ripassare e approfondire riguarda le basi delle reti informatiche: ho avuto modo di rivedere le terminologie più comuni, il
funzionamento delle trasmissioni dati e in particolare come vengono gestite e strutturate le richieste HTTP, così come la composizione dei singoli pacchetti di rete.
Questo background si è rivelato essenziale per comprendere a fondo il ruolo del WAF e la sua posizione all'interno di un'infrastruttura di sicurezza.
Essendo la creazione e la configurazione di un WAF l'obiettivo principale del mio progetto, ho potuto dedicarmi all'approfondimento di questo strumento, studiandone il
funzionamento interno, le caratteristiche tecniche e le modalità operative. Ho imparato a configurare un WAF in modo efficace, valutandone concretamente l'efficacia
nella protezione delle applicazioni web e nella prevenzione degli attacchi. Prima di questa esperienza, immaginavo che l'attività di configurazione fosse molto più
complessa, partendo da zero e richiedendo un totale sviluppo manuale delle regole. Invece, ho scoperto che i principali servizi WAF sul mercato, come quelli offerti da
F5 e altri vendor, dispongono di interfacce grafiche intuitive e di un set di regole predefinite che semplificano notevolmente il lavoro degli amministratori di
sicurezza.
Ciò che si è invece rivelato più impegnativo è stata la fase di fine-tuning del WAF. Questa richiede un intenso lavoro di testing e analisi per identificare e correggere
i falsi positivi, ovvero quelle situazioni in cui il sistema blocca per errore utenti legittimi o richieste valide. Tale aspetto è cruciale, perché un numero elevato di
falsi positivi può influire negativamente sull'esperienza degli utenti e, di conseguenza, sulla fruibilità dell'applicazione protetta. Infatti, attivare senza
distinzione tutte le attack signature offerte dal WAF comporterebbe inevitabilmente un aumento significativo dei falsi positivi, con conseguenze dannose.
Infine, il fine-tuning permette di adattare le regole per coprire efficacemente una vasta gamma di attacchi, che spesso sono complessi.
Oltre all'aspetto tecnico, questa esperienza di stage mi ha fornito un'importante occasione di crescita professionale, poiché ho avuto modo di interagire quotidianamente
con professionisti del settore della sicurezza informatica. Questo confronto diretto mi ha aiutato a comprendere meglio le dinamiche e le esigenze del mondo aziendale,
sviluppando competenze preziose in termini di organizzazione del lavoro, gestione autonoma delle attività e collaborazione all'interno di un team.
In conclusione, posso definirmi molto soddisfatto di questa esperienza, sia per gli obiettivi raggiunti sia per le nuove conoscenze acquisite. Ho potuto approfondire un
settore in continua evoluzione, comprendendo le sfide legate alla sicurezza applicativa e imparando concetti fondamentali che rappresentano solide basi per un mio
possibile futuro percorso professionale.
