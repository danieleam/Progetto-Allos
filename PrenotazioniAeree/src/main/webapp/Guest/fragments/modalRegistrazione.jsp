<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal fade" id="modalRegistrazione" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">Registrazione</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<c:url value="/registrazione" var="registrazioneUrl" />
			<form action="${registrazioneUrl}" method="post">
				<div class="modal-body mx-3">
					<div class="md-form mb-5">
						<label>Nome</label> <input type="text" id="Nome" name="nome"
							class="form-control validate"> <label>Cognome</label> <input
							type="text" id="Cognome" name="cognome"
							class="form-control validate"> <label>Data di
							nascita</label> <input type="date" id="orangeForm-pass"
							name="dataNascita" class="form-control validate"> <label>E-mail</label>
						<input type="email" id="orangeForm-email" name="email"
							class="form-control validate"> <label>Password</label> <input
							type="password" id="orangeForm-pass" name="password"
							class="form-control validate">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <!-- Token per la sicurezza CSRF -->
					</div>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="submit" class="btn btn-deep-orange">Registrati</button>
				</div>
			</form>
		</div>
	</div>

</div>
