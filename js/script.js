$(function() {
    $( "input[type=submit]" )
        .button()
});

/*
$("#form1").submit(function(){
	var $txt = $(this).find("textarea");
	if (!$txt.html()) {
		$txt.html("'ddddd'");
	}
});
*/

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
			if(intest[i].innerHTML == "Variable")
				textarea.setAttribute("name", "txtNewVar");
			else if(intest[i].innerHTML == "Comment")
				textarea.setAttribute("name", "txtNewComm");
			else
				textarea.setAttribute("name", "txtNewNotes");
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
        $txt = $('<textarea>', {
            html: $this.text(),
			name: 'txtModComm'
        }).appendTo($this.empty());

		if($this[0].parentNode.getElementsByTagName("td")[0].childNodes.length == 1){
			$hid = $('<input>', {
				type: 'hidden',
				value: $this[0].parentNode.getElementsByTagName("td")[0].innerHTML,
				name: 'hidVariable'
			}).appendTo($this[0].parentNode.getElementsByTagName("td")[0]);
		}
    });

	$('.tdChangeNotes').on('dblclick', function() {
        $this = $(this);
        $txt = $('<textarea>', {
            html: $this.text(),
			name: 'txtModNotes'
        }).appendTo($this.empty());
		
		if($this[0].parentNode.getElementsByTagName("td")[0].childNodes.length == 1){
			$hid = $('<input>', {
				type: 'hidden',
				value: $this[0].parentNode.getElementsByTagName("td")[0].innerHTML,
				name: 'hidVariable'
			}).appendTo($this[0].parentNode.getElementsByTagName("td")[0]);
		}
    });
}