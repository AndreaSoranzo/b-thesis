#import "./utility.typ": *
#show: doc => cover(doc)

#set heading(numbering: none)

= Giorno 1

*Ordine del giorno:*
- Studio del pacchetto *IP Inteligence*: #link("https://github.com/lukaszknysak/F5-Advanced-Web-Application-Firewall")[https://github.com/lukaszknysak/F5-Advanced-Web-Application-Firewall].
- Selezione di una web app con vulnerabilità note per la configurazione e la validazione del WAF di progetto.

*Note:*\
La ricerca ha individuato le seguenti possibili applicazioni web:
- #link("http://www.itsecgames.com/")[bWAPP]
- #link("https://www.vulnhub.com/entry/badstore-123,41/")[BadStore]
- #link("https://github.com/s4n7h0/xvwa")[XVWA - Extreme Vulnerable Web Application]

\
= Giorno 2

*Ordine del giorno:*
- Reperimento screenshot ed informazioni utili per la tesi
- Call con F5
- Decisione della web app per il progetto

*Note:*\
La nostra call con l'esperto F5 ha risolto con successo alcune domande sulle attack signature e i parameters in modalità enforced. Abbiamo concluso la giornata
decidendo per #link("https://github.com/OWASP/NodeGoat")[NodeGoat] come web app vulnerabile per il nostro progetto. Abbiamo anche concordato che, se dovessimo completare le consegne del progetto prima del
termine previsto per lo stage, affronteremo la sfida di mettere in sicurezza un'applicazione ancora più complessa.

