# Progetto-Allos - Daniele Amato

Prima di iniziare con il test vero e proprio, bisogna fare:
1) Avviare MAMP
2) Creare database "prenotazioni_aeree";
3) Avviare il file PrenotazioniAereeApplication.java dal package Allos.Project.PrenotazioniAeree; 
4) Fare gli inserimenti delle row all'interno del DB, trovate lo script degli insert nel file "InserimentiDB.sql";
5) Da Eclipse avviare dal Package Explore il progetto "PrenotazioniAeree" con tasto destro -> Run As > Run on Server;
6) Eseguiti i passaggi precedenti, ci troviamo nella pagina principale del sito.
Il database viene gestito con MySQL

ps. il progetto si divide in Guest per il funzionamento principale, ed in Admin per tutta la gestione dei vari dati.

-GUEST
Nella pagina principale troviamo un form per la ricerca di un volo, dove abbiamo la possibilità di scegliere le città, il giorno, il numero dei passeggeri ed infine trovare dei voli di Andata o Andata/Ritorno, sempre sulla pagina principale più giù troviamo dei voli in offerta con un immagine semplice dove ci andranno le immagini delle varie città, aggiornandosi ogni volta al caricamento della pagina.
Una volta cercato un volo ci troviamo nella pagina dei voli trovati, ed una volta selezionato il nostro volo ci troveremo nella pagina della creazione dei biglietti, dove abbiamo il volo scelto ed in base a quanti passeggeri siamo, andiamo a creare tot biglietti.

N.B. Prima di creare i biglietti e procedendo all'acquisto, dalla pagina principale sulla navbar bisogna crearsi un'account e fare il login.

Creati i nostri biglietti e procedendo con il checkout, ci troveremo nella pagine finale appunto del checkout dove mettendo i nostri dati faremo l'acquisto dei biglietti, ad ogni acquisto andremo a scalare il numero dei passeggeri di quel specifico volo, in base a quanti biglietti andremo a fare.

Una volta fatto il login sulla navbar ci sarà il nostro nome che è un dropdown, dove possiamo trovare "Profilo" ed "Logout".
1) Su profilo abbiamo i dettagli nel nostro account e la possibilià di fare le modifiche, la possibilià di eliminare l'account ed infine trovermo la sezione Prenotazioni, con le prenotazioni fatte da noi.
2) Essendo che il login viene gestito con la sessione, con il logout andiamo ad ammazzare la sessione e quindi fare il logout.

*TUTTE LE VARIE FORM DEI DATI VENGONO GESTITE CON DELLE VALIDAZIONI DEI DATI DI BOOTSTRAP* 

-ADMIN
Per arrivare al lato admin, nella pagina iniziale sulla form per il login inserire i seguenti dati email=user@admin.it, password=password.
Arriviamo ad un'altra pagina di login con i dati già inseriti, fare il login e ci troviamo nella homepage, dove abbiamo una navbar con vari link delle liste.
Ad ogni lista abbiamo la possibilià di aggiungere nuove informazioni, la possibilià di ricercare per una keyword ed infine abbiamo la tabella gestita con l'impaginazione, dai vari button sottostante alle tabelle per il funzionamento.
Su ogni riga di una tabella, abbiamo due button "Cancella" e "Modifica", che sono dei modali per i vari funzionamenti, gestisti tramite gli script con jQuery.
