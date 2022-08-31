<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- Modal Cancellazione-->
<div class="modal fade" id="modalCancellazione" tabindex="-1"
	aria-labelledby="modalCancellazione" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="width:550px">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Sei sicuro di voler confermare l'eliminazione?</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div>
					<p id="cittaPartenza">Partenza:</p>
					<p id="cittaArrivo"></p>
					<p id="dataVolo"></p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Indietro</button>
				<a class="btn btn-danger" id="linkCancellazione" href="">Conferma</a>
			</div>
		</div>
	</div>
</div>