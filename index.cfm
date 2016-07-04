<cfquery datasource="#application.DSN#" name="selectDati">
    select *
    from tesikcm.v_dictionary_mantis
</cfquery>

<cfform id="formContBtn">
    <cfinput name="btnSalva" type="button" id="btnSalva" value="Salva modifiche">
    <cfinput name="btnElimina" type="button" id="btnElimina" value="Elimina dati">
</cfform>

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
        </tr>
        <cfoutput maxRows="4" query="selectDati">
            <tr class="<cfif (selectDati.currentRow MOD 2 EQ 0)>color1<cfelse>color2</cfif>">
                <td>#variable#</td>
                <td>#comment#</td>
                <td>#origin#</td>
                <td>#NOTES#</td>
                <td>#ticket#</td>
                <td>#summary#</td>
                <td>#description#</td>
                <td>#additional_information#</td>
            </tr>
        </cfoutput>
    </table>
</cfdiv>

<!---
<cfdiv id="divTabella">
    <cftable query="selectDati" maxRows="3" startRow="1" htmltable>
        <cfcol header="<b>variable</b>" align="left" text="#variable#">
        <cfcol header="<b>comment</b>" align="left" text="#comment#">
        <cfcol header="<b>origin</b>" align="left" text="#origin#">
        <cfcol header="<b>NOTES</b>" align="left" text="#NOTES#">
        <cfcol header="<b>ticket</b>" align="left" text="#ticket#">
        <cfcol header="<b>summary</b>" align="left" text="#summary#">
        <cfcol header="<b>description</b>" align="left" text="#description#">
        <cfcol header="<b>additional_information</b>" align="left" text="#additional_information#">
    </cftable>
</cfdiv>
--->