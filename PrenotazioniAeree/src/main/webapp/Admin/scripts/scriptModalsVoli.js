$(document).ready(function(){
    $('.modalModifica').click(function(){
        var volo=$(this).attr("id");
        var array = volo.split("|");
        
        $('#id_volo').val(array[0]);
        $('#cittaPartenza').val(array[1]);
        $('.cittaPartenza').html(array[2]);
        $('#cittaArrivo').val(array[3]);
        $('.cittaArrivo').html(array[4]);
        $('#compagnia').val(array[5]);
        $('.compagnia').html(array[6]);
        $('.data').val(array[7]);
        $('.ora').val(array[8]);
        $('#numPasseggeri').val(array[9]);
        $('#costo').val(array[10]);
        $('#sconto').val(array[11]);
    });
});

$(document).ready(function(){
    $('.modalCancellazione').click(function(){
        var volo=$(this).attr("id");
        var array = volo.split("|");
		
		$('#linkCancellazione').attr("href", "deleteVolo?id="+array[0]);//id volo
        $('#cittaPartenza').html("Partenza: "+array[1]); //Citta Partenza
        $('#cittaArrivo').html("Arrivo: "+array[2]); //Citta Arrivo
        $('#dataVolo').html("Data volo: "+array[3]); //Data
    });
});
