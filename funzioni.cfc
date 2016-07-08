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
            where dictionarytickets.dictionaryid in (#ArrayToList(arrayID,",")#)
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
                <td class="tdChangeComm">#comment#</td>
                <td>#origin#</td>
                <td class="tdChangeNotes">#NOTES#</td>
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
    <cffunction name="salvaModificheComm" access="remote">
        <cfset listModComm = ListQualify(testoModificatoComm,"'")>
        <cfset listOrigComm = ListQualify(testoOriginaleComm,"'")>
        <cfset arrayModComm = ListToArray(listModComm,",",true,false)>
        <cfset arrayOrigComm = ListToArray(listOrigComm,",",true,false)>

        <cfloop index="indexLoop" from="0" to="#ArrayLen(arrayModComm)#">
            <cfquery name="aggiornaComm" datasource="#application.DSN#">
                update tesikcm.dictionary
                set COMMENT = #arrayModComm[indexLoop]#
                where COMMENT = #arrayOrigComm[indexLoop]#
            </cfquery>
        </cfloop>
    </cffunction>
    --->

    <cffunction name="salvaModificheNotes" access="remote">
        <cfset arrayModNotes = ListToArray(testoModificatoNotes,",",true,false)>
        <cfset arrayOrigNotes = ListToArray(testoOriginaleNotes,",",true,false)>
        <cfdump var = "#arrayOrigNotes#">
        <!---
        <cfloop index="indexNotes" from="1" to="#ArrayLen(arrayModNotes)#">
            <cfquery name="aggiornaNotes" datasource="#application.DSN#">
                update tesikcm.dictionary
                set NOTES = "'"&#arrayModNotes[indexNotes]#&"'"
                where NOTES = "'"&#arrayOrigNotes[indexNotes]#&"'"
            </cfquery>
        </cfloop>
        --->
    </cffunction>

</cfcomponent>