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

function disabilitaTD() {
	$('.noChange').off('dblclick');
}

function abilitaTD() {
    $('.tdChangeComm').on('dblclick', function() {
        $this = $(this);
        $hid = $('<input>', {
			type: 'hidden',
            value: $this.text(),
			name: 'hidModComm'
        }).appendTo($this.empty());

        $txt = $('<textarea>', {
            html: $hid.val(),
			name: 'txtModComm'
        }).appendTo($this);
    });

	$('.tdChangeNotes').on('dblclick', function() {
        $this = $(this);
        $hid = $('<input>', {
			type: 'hidden',
            value: $this.text(),
			name: 'hidModNotes'
        }).appendTo($this.empty());

        $txt = $('<textarea>', {
            html: $hid.val(),
			name: 'txtModNotes'
        }).appendTo($this);
    });
}