<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg"
	style="background-color: rgb(27, 104, 197); margin-left: -12px; margin-right: -12px;">
	<div class="container-fluid" style="margin-left: 1%">
		<a class="navbar-brand" href="/PrenotazioniAeree/"> <img
			src="${logo}" alt="" width="50" height="50"> <a
			class="nav-link" href="/PrenotazioniAeree/"
			style="font-size: 200%; margin-top: -7px; color: white">upward</a>
		</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent"
			style="margin-left: 1%">
			<ul class="navbar-nav me-auto ">
				<li class="nav-item"><a class="nav-link" href="#">Voli</a></li>
				<li class="nav-item"><a class="nav-link" href="#">I miei
						viaggi</a></li>
				<li class="nav-item"><a class="nav-link" href="#promo">Promozioni</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Assistenza</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> Informazioni </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Assistenza</a></li>
						<li><a class="dropdown-item" href="#">Chi siamo?</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>
			</ul>
			<c:choose>
				<c:when test="${login=='vero'}">
					<div class="dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" data-bs-display="static"
							aria-expanded="false">${nome}</a>
						<div class="dropdown-menu dropdown-menu-lg-end"
							style="width: 100px;">
							<li><a class="dropdown-item"
								href="/PrenotazioniAeree/logoutUtente?num=1">Logout</a></li>
						</div>
					</div>

				</c:when>
				<c:otherwise>
					<div class="dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" data-bs-display="static"
							aria-expanded="false"> <svg
								xmlns="http://www.w3.org/2000/svg" width="30" height="30"
								fill="currentColor" class="bi bi-person-circle"
								viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                        <path fill-rule="evenodd"
									d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                      </svg>
						</a>
						<div class="dropdown-menu dropdown-menu-lg-end"
							style="width: 310px;">
							<form class="px-2 py-1" action="/PrenotazioniAeree/loginUtente"
								method="post">
								<!-- Email input -->
								<div class="form-outline mb-2">
									<input type="email" id="email" name="email"
										class="form-control" placeholder="E-mail" />
								</div>
								<!-- Password input -->
								<div class="form-outline mb-2">
									<input type="password" id="password" name="password"
										class="form-control" placeholder="Password" />
								</div>

								<!-- 2 column grid layout for inline styling -->
								<div class="row mb-4">
									<div class="col d-flex justify-content-center">
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="form2Example3" checked /> <label
												class="form-check-label" for="form2Example3">
												Remember me </label>
										</div>
									</div>

									<div class="col">
										<!-- Simple link -->
										<a href="#!">Forgot password?</a>
									</div>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<!-- Submit button -->
								<button type="submit" class="btn btn-primary btn-block">Sign
									in</button>
								<hr class="dropdown-divider">
								<span>Non hai un'account?</span> <a href=""
									style="text-decoration: none;" data-bs-toggle="modal"
									data-bs-target="#modalRegistrazione"> <span
									style="color: #0275d8; font-weight: bold">Iscriviti</span></a>
							</form>
						</div>
					</div>

				</c:otherwise>
			</c:choose>
		</div>

	</div>
	<!--CHIUSURA DIV CONTAINER NAVBAR-->
</nav>
