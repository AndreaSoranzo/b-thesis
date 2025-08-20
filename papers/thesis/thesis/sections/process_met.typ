= Processi e metodologie <ch2>
== Piano di lavoro
Per impostare un metodo di lavoro efficace fin dall'inizio del mio stage, ho cercato di sviluppare un approccio, o _way of working_, ottimale.

Nelle prossime sezioni, illustrerò in dettaglio la mia pianificazione del tempo, la suddivisione delle attività, l'analisi dei rischi previsti, la loro mitigazione e le
difficoltà incontrate.

=== Scopo del progetto
Il fulcro di questo progetto risiede nell'implementazione e successiva ottimizzazione di un WAF. Tale soluzione, se strategicamente posizionata,
mira a potenziare significativamente il livello di sicurezza delle applicazioni web.

L'obiettivo principale è duplice: istituire una difesa resiliente contro il
panorama delle minacce informatiche e, contestualmente, assicurare la continuità operativa.
Attraverso questa implementazione, non solo si prevede una drastica riduzione del rischio di interruzioni di servizio, ma si abiliterà anche
un'analisi e un monitoraggio del traffico web in tempo reale, indispensabili per l'identificazione tempestiva di attività anomale.

Parallelamente, un obiettivo
irrinunciabile è il conseguimento e il mantenimento della conformità agli standard di sicurezza vigenti, in particolare le OWASP, con la conseguente protezione dei dati degli utenti e il
consolidamento della loro fiducia.

=== Descrizione del progetto
Il progetto ha preso forma attraverso un processo iterativo, dove il piano iniziale è stato progressivamente adattato in base alle nuove competenze acquisite.
La definizione ufficiale dei requisiti è avvenuta dopo un colloquio con i tutor aziendali, tenutosi al termine della formazione preliminare. Questo incontro è stato
fondamentale per allineare le aspettative sui tempi a disposizione con il nostro livello di preparazione.
Il lavoro è stato poi strutturato in diverse fasi chiave:
- *Analisi vulnerabilità:* Questa fase prevede un'analisi dettagliata delle vulnerabilità esistenti e dei requisiti di sicurezza specifici per le applicazioni web in esame.
- *Implementazione:* Il WAF sarà implementato con la massima cura, ponendo attenzione a minimizzare qualsiasi impatto sulle normali operazioni e prestazioni dell'applicativo.
- *Test e ottimizzazione:* Condurremo test approfonditi e affineremo le regole del WAF in modo mirato, per massimizzarne l'efficacia protettiva.
- *Monitoraggio proattivo:* Sarà attivato un sistema di monitoraggio simulativo costante e in tempo reale degli attacchi. Questo ci permetterà di rispondere in modo rapido e proattivo alle minacce emergenti.

Il WAF che ne deriverà offrirà una protezione completa contro un'ampia gamma di attacchi informatici, con un focus particolare su:
- SQL injection
- XSS
- DoS
- Brute force

=== Pianificazione
Il piano di lavoro è articolato in otto settimane, con una ripartizione delle attività come segue:
- *Prima settimana (20 ore):* Incontro con il tutor aziendale e analisi dei requisiti del progetto, configurazione degli strumenti di lavoro e inizio formazione.
- *Seconda settimana (40 ore):* Analisi dell' applicazione web e identificazione delle vulnerabilità principali e studio delle funzionalità del WAF.
- *Terza settimana (40 ore):* Progettazione e configurazione iniziale del WAF e personalizzazione delle regole di sicurezza.
- *Quarta settimana (40 ore):* Implementazione del WAF e test di compatibilità con l'applicazione e ottimizzazione delle regole.
- *Quinta settimana (40 ore):* Simulazione di attacchi per testare l'efficacia del WAF e analisi dei risultati e ottimizzazione delle configurazioni.
- *Sesta settimana (40 ore):* Configurazione di sistemi di monitoraggio per rilevare attacchi e verifica della conformità agli standard di sicurezza.
- *Settima settimana (40 ore):* Manutenzione o ottimizzazione del WAF.
- *Ottava settimana (40 ore):* Revisione finale e presentazione dei risultati e consegna della documentazione e chiusura del progetto.

=== Organizzazione del lavoro
Durante il periodo di stage, l'organizzazione del lavoro ha beneficiato di un'ampia autonomia. Entrambi i tutor ci hanno concesso piena libertà nella gestione delle
attività, permettendoci di definire autonomamente obiettivi e task da completare entro scadenze prefissate. Questa flessibilità è stata sempre guidata da una
pianificazione concordata con i tutor, assicurando un allineamento costante con gli obiettivi del progetto.

Fin dal primo giorno, l'azienda ci ha fornito i computer portatili necessari per svolgere tutte le attività, dalla formazione iniziale alla realizzazione pratica del
progetto.
Tra i programmi che ho utilizzato con maggiore frequenza e su base giornaliera, spiccano VMware, Microsoft Teams e Kortext.

VMware si è rivelato uno strumento cruciale. L'ho utilizzato per creare le diverse macchine virtuali necessarie a simulare i vari componenti dell'
infrastruttura di rete utilizzata. Questo ci ha permesso di replicare ambienti complessi e testare le configurazioni in un contesto controllato.
Kortext, invece, ha funzionato come hub centrale per la documentazione ufficiale di F5. Essendo i testi e le guide a pagamento e non disponibili su altre piattaforme,
è stato indispensabile per accedere a tutte le risorse formative e tecniche necessarie.
Infine Microsoft Teams è stato essenziale per tenerci sempre in comunicazione con i tutor in caso di problemi o dubbi.

=== Rischi e mitigazioni <risk>
Durante le prime settimane di stage, ho avuto l'opportunità di confrontarmi con il tutor aziendale principale, Stefano Marchetti, per analizzare i principali rischi che
avrebbero potuto influenzare l'andamento del progetto e definire le relative strategie di mitigazione.

Ho identificato due aree di rischio primarie:
+ *Difficoltà nell'acquisizione di nuove competenze tecniche:*
  - _Descrizione:_ L'apprendimento di strumenti complessi e tecnologie a noi completamente sconosciute rappresentava una sfida significativa.
  - _Mitigazione:_ Il tutor aziendale ci ha fornito la documentazione ufficiale di F5, inclusi laboratori pratici e interattivi, fondamentali per un apprendimento concreto. Inoltre, siamo venuti a conoscenza della disponibilità di un esperto F5 con cui il tutor era in contatto, assicurandoci un supporto più specialistico per i dubbi più complessi.
+ *Rischio di non completare il progetto nei tempi previsti:*
  - _Descrizione:_ La combinazione di una tempistica definita e la nostra relativa inesperienza nell'ambito della sicurezza informatica e di alcuni aspetti delle reti avrebbe potuto rendere difficile il completamento del progetto entro la scadenza.
  - _Mitigazione:_ Ci è stata garantita una comunicazione costante con i tutor per monitorare i progressi e chiarire tempestivamente ogni dubbio. Questo ci avrebbe permesso, in caso di necessità, di ridefinire le priorità o gli obiettivi del progetto per assicurarne il completamento.

== Analisi dei requisiti
#include "use_cases.typ"

#include "requisiti.typ"

== Difficoltà incontrate
Durante il mio stage, ho riscontrato diverse difficoltà di varia natura e intensità. Queste sfide hanno richiesto un impegno costante da parte mia, specialmente nella
fase iniziale di formazione.

Per maggiore chiarezza, ho classificato queste difficoltà in due categorie principali:

=== Difficoltà tecniche
- *Studio di nuovi argomenti:* Per configurare correttamente il WAF, è stato indispensabile approfondire autonomamente le mie conoscenze in ambito networking, concentrandomi in particolare su IP, subnetting e VLAN. Questa specifica necessità è sorta dal fatto che l'intera configurazione doveva essere simulata tramite macchine virtuali. Inoltre, ho dovuto studiare le modalità di comunicazione tra i vari dispositivi connessi, il che mi ha permesso di implementare un server syslog.

- *Studio di nuove tecnologie:* Anche se generalmente intuitivo, l'utilizzo di VMware ha richiesto qualche tentativo iniziale per superare alcune difficoltà di installazione e familiarizzare con l'interfaccia, risolte dopo un paio di tentativi.
  Per quanto riguarda F5, sebbene la sua GUI intuitiva renda la maggior parte delle operazioni piuttosto semplici, lo studio iniziale è stato complesso. La vasta gamma di opzioni e pagine disponibili può facilmente disorientare e creare confusione.

=== Difficoltà organizzative
- *Lavoro da remoto:* Purtroppo, verso l'inizio di giugno, l'azienda ha dovuto chiudere per ristrutturazione, il che ha comportato un mese di lavoro completamente da remoto. Questo periodo ha contribuito ad accrescere la sensazione di isolamento e, di conseguenza, non mi ha permesso di acquisire un'idea concreta di come si svolga il lavoro in presenza.

