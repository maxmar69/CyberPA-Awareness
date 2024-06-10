# UTILIZZO DELLA PIATTAFORMA ELEARNING


<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=4 orderedList=false} -->

<!-- code_chunk_output -->

- [Info](#info)
- [Premessa](#premessa)
- [Creazione di un nuovo corso](#creazione-di-un-nuovo-corso)
  - [Assegnazione del ruolo di teacher (docente)](#assegnazione-del-ruolo-di-teacher-docente)
  - [Aggiunta del corso](#aggiunta-del-corso)
  - [Impostazione degli argomenti](#impostazione-degli-argomenti)
    - [Argomento Introduzione](#argomento-introduzione)
    - [Argomento Giornata Formativa](#argomento-giornata-formativa)
    - [Argomento Sondaggio Finale](#argomento-sondaggio-finale)

<!-- /code_chunk_output -->

## Info 
- Autore: massimo.marconi@gmail.com
- Data: 1/5/2024

---------------------------------

## Premessa
Questa guida ha lo scopo di fornire le informazioni utili per la creazione di un nuovo corso composto dalle seguenti parti:
- Un sondaggio iniziale
- Del materiale didattico 
- Un sondaggio finale

Per farlo andremo a 

## Creazione di un nuovo corso

### Assegnazione del ruolo di teacher (docente)
Per prima cosa ci si deve loggare con credenziali di amministrazione, quindi andare su *Amministrazione del sito/Utenti/Autorizzazioni/Ruoli globali* quindi cliccare su *Creatore di corsi* ed assegnare al ruolo uno degli utenti potenziali.
A questo punto l'utente individuato potrà creare il nuovo corso.


### Aggiunta del corso
Loggarsi con la qualifica di docente. 
Abilitare la *modalità modifica* utilizzando l'interruttore in alto a destra.
Cliccare sul pulsante *Aggiungi corso* presente nella *Home*

Sono ora disponibili 3 diverse tab (Categoria, Impostazioni, Altro). 
Andiamo a configurare solamente il tab Categoria:

- Generale 
  - Titolo del corso:
    `Sicurezza informatica di base ed aumento della consapevolezza del problema`
  - Titolo abbreviato: `Sicurezza informatica`
  - Categoria di corsi
    In questa fase, per semplificare la gestione lasciamo la categoria prestabilita. 
  - Visibilittà del corso: `Visualizza`
  - Data di inizio del corso 
    Indicare la data a partire dalla quale il corso sarà disponibile.
  - Data di fine corso: Non indicare nulla
  - Codice identificativo del corso: Non indicare nulla

- Descrizione 
  - Introduzione al corso
    `Sicurezza informatica di base ed aumento della consapevolezza del problema`
  - Immagine del corso 
    Se si desidera caricare un'immagine relativa al corso.
- Formato corso 
  - Formato: `Per argomenti`
  - Numero di sezioni: `3`
  - Sezioni nascoste: `Le sezioni nascoste sono visualizzate come non disponibili`
  - Visualizzazione corso: `Visualizza le sezioni nella stessa pagina`
- Aspetto:
  - Forza lingua: `Non forzare`
  - Numero di annunci da visualizzare: `5`
  - Visualizza valutazione agli studenti: `No`
  - Visualizza i report delle attività: `No`
  - Visualizza date dell'attività: `Si`

- File e caricamenti:
  - Dimensione massima dei caricabili: `Limite di caricamento del sito: (40 MB)`
- Tracciamento del completamento:
  - Traccia il completamento: `Si`
  - Visualizza criteri di completamento attività: `Si`
- Gruppi:   
  - Modalità gruppo: `Senza gruppi`
  - Forza modalità gruppo: `No`
  - Raggruppamento di default: `Nessuno`
- Tag: Non impostiamo nulla  


### Impostazione degli argomenti

Il corso è composto da 3 diversi argomenti ciascuno dei quali può contenere diverse risorse e/o attività. La struttura definiva è la seguente:

- L'introduzione 
  - Il sondaggio iniziale 
  - Della documentazione
- La giornata formativa
   - Slide
   - Video registrazione
- Il sondaggio finale
  
  
#### Argomento Introduzione

Per prima cosa togliamo l'attività annunci cliccando sul burger button (i 3 puntini verticali) e selezionando la voce elimina.

##### Aggiunta del testo da mostrare quando si apre l'introduzione del corso. 
Aggiungiamo la risorsa *Area di testo e media* per poter inserie del testo nell'introduzione. Per farlo clicchiamo su *Aggiungi un'attività o una risorsa* All'interno dell'argomento introduzione e poi clicchiamo su *Area di testo e media*. 
Non resta ora che scrivere qualche riga nel campo *Testo* e cliccare su *Salva e torna al corso*

##### Aggiunta del sondaggio iniziale.

###### Aggiunta dell'attività Quiz
Aggiungiamo l'attività *Quiz* per ci permetterà di somministrare il sondaggio. Per farlo clicchiamo su *Aggiungi un'attività o una risorsa* All'interno dell'argomento introduzione e poi clicchiamo su *Quiz*. 

Impostare quindi quanto segue:
- Generale
  - Nome: `Sondaggio iniziale sulla consapevolezza in materia di sicurezza informatica`
  - Durata: 
    - Apertura: Impostare la data di inizio di somministrazione
    - Chiusura: Impostare il termine per la compilazione del sondagggio
  - Valutazione:
    - Categoria della valutazione: `Senza categoria`
    - Sufficienza: `0,00`
    - Tentativi permessi: `Nessun limite`
    - Metodo di valutazione: `Voto più alto`
  - Impaginazione: 
    - Salto pagina: `Ogni domanda`
  - Comportamento domanda:
    - Alternative in ordine casuale: `Si`
    - Comportamento della domanda: `Feedback differito`
  - Opzioni di revisione:
    - Durante il tentativo
      Spuntate: 
      - Punteggio massimo
    - Subito dopo il tentativo:
      - Il tentativo 
      - Se corretto 
      - Punteggio massimo
      - Punteggio
      - Feedback specifico
      - Feedback generale 
      - Risposta corretta 
      - Feedback complessivo
    - Dopo, mentre il quiz è ancora aperto
      - Il tentativo 
      - Se corretto 
      - Punteggio massimo
      - Punteggio
      - Feedback specifico
      - Feedback generale 
      - Risposta corretta 
      - Feedback complessivo
    - Dopo che il quiz è stato chiuso
      nulla
  - Aspetto:
    - Visualizza imaggini degli utenti: `Nessuna immagine`
    - Cifre decimali nei punteggi: `2`
    - Cifre decimali nei punteggi delle domande: `Stesse del punteggio finale`
  - Impostazioni comuni:
    - Disponibilità: `Visualizza nella pagina home del corso`
    - Cocice idenficiativo: nulla
    - Forza lingua: `Non forzare`
    - Modalità gruppo: `Senza gruppi`
  - Criteri di completamento: `Nessun tracciamento`
  - Tag: `Nessuna selezione`
  - Competenze:
    - Competenze del corso: `Nessuna selezione`
    - Al completamento dell'attività: `Non eseguire azioni`
   
Salviamo tutte le modifche.

###### Configurazione del Deposito delle domande
Ora che l'attività *quiz* è stata creata dobbiamo andare ad importare le domande. Nel repositry del progetto è presente il file `QB_sondaggio.gift` contenente alcune domande con le realtive risposte. Ciascuna domanda è taggata in base ad un argomento principale ed ad altri secondari.
E' possibile importare facilmente il contenuto del file all'interno della piattaforma moodle svolgendo le seguenti operazioni.
1) Entrare nell'argomento introduzione e quindi cliccare sul quiz `Sondaggio iniziale sulla consapevolezza in materia di sicurezza informatica`
2) Cliccare quindi nel tab *Deposito delle domande* quindi sul pulsante *Domande* presente sopra la scritta *Deposito delle domande* e selezionare *Importa*
3) Spuntare *Formato GIFT*
4) Cliccare su *Scegli un file* ed individuare il file *QB_sondaggio.gift* facente parte del progetto
5) Cliccare su importa
6) Verranno mostrate le domande presenti nel deposito. Cliccare sul punsante *Continua* presente in fondo alla pagina
 


###### Assegnazione delle domande
Ora che l'attività *quiz* è stata creata ed il deposito delle domande è stato popolato possiamo definire quali domande debbano far parte del sondaggio iniziale.

E' possibile farlo facilmente svolgendo le seguenti operazioni.
1) Entrare nell'argomento introduzione e quindi cliccare sul quiz `Sondaggio iniziale sulla consapevolezza in materia di sicurezza informatica`
2) Cliccare quindi nel tab *Domande*, poi cliccare sul *Aggiungi* sotto la scritta *Ordinamento casuale* e selezionare *dal deposito domande*
3) Filtrare le domande in base alla categoria principale (es. xxx)
   - Cliccare su *Aggiungi condizione*
   - Filtra: `Tutto` 
   - cliccare su *Seleziona* ed selezioanare *Tag*
   - Cliccare su *Scrivi o seleziona* e selezionare il tag principale che compincia con `1_` (es. 1_phishing)
4) Cliccare su *Applica filtri*   


-----------

#### Argomento Giornata Formativa
Dobbiamo semplicemente aggiungere:
- Una risorsa *Area di testo e media* per mostrare del testo descrittivo
- Una risorsa *File* per poter inserire il file pdf con le slide
- Una risorse *Area di testo e media* per mostrare il video del corso.
  
Vediamo nel dettaglio

##### Inserimento testo descrittivo
Aggiungiamo la risorsa *Area di testo e media* per poter inserie del testo nell'introduzione. Per farlo clicchiamo su *Aggiungi un'attività o una risorsa* All'interno dell'argomento Giornata Formativa e poi clicchiamo su *Area di testo e media*. 
Non resta ora che scrivere qualche riga nel campo *Testo* e cliccare su *Salva e torna al corso*


##### Inserimento di un file
Aggiungiamo la risorsa *File* per poter inserie un file. Per farlo clicchiamo su *Aggiungi un'attività o una risorsa* All'interno dell'argomento Giornata Formativa e poi clicchiamo su *File*. 

Successivamente:
- impostiamo il campo *Nome* con `Slide del corso`
- Carichiamo il file trascinandolo nel riquadro presente nella sezione *Seleziona file* 

Completiamo cliccando su *Salva e torna al corso*


##### Inserimento di un video
In questo caso dovremo caricare il codice html necessario per mostrare il video.
Normalmente non è necessario scrivere a mano tale codice in quanto le piattaforme di streaming video lo generano comodamente per noi. Non resta che incollarlo. 
Ad esempio per la piattaforma youtube si deve:
- visualizzare il filmato da caricare
- cliccare sul pulsante *Condividi* e quindi su *Incorpora*. Verrà mostrato a video il codice html che sarà possibile copiare cliccando sul pulsante *Copia*.

Ora dobbiamo:
- aggiungere all'argomento *Giornata Formativa* una risorsa *Area di testo e media* come fatto in precedenza. 
- Aprire la risorsa appena aggiunta, andare nel campo testo ed abilitare la visualizzazione *Codice sorgente* cliccando su Visualizza/Codice sorgente nella risorse
- Incollare all'interno del campo testo il codice HTML copiato in precedenza

Non resta che salvare cliccando su *Salva e torna al corso*

-----------------

#### Argomento Sondaggio Finale
Ripetere quanto fatto per il sondaggio iniziale
