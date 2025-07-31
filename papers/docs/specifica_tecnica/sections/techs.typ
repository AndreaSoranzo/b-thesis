== Scelta delle tecnologie
In questa sezione, vengono esaminate le tecnologie adottate durante lo stage, con un'analisi dei
rispettivi benefici e delle possibili criticità.

=== F5 BIG-IP 17.5
Si tratta di una piattaforma F5 che propone un sistema avanzato e altamente modulare. Non è un prodotto a
sé stante, bensì un'architettura unificata che integra hardware dedicato o, come nel mio caso, software
virtuale, entrambi basati sul sistema operativo proprietario di F5.

La rilevanza di F5 BIG-IP in questo contesto è data dalla sua capacità di soddisfare i requisiti del progetto, fornendo inoltre funzionalità aggiuntive tramite il modulo
LTM, quali:

- *Bilanciamento del Carico:* distribuisce in modo intelligente il traffico di rete in entrata tra un pool di server (fisici o virtuali) che ospitano la stessa applicazione utilizzando algoritmi sofisticati e monitorando costantemente lo stato di salute dei server.

- *Ottimizzazione delle Prestazioni:* accelera lo scambio di pacchetti tra client e server attraverso varie tecniche come compressione, caching e ottimizzando il protocollo TCP.

- *Sicurezza Applicativa:* trasforma il software in un WAF, il quale analizza il traffico HTTP/HTTPS proteggendo le applicazioni web da attacchi mirati come SQL Injection, XSS, attacchi DoS a livello applicativo e altre vulnerabilità elencate nelle OWASP Top 10. Questa capacità è stata fondamentale per soddisfare tutti i requisiti del progetto.

Questa scelta è dettata esclusivamente dallo scopo del tirocinio, che è quello di formare nuove risorse aziendali su tecnologie poco utilizzate, come F5.

=== VMWare Workstation 17
È un software di virtualizzazione desktop, noto come hypervisor di tipo 2, sviluppato da
VMware Inc. A differenza degli hypervisor di tipo 1, che si installano direttamente sull'hardware fisico e gestiscono le risorse hardware in modo nativo, VMware-Workstation opera come un'applicazione su un sistema operativo host già esistente (ad esempio, Windows o Linux).
Nel mio caso l'ho utilizzato per creare 4 macchine virtuali differenti:

- Server con la web application
- WAF F5
- Client Linux
- Server Syslog

L'adozione di questa soluzione si è rivelata fondamentale sia per l'avanzamento del progetto sia per l'avvio della fase di formazione. Ha consentito l'esecuzione rapida di test e simulazioni,
senza compromettere l'integrità delle apparecchiature e la sicurezza dei dati aziendali. In questo contesto, sebbene VMware sia riconosciuto tra i software di virtualizzazione più performanti per
l'ottimale gestione delle risorse, la sua scelta è stata determinata dall'infrastruttura esistente e dalle licenze già in possesso dell'azienda, che utilizza quasi esclusivamente questa soluzione.

=== Burp Suite Community Edition
È uno strumento indispensabile per l'analisi e la manipolazione delle comunicazioni tra client e server, ampiamente impiegato nei test di sicurezza web.
La sua funzionalità principale risiede nella capacità di intercettare i pacchetti di dati prima che raggiungano la loro destinazione finale, consentendo la modifica in
tempo reale. Questa caratteristica è stata cruciale per simulare attacchi e valutare la robustezza di un'applicazione web.
Sebbene la Community Edition sia la versione gratuita con funzionalità più limitate rispetto alla Professional Edition, essa si è dimostrata ampiamente sufficiente per
scopi di ricerca e didattici. In particolare, la sua funzione di intercettazione è completa e risponde pienamente alle esigenze del progetto.
#figure(image("../tech/burp.png", width: 90%), caption: [Intercettazione pacchetti con Burp Suite])
L'adozione di Burp Suite per i test di sicurezza nel presente progetto è stata dettata principalmente dalla bibliografia di riferimento.
Un paragrafo specifico illustrava l'utilizzo di questo software, rendendone l'utilizzo pratico e agevole per le finalità del lavoro.

=== Bash
È un interprete di comandi e un linguaggio di scripting progettato per sistemi operativi Unix-like. Nel mio contesto, è stato utilizzato per sviluppare due script essenziali al fine di valutare la
reattività del WAF di fronte a simulazioni di attacchi DoS e Bot.
Ho deciso di adottare questa tecnologia semplicemente per i seguenti motivi:

- *Linguaggio conosciuto:* personalmente conosco già le basi del linguaggio e la sua sintassi.

- *Possibilità di eseguire altri programmi:* essendo un interprete, lo script può eseguire direttamente i programmi richiamando i comandi al suo interno, eliminando la necessità di wrapper o funzioni specifiche, solitamente richieste con altre tecnologie e linguaggi di programmazione.

- *Nessuna installazione:* essendo la shell di default delle distribuzioni Linux non ho dovuto installare altri applicativi o compilatori per eseguire il codice


=== Python
Linguaggio di programmazione ad alto livello che ho usato per effettuare degli attacchi di login-stuffing.
Per questo tipo di attacchi ho deciso di utilizzare Python per i seguenti motivi:

- *Linguaggio conosciuto:* personalmente conosco già le basi del linguaggio e la sua sintassi.

- *Librerie di terze parti:* Python consente di importare librerie di terze parti che offrono funzioni utili per eseguire attività specifiche in modo rapido e semplice.

==== Requests
Libreria che semplifica l'invio di richieste HTTP/1.1 e la gestione delle risposte.
Questa libreria mi ha offerto una serie di vantaggi chiave:

- *Semplicità e leggibilità*: la sua sintassi è pulita e intuitiva. Eseguire una richiesta GET o POST con Requests richiede solo una riga di codice, rendendo il codice più leggibile e più veloce da scrivere rispetto alle alternative.

- *Analisi delle risposte:* analisi delle risposte del server in modo semplice e intuitivo per capire se l'attacco fosse andato a buon fine o no.

