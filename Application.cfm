<cfapplication name="tabDatiTesi" sessionManagement="Yes">
<cfset application.DSN = "tesikcm">

<link href="css/stile.css" rel="stylesheet"/>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function() {
        $( "input[type=submit]" )
            .button()
    });
</script>