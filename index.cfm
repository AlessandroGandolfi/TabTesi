<cfquery datasource="#application.DSN#" name="selectDati">
    select *
    from tesikcm.v_dictionary_mantis
</cfquery>

<cfdiv id="divContBtn">

</cfdiv>

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