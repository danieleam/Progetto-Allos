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
				<form action="/PrenotazioniAeree/search" class="d-flex"
					role="search">
					<input class="form-control me-2" type="search" name="keyword"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-secondary" type="submit">Search</button>
				</form>
			</div>
			<div class="col-md-1 my-3 px-0">
				<div class="btn-group">
					<a class="btn btn-success modalInserimentoCompagnia"
						style="width: 160px" data-bs-toggle="modal"
						data-bs-target="#modalInserimentoCompagnia">Nuova compagnia</a> <a
						class="btn btn-success modalInserimentoAereoporto"
						style="width: 110px" data-bs-toggle="modal"
						data-bs-target="#modalInserimentoAereoporto">Nuova città</a>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row m-auto">
				<div class="col-5 px-0">
					<table class="table table-dark table-striped">
						<tr style="text-align: center">
							<th>Id</th>
							<th>Nome</th>
							<th>Cancella</th>
							<th>Modifica</th>
						</tr>

						<c:forEach var="a" items="${aereoporti}">
							<tr style="text-align: center">
								<td>${a.id_aereoporto}</td>
								<td>${a.nome}</td>
								<td><a class="btn btn-danger modalCancellazione" id=""
									data-bs-toggle="modal" data-bs-target="#modalCancellazione">Cancella</a>
								</td>
								<td><a class="btn btn-primary modalModifica" id=""
									data-bs-toggle="modal" data-bs-target="#modalModifica">Modifica</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="btn-group">
						<a
							href="viewCompagnieAereoportiAdmin?scelta=1&paginaAereoporti=1&paginaCompagnie=${paginaCompagnie}"
							class="btn btn-primary">Firstpage</a> <a
							href="viewCompagnieAereoportiAdmin?scelta=1&paginaAereoporti=${paginaAereoporti-1}&paginaCompagnie=${paginaCompagnie}"
							class="btn btn-primary">Previous</a> <a
							href="viewCompagnieAereoportiAdmin?scelta=1&paginaAereoporti=${paginaAereoporti+1}&paginaCompagnie=${paginaCompagnie}"
							class="btn btn-primary">Next</a> <a
							href="viewCompagnieAereoportiAdmin?scelta=1&paginaAereoporti=${nPagineAereoporti}&paginaCompagnie=${paginaCompagnie}"
							class="btn btn-primary">Last page</a>
					</div>
				</div>
				<div class="col"></div>
				<div class="col-5 px-0">
					<table class="table table-dark table-striped">
						<tr style="text-align: center">
							<th>Id</th>
							<th>Nome</th>
							<th>Cancella</th>
							<th>Modifica</th>
						</tr>

						<c:forEach var="c" items="${compagnie}">
							<tr style="text-align: center">
								<td>${c.id_compagnia}</td>
								<td>${c.nome}</td>
								<td><a class="btn btn-danger modalCancellazione" id=""
									data-bs-toggle="modal" data-bs-target="#modalCancellazione">Cancella</a>
								</td>
								<td><a class="btn btn-primary modalModifica" id=""
									data-bs-toggle="modal" data-bs-target="#modalModifica">Modifica</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="btn-group">
						<a
							href="viewCompagnieAereoportiAdmin?scelta=1&paginaCompagnie=1&paginaAereoporti=${paginaAereoporti}"
							class="btn btn-primary">Firstpage</a> <a
							href="viewCompagnieAereoportiAdmin?scelta=1&paginaCompagnie=${paginaCompagnie-1}&paginaAereoporti=${paginaAereoporti}"
							class="btn btn-primary">Previous</a> <a
							href="viewCompagnieAereoportiAdmin?scelta=1&paginaCompagnie=${paginaCompagnie+1}&paginaAereoporti=${paginaAereoporti}"
							class="btn btn-primary">Next</a> <a
							href="viewCompagnieAereoportiAdmin?scelta=1&paginaCompagnie=${nPagineCompagnie}&paginaAereoporti=${paginaAereoporti}"
							class="btn btn-primary">Last page</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="fragments/modalInserimentoAereoporto.jsp"%>
	<%@ include file="fragments/modalInserimentoCompagnia.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>