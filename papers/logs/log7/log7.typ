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
