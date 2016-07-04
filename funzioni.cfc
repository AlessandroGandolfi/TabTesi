<cfcomponent>
    <cffunction name="eliminaDati" access="remote">
        <cfmessagebox type="confirm" name="mbEliminaConferma" buttonType="yesno" message="Eliminare i dati definitivamente?"/>
        <cfquery datasource="#application.DSN#" name="eliminaDatiDB">
            delete from dictionary left join dictionarytickets on (dictionary.ID = dictionarytickets.dictionaryid)
            where VARIABLE in (#ListQualify(form.cbElimina,"'")#)
        </cfquery>
        <cfmessagebox type="alert" name="mbElimina" message="Dati eliminati"/>
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