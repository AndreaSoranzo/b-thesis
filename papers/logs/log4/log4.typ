#import "./utility.typ": *
#show: doc => cover(doc)

#set heading(numbering: none)

= Giorno 1

*Ordine del giorno:*
- Redazione capitolo riguardante l'*Azienda* per la tesi
- Compliance A10 implementata

*Note:*\
La prima parte della giornata è stata impiegata nella redazione della descrizione dell'azienda e nell'analisi del progetto a noi affidato.
Successivamente, ho provveduto all'implementazione delle misure di sicurezza per garantire la conformità OWASP A10, configurando i parametri URI su F5 per il
rilevamento proattivo degli attacchi SSRF.
La giornata si è conclusa con l'analisi della gestione dello userID dinamico e della vulnerabilità IDOR (A4).
\

= Giorno 2

*Ordine del giorno:*
- Compliance A2,A5,A6 implementata

*Note:*\
Sono riuscito a configurare un server virtuale e a modificare la web application per utilizzare il protocollo HTTPS anziché HTTP. Ciò ha permesso di soddisfare
pienamente la compliance A2, che richiede la comunicazione client-server criptata (TLS/SSL). Per le compliance A5 e A6, è stato sufficiente approvare manualmente
i requisiti, poiché queste sono attività di competenza del responsabile della sicurezza e dell'implementazione della web application, come l'aggiornamento delle
tecnologie e il monitoraggio delle potenziali vulnerabilità.
\
