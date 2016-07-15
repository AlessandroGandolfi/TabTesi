<cfobject component="funzioni" name="objGestione">

<cfdump var = "#form#">
<!--- controllo quale bottone sia stato premuto, per eseguire funzioni diverse --->
<cfif StructKeyExists(form, "eliminaDati")>
    <!--- controllo che almeno una checkbox sia stata checkata --->
    <cfif IsDefined("cbElimina")>
        <!--- avvio delle funzioni per l'eliminazione dei dati --->
        <cfinvoke component="#objGestione#" method="eliminaDati">
            <cfinvokeargument name="cbElimina" value="#form.cbElimina#">
        </cfinvoke>
    </cfif>
    <!--- dopo aver finito le eliminazioni viene ricaricata la pagina per la visualizzazione dei dati --->
    <cflocation url="index.cfm">
</cfif>

<cfif StructKeyExists(form, "salvaDati")>
	<!--- se sono state aperte delle textarea nella colonna "Comment" vengono aggiornate le caselle interessate --->
    <cfif IsDefined("txtModComm")>
        <!--- avvio delle funzioni per il salvataggio delle modifiche dei record "Comment" --->
        <cfinvoke component="#objGestione#" method="salvaModificheComm">
            <cfinvokeargument name="testoModificatoComm" value="#form.txtModComm#">
            <cfinvokeargument name="variableRiga" value="#form.hidVariable#">
        </cfinvoke>
    </cfif>
    
    <!--- se sono state aperte delle textarea nella colonna "Notes" vengono aggiornate le caselle interessate --->
    <cfif IsDefined("txtModNotes")>
        <!--- avvio delle funzioni per il salvataggio delle modifiche dei record "Notes" --->
        <cfinvoke component="#objGestione#" method="salvaModificheNotes">
            <cfinvokeargument name="testoModificatoNotes" value="#form.txtModNotes#">
            <cfinvokeargument name="variableRiga" value="#form.hidVariable#">
        </cfinvoke>
    </cfif>

    <!--- se è stato inserito qualcosa nella textarea della colonna "Variable" viene salvato un nuovo dato --->
    <cfif IsDefined("txtNewVar")>
        <!--- avvio delle funzioni per il salvataggio di nuovi dati --->
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

<cfif StructKeyExists(form, "cercaVar")>
    <cfif form.txtCerca neq "">
        <!--- il record cercato viene passato come parametro tramite l'URL --->
        <cflocation url="ricercaRecord.cfm?varInserita=#form.txtCerca#">
        <!--- nel caso la textbox fosse vuota viene ricaricata la pagina principale --->
        <cfelse>
            <cflocation url="index.cfm">
    </cfif>
</cfif>