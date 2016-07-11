<cfobject component="funzioni" name="objGestione">
<!--- controllo quale bottone sia stato premuto, per eseguire funzioni diverse --->
<cfif StructKeyExists(form, "eliminaDati")>
    <!--- controllo che almeno una checkbox sia stata checkata --->
    <cfif IsDefined("cbElimina")>
        <!--- chiedo conferma delle eliminazioni nel database 
        <cfmessagebox type="confirm" name="mboxElimina" title="Conferma eliminazione" buttonType="yesno" message="Eliminare i dati selezionati definitivamente?"/>
        <script type="text/javascript">
            apriMB("mboxElimina");
        </script>
        --->        
        <!--- avvio delle funzioni per l'eliminazione dei dati --->
        <cfinvoke component="#objGestione#" method="eliminaDati">
            <cfinvokeargument name="cbElimina" value="#form.cbElimina#">
        </cfinvoke>
        <!--- avviso l'utente che i dati sono stati eliminati definitivamente 
        <cfmessagebox type="alert" name="mboxConfElim" title="Eliminazione effettuata" message="I dati selezionati sono stati eliminati."/>
        <script type="text/javascript">
            apriMB("mboxConfElim");
        </script>
        --->
        <cfelse>
            <!--- se nessuna checkbox è stata checkata mostro un messaggio di errore 
            <cfmessagebox name="mboxNoCB" type="alert" title="Errore" message="Non sono state selezionate checkbox.\nPer eliminare i dati seleziona la checkbox a fine della riga nella tabella."/>
            <script type="text/javascript">
                apriMB("mboxNoCB");
            </script>
            --->
    </cfif>
    <!--- dopo aver finito le eliminazioni ricarico la pagina per la visualizzazione dei dati --->
    <cflocation url="index.cfm">
</cfif>

<cfif StructKeyExists(form, "salvaDati")>
    
    <cfif IsDefined("txtModComm")>
        <cfinvoke component="#objGestione#" method="salvaModificheComm">
            <cfinvokeargument name="testoModificatoComm" value="#form.txtModComm#">
            <cfinvokeargument name="variableRiga" value="#form.hidVariable#">
        </cfinvoke>
    </cfif>
    
    <cfif IsDefined("txtModNotes")>
        <cfinvoke component="#objGestione#" method="salvaModificheNotes">
            <cfinvokeargument name="testoModificatoNotes" value="#form.txtModNotes#">
            <cfinvokeargument name="variableRiga" value="#form.hidVariable#">
        </cfinvoke>
    </cfif>

    <cfif IsDefined("txtNewVar")>
        <cfinvoke component="#objGestione#" method="salvaNuovoDato">
            <cfinvokeargument name="newVariable" value="#form.txtNewVar#">
            <cfinvokeargument name="newComment" value="#form.txtNewComm#">
            <cfinvokeargument name="newNotes" value="#form.txtNewNotes#">
        </cfinvoke>
    </cfif>

    <cflocation url="index.cfm">
</cfif>