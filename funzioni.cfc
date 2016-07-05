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
        
    <cffunction name="rigaVuota" access="remote">
        <cfset nuovaRiga = "<tr>
                                <td><cftextarea validateAt='onSubmit' name='txtNewVar'></cftextarea></td>
                                <td><cftextarea validateAt='onSubmit' name='txtNewCom'></cftextarea></td>
                                <td></td>
                                <td><cftextarea validateAt='onSubmit' name='txtNewNotes'></cftextarea></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>">
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