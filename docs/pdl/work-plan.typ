#import "./utility.typ": *
#show: doc => cover(doc)

= Contatti
*Studente:*

- Soranzo Mendez Andrea Jesus 2075539 \ 
  #show link: set text(fill: black, weight: "regular")
   #link("mailto:soranzoandrea.mj@gmail.com") \
   #link("mailto:andreajesus.soranzomendez@studenti.unipd.it") \
   #link("tel:00393284477297")[+39 328 447 7297]

*Tutor aziendale:*
- Stefano Marchetti \
  #show link: set text(fill: black, weight: "regular")
  #link("mailto:stefano.marchetti@kireygroup.com") \

*Azienda:*
- KIREY Srl \ 
  Corso Stati Uniti, 14/B, 35127 Padova PD \ 
  #show link: set text(fill: black, weight: "regular")
  #link("mailto:HR@Kireygroup.com") \
  #show link: set text(fill: blue, weight: "bold")
  #link("https://www.kireygroup.com/")[https://www.kireygroup.com/]

= Informazioni sull'azienda
Kirey è un system integrator che guida le aziende nel loro percorso di Digital Transformation, accompagnandole verso
la realizzazione di organizzazioni data-driven. Facendo leva su una forte
competenza in materia di Data & AI, Kirey riconosce nei dati un asset strategico per lo sviluppo del business,
offrendo una gamma completa di servizi che hanno come filo conduttore i dati e
l'intelligenza artificiale, e che coprono diversi settori tra cui Cloud, Software Development, Cybersecurity,
Infrastructure & Automation e Monitoring.

#pagebreak()

= Scopo dello stage
Il progetto mira all'implementazione e ottimizzazione di un Web Application Firewall (WAF) strategico per la protezione del
perimetro applicativo web aziendale.
Le fasi chiave del progetto includono:
- Analisi vulnerabilità e requisiti.
- Implementazione del WAF senza impatti operativi.
- Testing e ottimizzazione delle regole.
- Monitoraggio attacchi in tempo reale.

Il risultato atteso è un Web Application Firewall in grado di:
- Proteggere le applicazioni web aziendali da attacchi informatici come SQL injection, XSS, e DDoS.
- Garantire la continuità operativa riducendo i rischi di downtime dovuti ad attacchi informatici.
- Monitorare e analizzare il traffico web in tempo reale per identificare comportamenti sospetti.
- Rispettare gli standard di sicurezza e le normative, come il GDPR, proteggendo i dati sensibili degli utenti.

== Strumenti e metodologia di lavoro
- *Linguaggio:* Python, HTML
- *IDE:* Visual Studio Code
- *Tecnologie:* Burp Suite, firewall, log analysis, F5, cloud (opzionale).

== Date di inizio e fine
- *Data inizio:* 19-05-2025
- *Data fine:* 10-07-2025

#pagebreak()

= Pianificazione del lavoro
La pianificazione, in termini di quantità di ore di lavoro, sarà così distribuita:

#let a_col1_w = 75pt
#let a_col2_w = 340pt
#let a_row1_h = 80pt
#let a_row2_h = 65pt
#let a_row3_h = 50pt
#let a_row4_h = 65pt

#align(center)[
    #table(
    align: left,
    columns: (27%,64%),
    table.header[*Durata in ore*][*Descrizione attività*],
    align(center+horizon)[50], [Analisi delle Esigenze
            - Studio approfondito delle applicazioni web esistenti per identificare le vulnerabilità
            - Definizione dei requisiti specifici per la protezione delle applicazioni],
    align(center+horizon)[130],[Progettazione e Implementazione
            - Esaminazione delle soluzioni disponibili (F5) e adattamento in modo che soddisfi le necessità dell’organizzazione.
            - Implementazione del WAF assicurandosi che non interferisca con il normale funzionamento delle applicazioni web.
            - Ricerca librerie e asset esistenti],
    align(center+horizon)[50],[Testing e Ottimizzazione
            - Testing e simulazioni di attacchi per verificare l'efficienza del WAF
            - Miglioramento delle regole di sicurezza per ridurre i falsi positivi e ottimizzare le performance],
    align(center+horizon)[54],[Monitoraggio e Manutenzione
            - Implementazione di sistemi di monitoraggio per rilevare e rispondere agli attacchi in tempo reale],
    align(center+horizon)[16],[Revisione della documentazione],
    align(center+horizon)[*Totale ore*],table.cell(stroke:none)[],
    align(center+horizon)[*300*],table.cell(stroke:none)[]
)
]
#pagebreak()

= Obiettivi
Si farà riferimento ai requisiti secondo le seguenti notazioni:
- *O* per i requisiti obbligatori, vincolanti in quanto obiettivo primario richiesto dal committente.
- *D* per i requisiti desiderabili, non vincolanti o strettamente necessari ma dal riconoscibile valore aggiunto.
- *F* per i requisiti facoltativi, rappresentanti valore aggiunto non strettamente competitivo.

Le sigle precedentemente indicate saranno seguite da un numero, identificativo univoco del requisito.

Si prevede lo svolgimento dei seguenti obiettivi:

#align(center)[
    #table(
        align: left,
        columns: (27%,64%),
        table.header(table.cell(colspan: 2, align: center)[*Obbligatori*]),
        align(center+horizon)[O1],[Studio e analisi delle vulnerabilità],
        align(center+horizon)[O2],[Studio delle possibili soluzioni adottabili],
        align(center+horizon)[O3],[Studio e ricerca di librerie e assets esistenti per l'implementazione],
        align(center+horizon)[O4],[Implementazione del WAF],
        align(center+horizon)[O5],[Testing e simulazioni di attacchi],
        align(center+horizon)[O6],[Miglioramento delle regole per ridurre i falsi positivi],
        align(center+horizon)[O7],[Redazione di una documentazione tecnica e metodologica per il progetto],
        table.cell(colspan: 2, align: center)[*Desiderabili*],
        align(center+horizon)[D1],[Valutare il monitoraggio del progresso formativo.],
        table.cell(colspan: 2, align: center)[*Facoltativi*],
        align(center+horizon)[F1],[Implementazione, gestione ed erogazione del WAF attraverso piattaforme cloud]
    )
]

#pagebreak()

= Approvazione
Il presente piano di lavoro è stato approvato dai seguenti:

\ \ \ 
─────────────────────────────────

Stefano Marchetti - Tutor aziendale\
\ \ \ 
─────────────────────────────────

Zanella Marco - Tutor interno