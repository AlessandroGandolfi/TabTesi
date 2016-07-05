<cfobject component="funzioni" name="objGestione">

<!--- controllo quale bottone sia stato premuto, per eseguire funzioni diverse --->
<cfif StructKeyExists(form, "eliminaDati")>
    <!--- controllo che almeno una checkbox sia stata checkata --->
    <cfif IsDefined("cbElimina")>
        <!--- chiedo conferma delle eliminazioni nel database --->
        <cfmessagebox type="confirm" name="mboxElimina" buttonType="yesno" message="Eliminare i dati definitivamente?">
        <script type="text/javascript">
            apriMB("mboxElimina");
        </script>
        <!--- avvio delle funzioni per l'eliminazione dei dati --->
        <cfinvoke component="#objGestione#" method="eliminaDati">
            <cfinvokeargument name="cbElimina" value="#form.cbElimina#">
        </cfinvoke>
        <!--- avviso l'utente che i dati sono stati eliminati definitivamente --->
        <cfmessagebox type="alert" name="mboxConfElim" message="Dati eliminati">
        <script type="text/javascript">
            apriMB("mboxConfElim");
        </script>
        <!--- se nessuna checkbox è stata checkata mostro un messaggio di errore --->
        <cfelse>
            <cfmessagebox name="mboxNoCB" type="alert" message="Errore:\nNon sono state selezionate checkbox.\nPer eliminare i dati seleziona la checkbox a fine della riga nella tabella.">
            <script type="text/javascript">
                apriMB("mboxNoCB");
            </script>
    </cfif>
</cfif>

<cfif StructKeyExists(form, "salvaDati")>

</cfif>