#import "./utility.typ": *
#show: doc => cover(doc)

#set heading(numbering: none)

= Giorno 1

*Ordine del giorno:*
- Continuato script per simulazione attacco DoS
- Revisione tesi
\ \
*Note:*\
Dopo aver risolto alcune problematiche legate alla lentezza della macchina virtuale che ospita il WAF F5, ho ripreso oggi la scrittura dello script. L'obiettivo è
simulare un potenziale attacco DoS per verificarne il rilevamento da parte del WAF e testare l'efficacia delle regole di mitigazione che ho precedentemente configurato.
\ \

= Giorno 2

*Ordine del giorno:*
- Continuato script per simulazione di attacco Bot
\ \
*Note:*\
Ho proseguito nella scrittura dello script per simulare un attacco bot. Inizialmente, ho riscontrato problemi perché le simulazioni, anche con user agent sicuri che
emulavano un vero browser, venivano comunque flaggate come sospette. Dopo una riunione con il tutor, abbiamo compreso che il problema risiedeva negli header: le richieste
effettuate con curl non contenevano tutti gli header necessari o non erano nel giusto ordine. Una volta sistemata questa parte dello script, tutto ha funzionato
perfettamente.
\ \

= Giorno 3

*Ordine del giorno:*
- Finalizzato script principali
- Creato script alternativo per eseguire richieste su più endpoint URL
\ \
*Note:*\
Ho completato gli script per simulare attacchi DoS e Bot. Per "saltare" il processo di login ed eseguire richieste sulle pagine protette, è stato modificato il comando
curl in modo da includere il cookie di sessione. È importante notare che per l'esecuzione di questi comandi, le protezioni sui cookie del WAF devono essere disattivate.
\ \

= Giorno 4

*Ordine del giorno:*
- Simulazione attacchi DoS e Bot
- Proposta di lavoro
\ \
*Note:*\
Ho continuato con le simulazioni di attacchi DoS e Bot per affinare le regole del WAF e renderlo più robusto. Nel pomeriggio, io e il mio collega abbiamo partecipato a
una riunione con il tutor, durante la quale ci ha illustrato una potenziale proposta di lavoro.
\ \

= Giorno 5

*Ordine del giorno:*
- Manutenzione e ottimizzazione del WAF
\ \
*Note:*\
Nessuna.
\ \
