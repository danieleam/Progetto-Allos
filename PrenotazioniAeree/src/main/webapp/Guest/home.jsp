<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="Guest/scripts/script.js"></script>
<title>Upward - Biglietti aerei, voli e viaggi</title>
<link rel="icon" type="image/png" href="${logo}" sizes="16x16">
<link href="Guest/css/stilePagine.css" rel="stylesheet" type="text/css">
<style>
.text-shadow-1 { text-shadow: 0 .125rem .25rem rgba(0, 0, 0, .25); }

.card-cover {
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="fragments/navbar.jsp"%>
		<%@ include file="fragments/modalRegistrazione.jsp"%>
	</div>
	<!--CHIUSURA DIV CONTAINER PRINCIPALE-->
	<%@ include file="fragments/carosello.jsp"%>
	<img src="${triangolo}" width="100%" style="position: relative">

	<div class="col"
		style="margin-top: -43%; margin-left: 4%; position: absolute;">
		<b><span style="font-size: 40px; color: white">Entra, Prenota e
			Viaggia!</span></b>
	</div>

	<form class="p-5" action="/PrenotazioniAeree/ricercaVoliAndata" method="get">
		<input type="hidden" id="totaleAdulti" value="1" name="totaleAdulti">
		<input type="hidden" id="totaleBambini" value="0" name="totaleBambini">
		<div class="row px-4 py-5 pt-3 rounded-5"
			style="background-color: rgba(3, 3, 3, 0.75); margin-top: -45%; position: relative;">
			<div class="row">
				<div class="col" style="color: white">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="radioButton" id="AndataRitorno"
							value="AndataRitorno" checked> <label
							class="form-check-label" for="AndataRitorno">Andata/Ritorno</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="radioButton" id="Andata" value="Andata"> <label
							class="form-check-label" for="Andata">Andata</label>
					</div>
				</div>
			</div>
			<div class="col-2">
				<label style="font-size: small; color: white">Da</label> <input
					type="text" id="Da" class="form-control"
					placeholder="Paese, città o aereoporto" name="cittaPartenza"/>
			</div>
			<div class="col-2">
				<label style="font-size: small; color: white">A</label> <input
					type="text" id="A" class="form-control"
					placeholder="Paese, città o aereoporto" name="cittaArrivo"/>
			</div>
			<div class="col-2">
				<label style="font-size: small; color: white">Andata</label> <input
					type="date" id="DataAndata" class="form-control" name="Andata"/>
			</div>
			<div class="col-2">
				<label style="font-size: small; color: white;">Ritorno</label> <input
					type="date" id="DataRitorno" class="form-control" name="Ritorno"/>
			</div>
			<div class="col mt-4">
				<button class="btn dropdown-toggle" style="background-color: white"
					type="button" data-bs-toggle="dropdown" aria-expanded="false" id="totaleViaggiatori">
					1 Viaggiatore</button>
				<div class="dropdown-menu" style="width: 300px; height: 120px;" onclick="event.stopPropagation()">
					<div class="container">
						<div clas="row">
							<div class="col">
								<h7 style="font-size: 17px">Adulti(+12)</h7>
								<button type="button" class="btn rounded-circle p-0" style="margin-left: 65px" id="rimuoviAdulto">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
										fill="currentColor" class="bi bi-dash-circle-fill"
										viewBox="0 0 16 16">
                            <path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z" />
                          </svg>
								</button>
								<span style="font-size: 18px;" id="numAdulti">1</span>
								<button type="button" class="btn rounded-circle p-0" id="aggiungiAdulto">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
										fill="currentColor" class="bi bi-plus-circle-fill"
										viewBox="0 0 16 16">
                            <path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
                          </svg>
								</button>
							</div>
							<!--CHIUSURA DIV COl DROPDOWN ADULTI-->
						</div>
						<!--CHIUSURA DIV ROW DROPDOWN ADULTI-->
						<br>
						<div clas="row">
							<div class="col">
								<h7 style="font-size: 17px">Bambini(0-11)</h7>
								<button type="button" class="btn rounded-circle p-0" style="margin-left: 51px" id="rimuoviBambino">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
										fill="currentColor" class="bi bi-dash-circle-fill"
										viewBox="0 0 16 16">
                            <path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z" />
                          </svg>
								</button>
								<span style="font-size: 18px;" id="numBambini">0</span>
								<button type="button" class="btn rounded-circle p-0" id="aggiungiBambino">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
										fill="currentColor" class="bi bi-plus-circle-fill"
										viewBox="0 0 16 16">
                            <path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z" />
                          </svg>
								</button>
							</div>
							<!--CHIUSURA DIV COL DROPDOWN BAMBINI-->
						</div>
						<!--CHIUSURA DIV ROW DROPDOWN BAMBINI-->
					</div>
					<!--CHIUSURA DIV CONTAINER DROPDOWN VIAGGIATORI-->
				</div>
				<!--CHIUSURA DIV DROPDOWN-MENU VIAGGIATORI-->
			</div>
			<!--CHIUSURA DIV COL MT-4 VIAGGIATORI -->
			<div class="col">
				<button type="submit" class="btn btn-primary px-5"
					style="margin-top: 12%; margin-left: -18%">
					Cerca Voli
					<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
						fill="currentColor" class="bi bi-airplane" viewBox="0 0 16 16"
						style="margin-bottom: 4px">
                <path
							d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z"></path></svg>
				</button>
			</div>
		</div>
		<!--CHIUSURA DIV ROW RIGA 97-->
	</form>
	
	<div class="container">
		<%@ include file="fragments/thumbnail.jsp"%>
	</div>
	<div class="container-fluid">
		<%@ include file="fragments/footer.jsp"%>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>