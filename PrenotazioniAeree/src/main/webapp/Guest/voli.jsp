<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Upward - Biglietti aerei, voli e viaggi</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link rel="icon" type="image/png" href="${logo}" sizes="16x16">
<link href="Guest/css/stilePagine.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container-fluid">
		<%@ include file="fragments/navbar.jsp"%>
	</div>
	<img src="${triangolo}" width="100%" style="position: absolute">
	<form class="p-5" action="/PrenotazioniAeree/ricercaVoliAndata"
		method="get">
		<input type="hidden" id="totaleAdulti" value="1" name="totaleAdulti">
		<input type="hidden" id="totaleBambini" value="0" name="totaleBambini">
		<div class="row px-4 py-5 pt-3 rounded-5"
			style="background-color: rgba(3, 3, 3, 0.75); margin-top: 55px; margin-bottom: -6%; position: relative">
			<c:choose>
				<c:when test="${AndataRitorno='vero'}">
					<div class="row">
						<div class="col" style="color: white">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="radioButton"
									id="AndataRitorno" value="AndataRitorno" checked> <label
									class="form-check-label" for="AndataRitorno">Andata/Ritorno</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="radioButton"
									id="Andata" value="Andata"> <label
									class="form-check-label" for="Andata">Andata</label>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="row">
						<div class="col" style="color: white">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="radioButton"
									id="AndataRitorno" value="AndataRitorno"> <label
									class="form-check-label" for="AndataRitorno">Andata/Ritorno</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="radioButton"
									id="Andata" value="Andata" checked> <label
									class="form-check-label" for="Andata">Andata</label>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="col-3">
				<label style="font-size: small; color: white">Da</label> <input
					type="text" id="Da" class="form-control"
					placeholder="Paese, città o aereoporto" name="cittaPartenza"
					value="${voli[0].cittaPartenza.nome}" />
			</div>
			<div class="col-3">
				<label style="font-size: small; color: white">A</label> <input
					type="text" id="A" class="form-control"
					placeholder="Paese, città o aereoporto" name="cittaArrivo"
					value="${voli[0].cittaArrivo.nome}" />
			</div>
			<div class="col-2">
				<label style="font-size: small; color: white">Andata</label> <input
					type="date" id="DataAndata" class="form-control" name="Andata"
					value="${voli[0].data}" />
			</div>
			<c:choose>
				<c:when test="${AndataRitorno=='vero'}">
					<div class="col-2">
						<label style="font-size: small; color: white;">Ritorno</label> <input
							type="date" id="DataRitorno" class="form-control" name="Ritorno"
							value="${dataRitorno}" />
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-2">
						<label style="font-size: small; color: white;">Ritorno</label> <input
							type="date" id="DataRitorno" class="form-control" name="Ritorno"
							disabled />
					</div>
				</c:otherwise>
			</c:choose>
			<div class="col">
				<button type="submit" class="btn btn-primary px-4"
					style="margin-top: 23px; margin-left: 5%">
					Cerca Voli
					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
						fill="currentColor" class="bi bi-airplane" viewBox="0 0 16 16"
						style="margin-bottom: 4px">
                        <path
							d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z"></path>
                    </svg>
				</button>
			</div>
		</div>
		<!--CHIUSURA DIV ROW RIGA 97-->
	</form>
	<c:if test="${voli=='[]'}">
		<h1 style="text-align: center; margin-top: 5%">Non ci sono voli
			per questa tratta</h1>
	</c:if>
	<c:forEach var="v" items="${voli}">
		<div class="container px-5 py-2"
			style="position: relative; margin-top: 3%">
			<div class="card text-center">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><span class="nav-link active"
							aria-current="true">Andata</span></li>
					</ul>
				</div>
				<div class="card-body">
					<h3 class="card-title"></h3>
					<div class="row py-3">
						<div class="col" style="margin-left: 20%">
							<h5>${v.cittaPartenza.nome}</h5>
							<span style="font-size: 12px"></span>
						</div>
						<div class="col ">
							<div style="font-size: 60px; margin-top: -20%">----&#8594;</div>
							<span style="font-size: 15px;">${v.compagnia.nome}</span>
						</div>
						<div class="col" style="margin-right: 20%">
							<h5>${v.cittaArrivo.nome}</h5>
						</div>
						<h5 class="card-text">
							<fmt:formatDate value="${v.data}"></fmt:formatDate>
						</h5>
						<h5 class="card-text">
							<fmt:formatDate type="time" timeStyle="short" value="${v.ora}"></fmt:formatDate>
						</h5>
						<!-- Card -->
						<div class="container text-center">
							<div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
								<div class="col">
									<div class="p-1 px-4">
										<h6>
											${PasseggeriAdulti + PasseggeriBambini}
											<svg xmlns="http://www.w3.org/2000/svg" width="20"
												height="20" fill="currentColor" class="bi bi-person"
												viewBox="0 0 16 19">
                                                <path
													d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                                            </svg>
											<h6>Passeggeri</h6>
										</h6>
									</div>
								</div>
								<!-- prezzo -->
								<div class="col" style="margin-left: 43%">
									<div class="p-3">
										<c:choose>
											<c:when test="${!empty v.sconto}">
												<h5 style="color: red">
													<fmt:formatNumber type="CURRENCY"
														value="${v.sconto*(PasseggeriAdulti+PasseggeriBambini)}"
														maxFractionDigits="0" currencySymbol="&#8364;"></fmt:formatNumber>
													<del style="color: #282828">
														<fmt:formatNumber type="CURRENCY"
															value="${v.costo*(PasseggeriAdulti+PasseggeriBambini)}"
															maxFractionDigits="0" currencySymbol="&#8364;"></fmt:formatNumber>
													</del>
												</h5>
											</c:when>
											<c:otherwise>
												<h5>
													<fmt:formatNumber type="CURRENCY"
														value="${v.costo*(PasseggeriAdulti+PasseggeriBambini)}"
														maxFractionDigits="0" currencySymbol="&#8364;"></fmt:formatNumber>
												</h5>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<!-- button seleziona -->
								<c:choose>
									<c:when test="${AndataRitorno=='vero'}">
										<div class="col" style="margin-left: -5%">
											<div class="p-2" style="margin-left: -25%">
												<a
													href="/PrenotazioniAeree/ricercaVoliRitorno?cittaArrivo=${cittaArrivo}&cittaPartenza=${cittaPartenza}&Ritorno=${dataRitorno}&totaleAdulti=${PasseggeriAdulti}&totaleBambini=${PasseggeriBambini}"
													style="font-size: 18px"
													class="btn  btn-outline-primary btn-sm rounded-3">Seleziona</a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="col" style="margin-left: -5%">
											<div class="p-2" style="margin-left: -25%">
												<a href="/PrenotazioniAeree/checkout"
													style="font-size: 18px"
													class="btn  btn-outline-primary btn-sm rounded-3">Seleziona</a>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<!-- BOOTSTRAP -->


	<script>
	<!-- Gestione Andata/Ritorno -->
		if (document.getElementById("Andata").checked) {
			$('#DataRitorno').prop("disabled", true);
		}
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
	</script>

</body>
</html>