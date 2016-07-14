    <body>
        <!--- cfform per passare tutte le variabili al file "gestioneTabella.cfm" --->
        <cfform name="form" id="form1" action="gestioneTabella.cfm">
            <!--- si potrebbe utilizzare e cambiare per visualizzare dati diversi --->
            <cfset rigaInizio = 1>
            <!--- vengono utilizzati diversi div per una migliore gestione nel file di stile --->
            <div id="formContBtn">
                <!--- bottoni usati per salvare modifiche e nuovi dati o eliminare dati già esistenti --->
                <cfinput name="salvaDati" type="submit" id="btnSalva" value="Salva modifiche"></cfinput>
                <cfinput name="eliminaDati" type="submit" id="btnElimina" value="Elimina dati"></cfinput>
                <input name="txtCerca" type="text" id="txtCerca" placeholder="  Record variable da cercare">
                <cfinput name="cercaVar" type="submit" id="btnCerca" value="Cerca variable"></cfinput>
            </div>
            
            <!--- dialog di conferma di eliminazione dei dati --->
            <div id="dialogElimCompletata" title="Eliminazione dati">
                <p>I dati sono stati eliminati correttamente.</p>
            </div> 

            <!--- dialog di conferma di salvataggio dei dati --->
            <div id="dialogSalva" title="Salvataggio dati">
                <p>I dati sono stati salvati correttamente.</p>
            </div> 

            <!--- dialog quando si cerca di fare il submit di eliminazione senza aver selezionato nessuna checkbox --->
            <div id="dialogCB" title="Errore">
                <p>Seleziona almeno una checkbox.</p>
            </div> 
            
            <!--- dialog di errore nel caso un dato fosse già esistente --->
            <div id="dialogDatoEsist" title="Errore">
                <p>Dato nel campo "Variable" già esistente.</p>
            </div> 
            
            <!--- dialog di errore nel caso non fosse stato inserito il campo "variable" di un nuovo dato --->
            <div id="dialogInsVar" title="Errore">
                <p>Inserisci il nuovo dato nel campo "Variable".</p>
            </div> 
            
            <div id="divTabella">
                <table id="tabDati">
                    <!--- richiamo la funzione che alimenta la tabella --->
                    <cfinvoke component="funzioni" method = "alimTabella">
                        <cfinvokeargument name="rigaInizio" value="#rigaInizio#">
                    </cfinvoke>
                </table>

                <!--- richiamo la funzione JS che inserisce la riga nuova al fondo della tabella --->
                <script type="text/javascript">
                    rigaVuota();
                </script>
            </div>
        </cfform>
    </body>
</html>