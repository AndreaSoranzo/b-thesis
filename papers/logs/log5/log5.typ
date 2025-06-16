#import "./utility.typ": *
#show: doc => cover(doc)

#set heading(numbering: none)

= Giorno 1

*Ordine del giorno:*
- Redazione requisiti
- Creato e testato il syslog server
- Raggiunta la compliance OWASP Top 10

*Note:*\
Dopo aver finalizzato i requisiti funzionali e non funzionali, ho creato una nuova macchina virtuale Ubuntu Server.
Questa VM simula un server remoto dedicato all'archiviazione centralizzata dei log del WAF, resa possibile dall'utilizzo di rsyslog
per l'ascolto e il salvataggio dei messaggi di log.
La giornata si è conclusa con il raggiungimento della compliance OWASP Top 10, sebbene sia ancora necessario del fine tuning.
\
