<!--- applicazione del sito, definizione del nome e attivazione delle variabili di sessione --->
<cfapplication name="tabDatiTesi" sessionManagement="Yes">
<!--- salvataggio del nome del database in una variabile disponibile a tutte le pagine --->
<cfset application.DSN = "tesikcm">
<!DOCTYPE html>
<html lang="en">
	<head>
        <meta charset="utf-8">
        <!--- riferimenti alle librerie JS e CSS di jQuery --->
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="js/jquery-3.0.0.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <!--- riferimento al file di stile utilizzato per l'aspetto degli elementi delle pagine --->
        <link rel="stylesheet" href="css/stile.css">
        <!--- riferimento allo script JS utilizzato per funzioni principalmente riguardanti 
        la gestione dei tag HTML tramite DOM e le applicazioni delle librerie grafiche jQuery --->
        <script src="js/script.js" type="text/javascript"></script>
    </head>