<!--- istanzio l'applicazione del sito, definendone il nome e attivando le variabili di sessione --->
<cfapplication name="tabDatiTesi" sessionManagement="Yes">
<!--- salvo il nome del database in una variabile disponibile a tutte le pagine --->
<cfset application.DSN = "tesikcm">
<!DOCTYPE html>
<html lang="en">
	<head>
        <meta charset="utf-8">
        <!--- aggiungo i riferimenti alle librerie JS e CSS di jQuery --->
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="js/jquery-1.10.2.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <!--- aggiungo il riferimento al file di stile utilizzato per l'aspetto degli elementi delle pagine --->
        <link rel="stylesheet" href="css/stile.css">
        <!--- aggiungo il riferimento allo script JS utilizzato per funzioni principalmente riguardanti 
        la gestione dei tag HTML tramite DOM e le applicazioni delle librerie grafiche jQuery --->
        <script src="js/script.js" type="text/javascript"></script>
    </head>