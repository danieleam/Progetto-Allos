$(document).ready(function() {
	$('#Andata').click(function() {
		if (document.getElementById("Andata").checked) {
			$('#DataRitorno').prop("disabled", true);
		}
	});
	$('#AndataRitorno').click(function() {
		if (document.getElementById("AndataRitorno").checked) {
			$('#DataRitorno').prop("disabled", false);
		}
	});

	//CONTROLLO INCREMENTO ADULTI - BAMBINI
	var numAdulti = 1;
	var numBambini = 0;
	var numViaggiatori = "1 Viaggiatore"
	var num;
	$('#rimuoviAdulto').prop("disabled", true);
	$('#aggiungiAdulto').click(function() {
		if (numAdulti < 8) {
			numAdulti++;
			$('#totaleAdulti').val(numAdulti);
			$('#numAdulti').html(numAdulti);
			num = numViaggiatori.replace(numViaggiatori.charAt(0), numAdulti + numBambini);
			$('#totaleViaggiatori').html(num);
			if (numAdulti != 0)
				$('#rimuoviAdulto').prop("disabled", false);
			if (numAdulti == 8)
				$('#aggiungiAdulto').prop("disabled", true);
		}
	});
	$('#aggiungiBambino').click(function() {
		if (numBambini < 8) {
			numBambini++;
			$('#totaleBambini').val(numBambini);
			$('#numBambini').html(numBambini);
			num = numViaggiatori.replace(numViaggiatori.charAt(0), numBambini + numAdulti);
			$('#totaleViaggiatori').html(num);
			if (numBambini != 0 || numBambini == 8)
				$('#rimuoviBambino').prop("disabled", false);
			if (numBambini == 8)
				$('#aggiungiBambino').prop("disabled", true);
		}
	});

	//CONTROLLO DECREMENTO ADULTI - BAMBINI
	var a = numBambini + numAdulti; //per decrementare il numero totale dei viaggiatori
	$('#rimuoviAdulto').click(function() {
		numAdulti--;
		$('#totaleAdulti').val(numAdulti);
		if (numAdulti <= 1)
			$('#rimuoviAdulto').prop("disabled", true);
		if (numAdulti < 8)
			$('#aggiungiAdulto').prop("disabled", false);
		$('#numAdulti').html(numAdulti);
		num = numViaggiatori.replace(numViaggiatori.charAt(0), numAdulti + numBambini);
		$('#totaleViaggiatori').html(num);
	});

	$('#rimuoviBambino').prop("disabled", true);
	$('#rimuoviBambino').click(function() {
		numBambini--;
		$('#totaleBambini').val(numBambini);
		if (numBambini == 0)
			$('#rimuoviBambino').prop("disabled", true);
		if (numBambini < 8)
			$('#aggiungiBambino').prop("disabled", false);
		$('#numBambini').html(numBambini);
		num = numViaggiatori.replace(numViaggiatori.charAt(0), numBambini + numAdulti);
		$('#totaleViaggiatori').html(num);
	});
});

