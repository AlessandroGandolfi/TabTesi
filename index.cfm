    <body>
        <!--- utilizzo un cfform per passare tutte le variabili al file "gestioneTabella.cfm" --->
        <form name="form" id="form1" action="gestioneTabella.cfm">
            <cfset rigaInizio = 1>
            <!--- utilizzo diversi div per una migliore gestione nel file di stile --->
            <div id="formContBtn">
                <!--- bottoni usati per salvare modifiche e nuovi dati o eliminare dati già esistenti --->
                <input name="salvaDati" type="submit" id="btnSalva" value="Salva modifiche">
                <input name="eliminaDati" type="submit" id="btnElimina" value="Elimina dati">
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
                    
                    <cfinvoke component="funzioni" method = "alimTabella">
                        <cfinvokeargument name="rigaInizio" value="#rigaInizio#">
                    </cfinvoke>
                </table>
            </div>
        </form>
    </body>
</html>