$(function() {
    $( "input[type=submit]" )
        .button()
});

function apriMB(mbox)  { 
    ColdFusion.MessageBox.show(mbox); 
}

function rigaVuota() {
	var table = document.getElementById("tabDati");
	var intest = table.getElementsByTagName("tbody")[0].firstChild.getElementsByTagName("th");
	var tr = document.createElement("tr");
	if(table.getElementsByTagName("tbody")[0].lastChild.className == "color1")
		tr.setAttribute("class", "color2");
	else
		tr.setAttribute("class", "color1");
		
	for(var i = 0; i < intest.length; i++)
	{	
		var td = document.createElement("td");
		if(intest[i].innerHTML == "Variable" || intest[i].innerHTML == "Comment" || intest[i].innerHTML == "Notes"){
			var textarea = document.createElement("textarea");
			td.appendChild(textarea);
			td.setAttribute("class", "tdChange");
		}
		tr.appendChild(td);
	}
	table.childNodes[1].appendChild(tr);
	
	abilitaTD();
}

function aggiornaComment() {
	var table = document.getElementById("tabDati").getElementsByTagName("tbody")[0];

	for(var i = 1; i < table.getElementsByTagName("tr").length; i++){
		console.log(table.getElementsByTagName("tr")[i].getElementsByTagName("td")[1].innerHTML);
	}
}

function disabilitaTD() {
	$('.noChange').off('dblclick');
}

function abilitaTD() {
    $('.tdChange').on('dblclick', function() {
        $this = $(this);
        $input = $('<textarea>', {
            html: $this.text(),
            submit: function() {
                $this.html($input.val());
            }
        }).appendTo($this.empty());
    });
}