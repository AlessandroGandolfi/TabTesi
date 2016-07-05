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
    
    <!---
    <cffunction name="salvaModifiche" access="remote">
        <cfquery datasource="#application.DSN#" name="salvaModificheDB">
            update tesikcm.v_dictionary_mantis
            set 
            where 
        </cfquery>
        <cfmessagebox type="alert" name="mbSalvaMod" message="Modifiche salvate"/>
    </cffunction>
    --->
</cfcomponent>