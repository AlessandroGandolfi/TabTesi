<cfobject component="funzioni" name="objGestione">
<!--- controllo quale bottone sia stato premuto, per eseguire funzioni diverse --->
<cfif StructKeyExists(form, "eliminaDati")>
    <!--- controllo che almeno una checkbox sia stata checkata --->
    <cfif IsDefined("cbElimina")>
        <!--- avvio delle funzioni per l'eliminazione dei dati --->
        <cfinvoke component="#objGestione#" method="eliminaDati">
            <cfinvokeargument name="cbElimina" value="#form.cbElimina#">
        </cfinvoke>
    </cfif>
    <!--- dopo aver finito le eliminazioni ricarico la pagina per la visualizzazione dei dati --->
    <cflocation url="index.cfm">
</cfif>

<cfif StructKeyExists(form, "salvaDati")>
    <!--- se sono state aperte delle textarea nella colonna "Comment" aggiorno le caselle interessate --->
    <cfif IsDefined("txtModComm")>
        <cfinvoke component="#objGestione#" method="salvaModificheComm">
            <cfinvokeargument name="testoModificatoComm" value="#form.txtModComm#">
            <cfinvokeargument name="variableRiga" value="#form.hidVariable#">
        </cfinvoke>
    </cfif>
    
    <!--- se sono state aperte delle textarea nella colonna "Notes" aggiorno le caselle interessate --->
    <cfif IsDefined("txtModNotes")>
        <cfinvoke component="#objGestione#" method="salvaModificheNotes">
            <cfinvokeargument name="testoModificatoNotes" value="#form.txtModNotes#">
            <cfinvokeargument name="variableRiga" value="#form.hidVariable#">
        </cfinvoke>
    </cfif>

    <!--- se è stato inserito qualcosa nella textarea della colonna "Variable" salvo un nuovo dato --->
    <cfif IsDefined("txtNewVar")>
        <cfinvoke component="#objGestione#" method="salvaNuovoDato">
            <cfinvokeargument name="newVariable" value="#form.txtNewVar#">
            <!--- anche se non fossero stati inseriti dati nelle textarea "Comment" e "Notes" passo stringhe vuote --->
            <cfinvokeargument name="newComment" value="#form.txtNewComm#">
            <cfinvokeargument name="newNotes" value="#form.txtNewNotes#">
        </cfinvoke>
    </cfif>

    <!--- dopo aver completato le funzioni di salvataggio dati richiamo la pagina di visualizzazione dati --->
    <cflocation url="index.cfm">
</cfif>