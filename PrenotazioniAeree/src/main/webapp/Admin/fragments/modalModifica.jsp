<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal Inserimento Prodotto-->
<div class="modal fade" id="modalModifica" tabindex="-1"
	aria-labelledby="modalModifica" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modifica volo</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<c:url value="/insertVolo" var="voloUrl" />
			<form action="${voloUrl}" method="post">
				<input type="hidden" id="id_volo" value="" name="id_volo"><br>
				<div class="modal-body">
					<div class="row">
						<div clasS="col">
							<label for="cittaPartenza">Citta Partenza</label><br> <select
								class="form-select" name="cittaPartenza">
								<option value="" class="cittaPartenza"></option>
								<c:forEach var="a" items="${aereoporti}">
									<option value="${a.id_aereoporto}">${a.id_aereoporto}
										- ${a.nome}</option>
								</c:forEach>
							</select><br>
						</div>
						<div class="col">
							<label for="cittaArrivo">Citta Arrivo</label><br> <select
								class="form-select" name="cittaArrivo">
								<option value="" class="cittaArrivo"></option>
								<c:forEach var="a" items="${aereoporti}">
									<option value="${a.id_aereoporto}">${a.id_aereoporto}
										- ${a.nome}</option>
								</c:forEach>
							</select><br>
						</div>
					</div>
					<div class="col">
						<label for="compagnia">Compagnia</label><br> <select
							class="form-select" name="compagnia">
							<option value="" class="compagnia"></option>
							<c:forEach var="c" items="${compagnie}">
								<option value="${c.id_compagnia}">${c.id_compagnia}-
									${c.nome}</option>
							</c:forEach>
						</select><br>
					</div>
					<div class="row">
						<div class="col">
							<label for="data">Data</label><br> <input
								class="form-control data" type="date" value="" id="data" name="data"><br>
						</div>
						<div class="col">
							<label for="ora">Ora</label><br> <input class="form-control ora"
								type="text" value="" id="ora" name="ora"><br>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<label for="costo">Costo</label><br> <input
								class="form-control" type="text" value="" id="costo"
								name="costo"><br>
						</div>
						<div class="col">
							<label for="sconto">Sconto</label><br> <input
								class="form-control" type="text" value="" id="sconto"
								name="sconto"><br>
						</div>
						<div class="col">
							<label for="numPasseggeri">Numero Passeggeri</label><br> <input
								class="form-control" type="number" value="" id="numPasseggeri"
								name="numPasseggeri"><br>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Indietro</button>
					<button type="reset" class="btn btn-secondary">Reset</button>
					<button type="submit" class="btn btn-primary">Conferma</button>
				</div>
			</form>
		</div>
	</div>
</div>