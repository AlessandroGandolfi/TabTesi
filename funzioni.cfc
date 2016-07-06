<cfcomponent>
    <cffunction name="eliminaDati" access="remote">
        <!--- eseguo diverse query perchè non posso eliminare i dati direttamente dalla vista del database --->
        <!--- seleziono gli ID della tabella "dictionary" tramite una query e li salvo in un array --->
        <cfquery name="getDictionaryID" datasource="#application.DSN#">
            select ID
            from dictionary
            where VARIABLE in (#ListQualify(cbElimina,"'")#)
        </cfquery>

        <cfset arrayID = ArrayNew(1)>
        <cfloop index="indexLoop" from="1" to="#getDictionaryID.RecordCount#">
            <cfset arrayID[#indexLoop#] = "'"&getDictionaryID.ID[#indexLoop#]&"'">
        </cfloop>
        
        <!--- tramite gli array elimino le righe della tabella "dictionarytickets" usate per fare il join dei dati che verranno eliminati --->
        <cfquery name="eliminaDatiDatabaseTickets" datasource="#application.DSN#">
            delete from tesikcm.dictionarytickets
            where dictionarytickets.dictionaryid in (#ArrayToList(arrayID, ",")#)
        </cfquery>

        <!--- elimino i dati dalla tabella "dictionary" --->
        <cfquery datasource="#application.DSN#" name="eliminaDatiDatabase">
            delete from tesikcm.dictionary
            where VARIABLE in (#ListQualify(cbElimina,"'")#)
        </cfquery>
    </cffunction>

    <cffunction name="alimTabella" access="remote">
        <!--- utilizzo una query per prendere i dati dal database sul server --->
        <cfquery datasource="#application.DSN#" name="selectDati">
            select *
            from tesikcm.v_dictionary_mantis
        </cfquery>
    
        <cfoutput startRow="#rigaInizio#" maxRows="5" query="selectDati">
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
                <td><input name="cbElimina" type="checkbox" value="#variable#"></td>
            </tr>
        </cfoutput>
        <script type="text/javascript">
            rigaVuota();
        </script>
    </cffunction>

    <!---
    <cffunction name="salvaModifiche" access="remote">
        <cfquery datasource="#application.DSN#" name="salvaModificheDatabase">
            update tesikcm.dictionary
            set COMMENT= ,NOTES = 
            where 
        </cfquery>
        <cfmessagebox type="alert" name="mbSalvaMod" message="Modifiche salvate"/>
    </cffunction>
    --->
</cfcomponent>