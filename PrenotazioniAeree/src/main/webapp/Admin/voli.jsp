<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="Admin/scripts/scriptModalsVoli.js"></script>
<meta charset="ISO-8859-1">
<title>Lista Voli</title>
</head>
<body>
	<%@ include file="fragments/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row m-auto">
			<div class="col-md-4 offset-md-4 my-3">
				<form action="/PrenotazioniAeree/viewVoliAdmin" class="d-flex"
					role="search">
					<input class="form-control me-2" type="search" name="keyword"
						placeholder="Ricerca per città, compagnia e data" aria-label="Search">
					<button class="btn btn-secondary" type="submit">Search</button>
				</form>
			</div>
			<div class="col-md-1 ms-auto my-3 px-0">
				<a class="btn btn-success modalInserimentoVolo"
					data-bs-toggle="modal" data-bs-target="#modalInserimentoVolo">Nuovo
					volo</a>
			</div>
		</div>
		<div class="row m-auto">
			<div class="col px-0">
				<table class="table table-dark table-striped">
					<tr style="text-align: center">
						<th>Id</th>
						<th>Città Partenza</th>
						<th>Città Arrivo</th>
						<th>Compagnia</th>
						<th>Data</th>
						<th>Ora</th>
						<th>Numero Passeggeri</th>
						<th>Costo</th>
						<th>Sconto</th>
						<th>Cancella</th>
						<th>Modifica</th>
					</tr>

					<c:forEach var="v" items="${voli}">
						<tr style="text-align: center">
							<td>${v.id_volo}</td>
							<td>${v.cittaPartenza.nome}</td>
							<td>${v.cittaArrivo.nome}</td>
							<td>${v.compagnia.nome}</td>
							<td><fmt:formatDate value="${v.data}"></fmt:formatDate></td>
							<td><fmt:formatDate type="time" timeStyle="short"
									value="${v.ora}"></fmt:formatDate></td>
							<td>${v.numPasseggeri}</td>
							<td><fmt:formatNumber type="CURRENCY" value="${v.costo}"
									maxFractionDigits="0" currencySymbol="&#8364;"></fmt:formatNumber></td>
							<td><fmt:formatNumber type="CURRENCY" value="${v.sconto}"
									maxFractionDigits="0" currencySymbol="&#8364;"></fmt:formatNumber></td>
							<td><a class="btn btn-danger modalCancellazione"
								id="${v.id_volo}|${v.cittaPartenza.nome}|${v.cittaArrivo.nome}|${v.data}"
								data-bs-toggle="modal" data-bs-target="#modalCancellazione">Cancella</a>
							</td>
							<td><a class="btn btn-primary modalModifica"
								id="${v.id_volo}|${v.cittaPartenza.id_aereoporto}|${v.cittaPartenza.nome}|${v.cittaArrivo.id_aereoporto}|${v.cittaArrivo.nome}|${v.compagnia.id_compagnia}|${v.compagnia.nome}|${v.data}|${v.ora}|${v.numPasseggeri}|${v.costo}|${v.sconto}"
								data-bs-toggle="modal" data-bs-target="#modalModifica">Modifica</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="btn-group">
					<a href="viewVoliAdmin?scelta=1&pagina=1&keyword=${keyword}" class="btn btn-primary">Firstpage</a>
					<a href="viewVoliAdmin?scelta=1&pagina=${pagina-1}&keyword=${keyword}"
						class="btn btn-primary">Previous</a> <a
						href="viewVoliAdmin?scelta=1&pagina=${pagina+1}&keyword=${keyword}"
						class="btn btn-primary">Next</a> <a
						href="viewVoliAdmin?scelta=1&pagina=${nPagine}&keyword=${keyword}"
						class="btn btn-primary">Last page</a>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="fragments/modalCancellazione.jsp"%>
	<%@ include file="fragments/modalInserimentoVolo.jsp"%>
	<%@ include file="fragments/modalModifica.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>