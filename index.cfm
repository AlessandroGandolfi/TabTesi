<!--- utilizzo una query per prendere i dati dal database sul server --->
<cfquery datasource="#application.DSN#" name="selectDati">
    select *
    from tesikcm.v_dictionary_mantis
</cfquery>

<!--- utilizzo un cfform per passare tutte le variabili al file "gestioneTabella.cfm" --->
<cfform name="form" id="form1" action="gestioneTabella.cfm">
    <!--- utilizzo diversi div per una migliore gestione nel file di stile --->
    <cfdiv id="formContBtn">
        <!--- bottoni usati per salvare modifiche e nuovi dati o eliminare dati già esistenti --->
        <cfinput name="salvaDati" type="submit" id="btnSalva" value="Salva modifiche">
        <cfinput name="eliminaDati" type="submit" id="btnElimina" value="Elimina dati">
    </cfdiv>

    <cfdiv id="divTabella">
        <table>
            <!--- riga di intestazione --->
            <tr class="color1">
                <th>variable</th>
                <th>comment</th>
                <th>origin</th>
                <th>NOTES</th>
                <th>ticket</th>
                <th>summary</th>
                <th>description</th>
                <th>additional_information</th>
                <th>Elimina</th>
            </tr>
            <!--- alimentazione della tabella tramite la query "selectDati" --->
            <cfoutput maxRows="5" query="selectDati">
                <!--- utilizzo due classi diverse per applicare i colori alle righe --->
                <tr class="<cfif (selectDati.currentRow MOD 2 EQ 0)>color1<cfelse>color2</cfif>">
                    <td>#variable#</td>
                    <td class="tdChange">#comment#</td>
                    <td>#origin#</td>
                    <td class="tdChange">#NOTES#</td>
                    <td>#ticket#</td>
                    <td>#summary#</td>
                    <td>#description#</td>
                    <td>#additional_information#</td>
                    <!--- utilizzo la checkbox in questa casella nel caso dovesse essere eliminata --->
                    <td><cfinput name="cbElimina" type="checkbox" value="#variable#"></cfinput></td>
                </tr>
            </cfoutput>
        </table>
        <!---
        <script type="text/javascript">
            abilitaTD();
        </script>
        --->
    </cfdiv>
</cfform>