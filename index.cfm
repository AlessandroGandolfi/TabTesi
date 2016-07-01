<cfquery datasource="tesikcm" name="selectDati">
    select *
    from tesikcm.v_dictionary_mantis
</cfquery>

<table>
    <tr>
        <th>variable</th>
        <th>comment</th>
        <th>origin</th>
        <th>NOTES</th>
        <th>ticket</th>
        <th>summary</th>
        <th>description</th>
        <th>additional_information</th>
    </tr>
    <cfoutput query="selectDati">
        <tr>
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