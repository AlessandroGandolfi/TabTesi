<cfquery datasource="#application.DSN#" name="selectDati">
    select *
    from tesikcm.v_dictionary_mantis
</cfquery>

<cfform name="form" action="gestioneTabella.cfm">
    <cfdiv id="formContBtn">
        <cfinput name="salvaDati" type="submit" id="btnSalva" value="Salva modifiche">
        <cfinput name="eliminaDati" type="submit" id="btnElimina" value="Elimina dati">
    </cfdiv>

    <cfdiv id="divTabella">
        <table>
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
            <cfoutput maxRows="5" query="selectDati">
                <tr class="<cfif (selectDati.currentRow MOD 2 EQ 0)>color1<cfelse>color2</cfif>">
                    <td>#variable#</td>
                    <td>#comment#</td>
                    <td>#origin#</td>
                    <td>#NOTES#</td>
                    <td>#ticket#</td>
                    <td>#summary#</td>
                    <td>#description#</td>
                    <td>#additional_information#</td>
                    <td><cfinput name="cbElimina" type="checkbox" value="#variable#"></cfinput></td>
                </tr>
            </cfoutput>
        </table>
    </cfdiv>
</cfform>