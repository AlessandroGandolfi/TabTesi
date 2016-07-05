<!--- istanzio l'applicazione del sito, definendone il nome e attivando le variabili di sessione --->
<cfapplication name="tabDatiTesi" sessionManagement="Yes">
<!--- salvo il nome del database in una variabile disponibile a tutte le pagine --->
<cfset application.DSN = "tesikcm">

<!--- aggiungo i riferimenti alle librerie JS e CSS di jQuery --->
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>
<!--- aggiungo il riferimento al file di stile utilizzato per l'aspetto degli elementi delle pagine --->
<link rel="stylesheet" href="css/stile.css">
<!--- aggiungo il riferimento a uno script contenente funzioni JS (jQuery) 
utilizzate nel codice o per applicare le librerie jQuery agli elementi delle pagine --->
<script type="text/javascript">
    $(function() {
        $( "input[type=submit]" )
            .button()
    });

    function apriMB(mbox)  { 
        ColdFusion.MessageBox.show(mbox); 
    } 
</script>