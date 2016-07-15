    <body>
     <!--- cfform per passare tutte le variabili al file "gestioneTabella.cfm" --->
        <cfform name="form" id="form1" action="gestioneTabella.cfm">
            <!--- vengono utilizzati diversi div per una migliore gestione nel file di stile --->
            <div id="formContBtn">
                <!--- bottoni usati per salvare, modificare, eliminare o cercare i dati nel database --->
                <cfinput name="salvaDati" type="submit" id="btnSalva" value="Salva modifiche"></cfinput>
                <cfinput name="eliminaDati" type="submit" id="btnElimina" value="Elimina dati"></cfinput>
                <input name="txtCerca" type="text" id="txtCerca" placeholder="  Inserisci il record variable">
                <cfinput name="cercaVar" type="submit" id="btnCerca" value="Cerca variable"></cfinput>
            </div>

            <div id="divTabella">
                <table id="tabDati">
                    <!--- richiamo della funzione che alimenta la tabella con i dati del record cercato --->
                    <cfinvoke component="funzioni" method="visualizzaVariabile">
                        <cfinvokeargument name="varInserita" value="#URL.varInserita#">
                    </cfinvoke>
                </table>

                <!--- richiamo della funzione JS che inserisce la riga nuova al fondo della tabella --->
                <script type="text/javascript">
                    rigaVuota();
                </script>
            </div>
        </cfform>
    </body>
</html>