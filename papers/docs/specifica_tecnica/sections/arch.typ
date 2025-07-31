== Architettura di rete
Per realizzare il progetto mi sono affidato all'architettura di rete proposta dalla
documentazione @FDOC in quanto era semplice ed era sufficiente per portare a termine il
progetto.
\ \
#figure(image("../img/arch/net.svg", width: 100%), caption: [Architettura di rete]) <net>
\
Come si osserva da [@net] l'architettura può essere divisa in 3 sottoreti differenti:

- *External Network (verde):* parte della rete che vede come protagonisti gli utenti che vogliono accedere all'applicazione web tramite un dispositivo.

- *Management Network (blu):* parte della rete ha come protagonista l'admin di F5 il quale ha la possibilità di connettersi direttamente dall'applicativo F5 e configurarlo a suo piacimento.

- *Internal Network (rosa):* parte della rete che contiene i server che mettono a disposizione le applicazioni web.

L'adozione di questa architettura permette di isolare efficacemente tutte le
componenti della rete, aumentando notevolmente la sicurezza complessiva. Gli
utenti che desiderano connettersi ai server non lo fanno direttamente; i pacchetti sono
invece obbligati a transitare attraverso il firewall F5, passando per un'unica
interfaccia di rete.\
Questo meccanismo offre al firewall la capacità di monitorare tutto il traffico
proveniente dai client. Se rileva attività sospette, può bloccarle, impedendo
che vengano inoltrate al server.

Internamente, il firewall crea quello che viene definito un virtual server.
Questo "server fittizio" non solo svolge le funzioni di firewall, ma espone
anche un indirizzo IP al quale gli utenti possono connettersi. Tale IP deve
essere associato a un pool, che rappresenta il server reale contenente e
fornente l'applicazione vera e propria all'utente.

Si può notare che al centro della configurazione è posizionato il firewall, per le
motivazioni esposte in precedenza.
Questo firewall è collegato a un NAT, una connessione essenziale che gli permette di accedere
a Internet.
L'accesso a Internet è cruciale per abilitare la funzione di IP Intelligence: il firewall può
così scaricare regolarmente un database aggiornato di tutti gli IP sospetti o malevoli
direttamente dai server ufficiali di F5. Per garantire che questo database rimanga sempre
aggiornato, il download avviene ogni dieci minuti.

Negli ambienti virtuali, per facilitare questa operazione, si utilizza l'interfaccia NAT
fornita direttamente dalle applicazioni di virtualizzazione, come nel caso di VMware.
Questa funzionalità permette a tali ambienti di connettersi alla stessa rete della
macchina fisica senza richiedere configurazioni o passaggi aggiuntivi, semplificando
notevolmente il processo.
#pagebreak()
=== Architettura nel dettaglio
Di seguito è riportato lo schema dettagliato dell'architettura di rete, utile per analizzare le interconnessioni tra le varie componenti e gli indirizzi IP utilizzati.
\ \
#figure(image("../img/arch/net-det.svg", width: 95%), caption: [Architettura di rete nel dettaglio])<netdet>
\

Anche nella [@netdet], per maggiore chiarezza, le parti mantengono gli stessi colori, ma
in questo caso ho assegnato a ogni sezione della rete un indirizzo IP specifico:

- *10.1.1.0:* rappresenta la management network.

- *10.1.10.0:* rappresenta la external network.

- *10.1.20.0:* rappresenta la internal network.
\
Il software BIG-IP è stato configurato con diverse interfacce di rete, ognuna dedicata a
interfacciarsi con le varie sottoreti presenti. Questa configurazione è fondamentale perché il
sistema deve essere in grado di ricevere le richieste provenienti dalla
external network e, solo se considerate legittime, inoltrarle alla internal network
e quindi ai server. Parallelamente, questa configurazione consente a un utente
autorizzato, l'admin, di accedere al sistema per visionare o modificare le
configurazioni.

Durante la fase di testing, l'accesso dell'admin F5 è stato volutamente semplificato: è stato
collegato sia alla management network che alla rete esterna. Questa scelta
è stata dettata da pura praticità, evitando la necessità di creare un ambiente virtuale
aggiuntivo per simulare un potenziale client. È cruciale sottolineare, tuttavia, che in un
ambiente di produzione reale, la situazione sarebbe ben diversa: l'Admin F5 avrebbe accesso
esclusivamente alla management network, mentre qualsiasi utente che volesse interagire con
l'applicazione web si connetterebbe, come di norma, alla rete esterna.

Per soddisfare il requisito #link(<RV3>)[RV2], ho collegato un server syslog dedicato alla rete
interna, garantendone l'inaccessibilità dall'esterno. Questo server è configurato per ricevere
tutti i log generati dal WAF F5 relativi alle richieste dei client.

Infine, dato che tutte le macchine utilizzate sono virtuali, è stata configurata un'interfaccia
NAT per ciascuna di esse, per praticità. Questa soluzione ha facilitato notevolmente
attività come il download di software e le ricerche tramite browser, sia per i client generici
sia, nel mio caso specifico, per l'admin F5.
