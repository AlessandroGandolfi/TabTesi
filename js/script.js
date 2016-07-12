/* funzione per applicare le librerie grafiche di jQuery ai bottoni del submit */
$(function() {
    $( "input[type=submit]" )
        .button()
});

/* funzione per aggiungere la riga vuota di inserimento di nuovi dati al fondo della tabella */
function rigaVuota() {
	var table = document.getElementById("tabDati");
	/* riga di intestazione */
	var intest = table.getElementsByTagName("tbody")[0].firstChild.getElementsByTagName("th");
	/* creazione della nuova riga */
	var tr = document.createElement("tr");

	/* viene applicata la classe di colori alla nuova riga diversa da quella della riga precedente */
	if(table.getElementsByTagName("tbody")[0].lastChild.className == "color1")
		tr.setAttribute("class", "color2");
	else
		tr.setAttribute("class", "color1");
		
	for(var i = 0; i < intest.length; i++)
	{	
		/* creo una cella per ogni cella presente nell'intestazione */
		var td = document.createElement("td");

		if(intest[i].innerHTML == "Variable" || intest[i].innerHTML == "Comment" || intest[i].innerHTML == "Notes"){
			/* nel caso la casella fosse appartenente al campo "Variable", "Comment" o "Notes" creo una textarea */
			var textarea = document.createElement("textarea");
			/* assegno alla textarea un nome in base al campo a cui appartiene per passare i dati tramite il submit */
			if(intest[i].innerHTML == "Variable")
				textarea.setAttribute("name", "txtNewVar");
			else if(intest[i].innerHTML == "Comment")
				textarea.setAttribute("name", "txtNewComm");
			else
				textarea.setAttribute("name", "txtNewNotes");
			/* aggiungo la textarea alla casella */
			td.appendChild(textarea);
			// td.setAttribute("class", "tdChange");
		}
		tr.appendChild(td);
	}
	/* aggiungo la riga alla tabella */
	table.childNodes[1].appendChild(tr);
	
	abilitaTD();
}

/* funzione che abilita il doppio click sulle td per fare comparire le textarea */
function abilitaTD() {
	/* parte riguardante le td dei commenti */
    $('.tdChangeComm').on('dblclick', function() {
		/* $(this) è in questo caso un vettore contenente solo la td clickata */
        $this = $(this);
		/* creo il tag della textarea, assegnandoli un nome e il contenuto della td, per poi aggiungerla all'interno della td stessa */
        $txt = $('<textarea>', {
            html: $this.text(),
			name: 'txtModComm'
        }).appendTo($this.empty());

		/* nel caso qualcuno volesse modificare commento e note con un solo submit, controllo che non ci sia già un input hidden nella td variable della riga */
		/* uso questo tag input di tipo nascosto per poter eseguire le query nelle funzioni, essendo le variabili dei dati univoche */
		if($this[0].parentNode.getElementsByTagName("td")[0].childNodes.length == 1){
			$hid = $('<input>', {
				type: 'hidden',
				/* le assegno il valore della variabile della riga dove è stata creata una textarea tramite doppio click */
				value: $this[0].parentNode.getElementsByTagName("td")[0].innerHTML,
				name: 'hidVariable'
			/* la aggiungo alla td del campo "Variable" della riga */
			}).appendTo($this[0].parentNode.getElementsByTagName("td")[0]);
		}
    });

	/* parte riguardante le td delle note */
	$('.tdChangeNotes').on('dblclick', function() {
		/* $(this) è in questo caso un vettore contenente solo la td clickata */
        $this = $(this);
		/* creo il tag della textarea, assegnandoli un nome e il contenuto della td, per poi aggiungerla all'interno della td stessa */
        $txt = $('<textarea>', {
            html: $this.text(),
			name: 'txtModNotes'
        }).appendTo($this.empty());
		
		/* nel caso qualcuno volesse modificare commento e note con un solo submit, controllo che non ci sia già un input hidden nella td variable della riga */
		/* uso questo tag input di tipo nascosto per poter eseguire le query nelle funzioni, essendo le variabili dei dati univoche */
		if($this[0].parentNode.getElementsByTagName("td")[0].childNodes.length == 1){
			$hid = $('<input>', {
				type: 'hidden',
				/* le assegno il valore della variabile della riga dove è stata creata una textarea tramite doppio click */
				value: $this[0].parentNode.getElementsByTagName("td")[0].innerHTML,
				name: 'hidVariable'
			/* la aggiungo alla td del campo "Variable" della riga */
			}).appendTo($this[0].parentNode.getElementsByTagName("td")[0]);
		}
    });
}