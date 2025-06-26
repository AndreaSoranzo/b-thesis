#import "./utility.typ": *
#show: doc => cover(doc)

#set heading(numbering: none)

= Giorno 1

*Ordine del giorno:*
- Analisi risultati WAF
- Correzione AdR
\ \
*Note:*\
Ho generato traffico di test per mettere alla prova le regole del firewall e individuare
eventuali falsi positivi o configurazioni mancanti. Sono lieto di confermare che tutto è
risultato corretto.
Infine, ho revisionato e chiarito alcuni Use Case (UC) che presentavano ambiguità e ho
risolto dei bug nell'action di GitHub relativa al glossario automatico.
\ \

= Giorno 2

*Ordine del giorno:*
- Feedback AdR
- Verifica della conformità agli standard di sicurezza OWASP Top 10
- Aggiunta qualche regola e protezione in più su alcune compliance OWASP
\ \
*Note:*\
Ho implementato i flag "Secure" e "SameSite" sui cookie protetti da F5 per rafforzare la
sicurezza contro attacchi cross-site e garantire la trasmissione tramite protocollo HTTPS.
Inoltre, ho aggiunto la protezione dal clickjacking agli URL.
Mi rimane da rivedere le regole anti-brute force, avendo riscontrato un problema che
discuterò con il mio tutor domani.
\ \

= Giorno 3

*Ordine del giorno:*
- Regola per impedire al client di comunicare direttamente con il server
- Studio CORS
- Inizio capitolo 4 tesi
- Risolto problema rilevamento brute force
\ \
*Note:*\
Il problema nel rilevamento degli attacchi brute force era causato dalla persistenza della sessione di Firefox all'interno della macchina virtuale. Questo accadeva
perché, all'avvio, la VM caricava un'immagine dello stato precedente prima dello spegnimento. La soluzione è stata eliminare i dati del browser e disattivare l'opzione di
ripristino dello stato precedente della macchina virtuale.
\ \

