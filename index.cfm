    <body>
        <!--- utilizzo un cfform per passare tutte le variabili al file "gestioneTabella.cfm" --->
        <cfform name="form" id="form1" action="gestioneTabella.cfm">
            <cfset rigaInizio = 1>
            <!--- utilizzo diversi div per una migliore gestione nel file di stile --->
            <div id="formContBtn">
                <!--- bottoni usati per salvare modifiche e nuovi dati o eliminare dati già esistenti --->
                <cfinput name="salvaDati" type="submit" id="btnSalva" value="Salva modifiche"></cfinput>
                <cfinput name="eliminaDati" type="submit" id="btnElimina" value="Elimina dati"></cfinput>
            </div>

            <div id="divTabella">
                <table id="tabDati">
                    <!--- riga di intestazione --->
                    <tr class="color1">
                        <th>Variable</th>
                        <th>Comment</th>
                        <th>Origin</th>
                        <th>Notes</th>
                        <th>Ticket</th>
                        <th>Summary</th>
                        <th>Description</th>
                        <th>Additional information</th>
                        <th>Elimina</th>
                    </tr>
                    
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