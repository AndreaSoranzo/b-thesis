= Architettura di rete
Per realizzare il progetto mi sono affidato all'architettura di rete proposta dalla
documentazione di F5 in quanto era semplice ed era sufficiente per portare a termina il
progetto.
\ \
#figure(image("../arch/net.svg", width: 100%), caption: [Architettura di rete])
\
L'architettura può essere divisa in 3 reti differenti:

- *External Network (verde):* parte della rete che vede come protagonisti gli utenti che vogliono accedere all'applicazione web tramite un dispositivo

- *Management Network (blu):* parte della rete ha protagonista l'admin di F5 il quale ha la possibilità di connettersi direttamente dal applicativo F5 e configurarlo.

- *Internal Network (rosa):* parte della rete che contiene i server che mettono a disposizione le applicazioni web.
\
L'adozione di questa architettura permette di isolare efficacemente tutte le
componenti della rete, aumentando notevolmente la sicurezza complessiva. Gli
utenti che desiderano connettersi ai server non lo fanno direttamente; sono
invece obbligati a transitare attraverso il firewall F5, passando per un'unica
interfaccia di rete.\
Questo meccanismo offre al firewall la capacità di monitorare tutto il traffico
proveniente dai client. Se rileva attività sospette, può bloccarle, impedendo
che vengano inoltrate al server.

Internamente, il firewall crea quello che viene definito un server virtuale.
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
attuale, il download avviene ogni dieci minuti.
Negli ambienti virtuali, per facilitare questa operazione, si utilizza l'interfaccia NAT
fornita direttamente dalle applicazioni di virtualizzazione, come nel caso di VMware.
Questa funzionalità permette agli ambienti virtuali di connettersi alla stessa rete della
macchina fisica senza richiedere configurazioni o passaggi aggiuntivi, semplificando
notevolmente il processo.
#pagebreak()
== Architettura nel dettaglio
Di seguito è riportato lo schema dettagliato dell'architettura, utile per analizzare al
meglio le interconnessioni tra le varie componenti della rete, con una specifica degli
indirizzi IP utilizzati.
\ \
#figure(image("../arch/net-det.svg", width: 95%), caption: [Architettura di rete nel dettaglio])
\

Anche in questa immagine, per maggiore chiarezza, le parti mantengono gli stessi colori, ma
in questo caso ho assegnato a ogni sezione della rete un indirizzo IP specifico:

- *10.1.1.0:* rappresenta la management network.

- *10.1.10.0:* rappresenta la external network.

- *10.1.20.0:* rappresenta la internal network.
\
Il software BIG-IP è stato configurato con diverse interfacce di rete, ognuna dedicata a
interfacciarsi con le varie reti presenti. Questa configurazione è fondamentale perché il
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

Infine, poiché tutte le macchine utilizzate sono virtuali, sono state interfacciate tramite
l'interfaccia NAT messa a disposizione da VMware. Questa
soluzione, adottata per ragioni di praticità, permette a tutti i componenti di connettersi a
Internet. Questo è particolarmente utile per attività come il download di software o
l'esecuzione di ricerche tramite browser, sia per i client generici sia, nel mio caso
specifico, per l'admin F5.
